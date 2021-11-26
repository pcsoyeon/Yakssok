//
//  PillMessageDetailVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/18.
//

import UIKit

import AVKit
import Vision

class PillMessageDetailVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var preView: UIView!
    
    // MARK: - Properties
    
    private let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAVCapture()
    }
    
    @IBAction func touchUpHomeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Capture Methods

extension PillMessageDetailVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
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

