//
//  ViewController.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/12.
//

import UIKit

import AVKit
import Vision

class ViewController: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var preView: UIView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setAVCapture()
    }
    
    
}

// MARK: - UI Methods

extension ViewController {
    private func initUI() {
        
    }
}

// MARK: - Capture Methods

extension ViewController: AVCaptureVideoDataOutputSampleBufferDelegate  {
    private func setAVCapture() {
        let captureSession = AVCaptureSession()
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
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}


