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
    
    @IBOutlet weak var particleView: UIView!
    
    // MARK: - Properties
    
    private let captureSession = AVCaptureSession()
    
    private let emitterLayer = CAEmitterLayer()
    private let dimension = 3
    private var imagesNames = ["particle1", "particle2", "particle3"]
    private var velocities = [50, 100, 150, 200]
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGestures()
        setAVCapture()
        
        setUpEmitterLayer()
        playParticleAnimation()
    }
    
    // MARK: - IB Action
    
    @IBAction func touchUpXbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
        self.navigationController?.pushViewController(dvc, animated: true)
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

// MARK: - Set Particle Animation

extension PillScanCompleteVC {
    private func setUpEmitterLayer() {
        emitterLayer.emitterCells = generateConfettiEmitterCells()
    }
    
    private func generateConfettiEmitterCells() -> [CAEmitterCell]  {
        var cells = [CAEmitterCell]()
        
        for index in 0..<10 {
            let cell = CAEmitterCell()
            cell.contents = nextImage(i: index)
            
            cell.lifetime = 3
            cell.birthRate = 100
            
            cell.scale = 0.5
            cell.scaleRange = 1
            
            cell.spin = 5
            cell.spinRange = 20
            
            cell.emissionRange = CGFloat.pi * 2
            
            cell.velocity = 400
            cell.velocityRange = 50
            
            cell.yAcceleration = 1200
            
            cells.append(cell)
        }
        
        return cells
    }
    
    var randomNumber: Int {
        return Int(arc4random_uniform(UInt32(dimension)))
    }
    
    var randomVelocity: Int {
        return velocities[randomNumber]
    }
    
    private func nextImage(i: Int) -> CGImage? {
        let image = UIImage(named: imagesNames[i % dimension])
        return image?.cgImage
    }
    
    private func playParticleAnimation() {
        particleView.backgroundColor = .clear
        
        let x = particleView.center.x
        let y = particleView.center.x / 2
        
        emitterLayer.emitterPosition = CGPoint(x: x, y: y)
        
        emitterLayer.birthRate = 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            self?.emitterLayer.birthRate = 0
        }
        
        particleView.layer.addSublayer(emitterLayer)
    }
}
