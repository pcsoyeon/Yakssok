//
//  PopUpVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/13.
//

import UIKit

class PopUpVC: UIViewController {
    
    private var viewTranslation = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setGesture()
    }
   
}

extension PopUpVC {
    private func initUI() {
        self.view.backgroundColor = UIColor(red: 0.0 / 255.0 , green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.5)
    }
}

extension PopUpVC {
    private func setGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    @objc
    func handleDismiss(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
