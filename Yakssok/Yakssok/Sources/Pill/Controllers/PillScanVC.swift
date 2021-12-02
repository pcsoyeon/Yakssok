//
//  ViewController.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/12.
//

import UIKit

import AVKit
import Vision

import Lottie

class PillScanVC: UIViewController {

    // MARK: - UI

    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var indicatorView: UIView!
    
    // MARK: - Properties
    
    private var identifier = ""
    private var confidence = 0.0
    
    private let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAVCapture()
        setLottieAnimation()
        
        setGesture()
    }
    
    // MARK: - IB Action
    
    @IBAction func touchUpStopButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Gesture

extension PillScanVC {
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpView))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func touchUpView() {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillScanCompleteVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - Lottie Animations

extension PillScanVC {
    private func setLottieAnimation() {
        let animationView = AnimationView(name:"loading")
        animationView.contentMode = .scaleAspectFit
        
        indicatorView.backgroundColor = .clear
        indicatorView.addSubview(animationView)
        animationView.frame = indicatorView.bounds
        
        animationView.play()
        animationView.loopMode = .loop
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
    
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
//
//        guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
//        let request = VNCoreMLRequest(model: model) { finishedReq, err in
//            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
//            guard let firstObservation = results.first else { return }
//
//            print(firstObservation.identifier, firstObservation.confidence)
//
//            if firstObservation.identifier == "pill bottle" && firstObservation.confidence > 0.3 {
//                self.captureSession.stopRunning()
//                DispatchQueue.main.async {
//                    guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillScanCompleteVC") else { return }
//                    self.navigationController?.pushViewController(dvc, animated: true)
//                }
//
//            }
//        }
//        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
//    }
}

