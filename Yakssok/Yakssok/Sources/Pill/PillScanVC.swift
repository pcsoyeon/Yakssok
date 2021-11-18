//
//  ViewController.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/12.
//

import UIKit

import AVKit
import Vision

class PillScanVC: UIViewController {

    // MARK: - UI

    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var ellipseView: UIImageView!
    
    // MARK: - Properties
    
    private var identifier = ""
    private var confidence = 0.0
    
    let captureSession = AVCaptureSession()
    
    private let emitterLayer = CAEmitterLayer()
    private let dimension = 3
    private var imagesNames = ["particle1", "particle2", "particle3"]
    private var velocities = [50, 100, 150, 200]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAVCapture()
    }
    
    // MARK: - IB Action
    
    @IBAction func touchUpXbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Capture Methods

extension PillScanVC: AVCaptureVideoDataOutputSampleBufferDelegate  {
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
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
        let request = VNCoreMLRequest(model: model) { finishedReq, err in
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            if firstObservation.identifier == "pill bottle" && firstObservation.confidence > 0.3 {
                self.captureSession.stopRunning()
                DispatchQueue.main.async {
//                    guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "PillScanCompleteVC") else { return }
//                    dvc.modalTransitionStyle = .crossDissolve
//                    dvc.modalPresentationStyle = .fullScreen
//                    self.present(dvc, animated: true, completion: nil)
                    
                    let x = self.view.center.x
                    let y = self.view.center.x
                    
                    self.emitterLayer.emitterPosition = CGPoint(x: x, y: y)
                    
                    self.emitterLayer.birthRate = 1
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
                        self?.emitterLayer.birthRate = 0
                    }
                    
                    self.ellipseView.layer.addSublayer(self.emitterLayer)
                }
                
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        
    }
    
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
            
            cell.scale = 0.15
            cell.scaleRange = 0.05
            
            cell.spin = 5
            cell.spinRange = 10
            
            cell.emissionRange = CGFloat.pi * 2
            
            cell.velocity = 700
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
    
    private func showDialog() {
        
    }
}


