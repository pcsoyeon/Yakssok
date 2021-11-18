//
//  PillMessageVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/18.
//

import UIKit

import AVKit
import Vision

class PillMessageVC: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    
    // MARK: - Properties
    
    let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setAVCapture()
    }
    
    @IBAction func touchUpConfirmButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillMessageDetailVC") else { return }
        dvc.modalTransitionStyle = .crossDissolve
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - Custom Methods

extension PillMessageVC {
    private func initUI() {
        confirmButton.layer.cornerRadius = 30
        confirmButton.layer.masksToBounds = true
    }
}

// MARK: - Capture Methods

extension PillMessageVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
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
