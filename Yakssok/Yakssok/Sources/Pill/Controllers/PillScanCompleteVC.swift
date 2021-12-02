//
//  PillScanCompleteVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/18.
//

import UIKit

import AVKit
import Vision

import Lottie

class PillScanCompleteVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var particleView: UIView!
    
    // MARK: - Properties
    
    private let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGesture()
        setLottieAnimation()
        setAVCapture()
    }
    
    // MARK: - IB Action
    
    @IBAction func touchUpXbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Gesture

extension PillScanCompleteVC {
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpView))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func touchUpView() {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillMessageVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - Lottie Animations

extension PillScanCompleteVC {
    private func setLottieAnimation() {
        let animationView = AnimationView(name:"fireflack")
        animationView.contentMode = .scaleAspectFill
        
        particleView.backgroundColor = .clear
        particleView.addSubview(animationView)
        animationView.frame = particleView.bounds
        
        animationView.play()
        animationView.loopMode = .playOnce
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

