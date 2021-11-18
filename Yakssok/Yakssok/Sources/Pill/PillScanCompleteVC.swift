//
//  PillScanCompleteVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/18.
//

import UIKit

import AVKit
import Vision

class PillScanCompleteVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var dialogImageView: UIImageView!
    
    // MARK: - Properties
    
    let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGestures()
        setAVCapture()
    }
    
}

// MARK: - Custom Methods

extension PillScanCompleteVC {
    private func setGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpDialogImage))
        dialogImageView.addGestureRecognizer(tapGesture)
        dialogImageView.isUserInteractionEnabled = true
    }
    
    @objc
    func touchUpDialogImage() {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillMessageVC") else { return }
        dvc.modalTransitionStyle = .crossDissolve
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - Capture Methods

extension PillScanCompleteVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
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
