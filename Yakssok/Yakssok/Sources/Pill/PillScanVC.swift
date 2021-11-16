//
//  ViewController.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/12.
//

import UIKit

import AVKit
import Vision

class PillScanVC: UIViewController {

    // MARK: - UI

    @IBOutlet weak var preView: UIView!
    
    // MARK: - Properties
    
    private var identifier = ""
    private var confidence = 0.0
    
    let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setAVCapture()
        getNotification()
    }
    
    
}

// MARK: - UI Methods

extension PillScanVC {
    private func initUI() {
        
    }
    
    private func getNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showMessage(_:)), name: NSNotification.Name("Pill"), object: nil)
    }
    @objc
    func showMessage(_ notification: Notification) {
        print("notification called")
    }
}

// MARK: - Capture Methods

extension PillScanVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
    private func setAVCapture() {
        captureSession.sessionPreset = .high
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        preView.layer.addSublayer(previewLayer)
        previewLayer.frame = preView.bounds
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
        let request = VNCoreMLRequest(model: model) { finishedReq, err in
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            if firstObservation.identifier == "pill bottle" && firstObservation.confidence > 0.8 {
                self.captureSession.stopRunning()
                DispatchQueue.main.async {
                    
                }
                
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        
    }
}


