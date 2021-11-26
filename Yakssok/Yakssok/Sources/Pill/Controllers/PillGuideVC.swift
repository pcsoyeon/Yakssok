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
    @IBOutlet weak var dialogImageView: UIImageView!
    
    // MARK: - Properties
    
    let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGestures()
        setAVCapture()
    }
    
    // MARK: - IB Action
    
    @IBAction func touchUpXbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Custom Methods

extension PillGuideVC {
    private func setGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpDialogImage))
        dialogImageView.addGestureRecognizer(tapGesture)
        dialogImageView.isUserInteractionEnabled = true
    }
    
    @objc
    func touchUpDialogImage() {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillScanVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
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


