//
//  StoreScanVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/26.
//

import UIKit

import AVKit
import Vision

import Lottie

class StoreScanVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var preView: UIView!
    
    // MARK: - Properties
    
    private var confidence = 0.0
    private let captureSession = AVCaptureSession()
    
    @IBOutlet weak var particleView: UIView!
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLottieAnimation()
        setAVCapture()
    }
    
    @IBAction func touchUpStopButton(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - Animation

extension StoreScanVC {
    private func setLottieAnimation() {
        let animationView = AnimationView(name:"loading")
        animationView.contentMode = .scaleAspectFit
        
        particleView.backgroundColor = .clear
        particleView.addSubview(animationView)
        animationView.frame = particleView.bounds
        
        animationView.play()
        animationView.loopMode = .loop
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5) {
            UIView.animate(withDuration: 5.5, animations: {
                guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "StoreScanCompleteVC") else { return }
                self.navigationController?.pushViewController(dvc, animated: true)
            })
        }
    }
}

// MARK: - AVCapture

extension StoreScanVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
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

