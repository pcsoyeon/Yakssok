//
//  StoreScanCompleteVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/26.
//

import UIKit

import AVKit
import Vision

import Lottie

class StoreScanCompleteVC: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var particleView: UIView!
    @IBOutlet weak var dialogImageView: UIImageView!
    
    // MARK: - Properties
    
    private var confidence = 0.0
    private let captureSession = AVCaptureSession()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setGesture()
        setLottieAnimation()
    }
}

// MARK: - Custom Methods

extension StoreScanCompleteVC {
    private func initUI() {
        dialogImageView.isHidden = true
    }
}


// MARK: - Gesture

extension StoreScanCompleteVC {
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpView))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func touchUpView() {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "StoreScanDetailVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - Lottie Animations

extension StoreScanCompleteVC {
    private func setLottieAnimation() {
        let animationView = AnimationView(name:"fireflack")
        animationView.contentMode = .scaleAspectFill
        
        particleView.backgroundColor = .clear
        particleView.addSubview(animationView)
        animationView.frame = particleView.bounds
        
        animationView.play()
        animationView.loopMode = .playOnce
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            UIView.animate(withDuration: 5.5, animations: {
                self.dialogImageView.isHidden = false
            })
        }
    }
}
