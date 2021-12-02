//
//  StoreGuideVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/26.
//

import UIKit

import AVKit
import Vision

class StoreGuideVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var preView: UIView!
    
    // MARK: - Properties

    private var confidence = 0.0
    private let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGesture()
        setAVCapture()
    }
}

// MARK: - Gesture

extension StoreGuideVC {
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpView))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func touchUpView() {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "StoreScanVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - AVCapture

extension StoreGuideVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
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
}
