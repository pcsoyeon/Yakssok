//
//  PillGuideVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/17.
//

import UIKit

import AVKit
import Vision

class PillGuideVC: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var guideImageView: UIImageView!
    
    let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setAVCapture()
    }
    
    
}

extension PillGuideVC {
    private func initUI() {
        guideImageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpGuideImage))
        guideImageView.addGestureRecognizer(tapGesture)
        guideImageView.isUserInteractionEnabled = true
    }
    
    @objc
    func touchUpGuideImage() {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillScanVC") else { return }
        dvc.modalTransitionStyle = .crossDissolve
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - Capture Methods

extension PillGuideVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
    private func setAVCapture() {
        captureSession.sessionPreset = .high
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        preView.layer.addSublayer(previewLayer)
        previewLayer.frame = preView.bounds
    }
}


