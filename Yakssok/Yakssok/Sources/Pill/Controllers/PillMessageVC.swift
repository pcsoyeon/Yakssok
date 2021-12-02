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
    @IBOutlet weak var msgImageView: UIImageView!
    
    // MARK: - Properties
    
    let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setAnimation()
        setAVCapture()
    }
    
    // MARK: - IB Action
    
    @IBAction func touchUpXbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpConfirmButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillMessageDetailVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - Custom Methods

extension PillMessageVC {
    private func initUI() {
        confirmButton.layer.cornerRadius = 30
        confirmButton.layer.masksToBounds = true
    }
    
    private func setAnimation() {
        UIView.animate(withDuration: 3.5, animations: {
            self.msgImageView.alpha = 0
        })
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
