//
//  PopUpVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/13.
//

import UIKit

class PopUpVC: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var selectionImageView: UIImageView!
    @IBOutlet weak var xImageView: UIImageView!
    
    @IBOutlet weak var pillScanButton: UIButton!
    @IBOutlet weak var storeScanButton: UIButton!
    
    // MARK: - Properties
    
    private var viewTranslation = CGPoint(x: 0, y: 0)
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pillScanButton.addAction(UIAction(handler: { _ in
            let dvc = UIStoryboard(name: "Pill", bundle: nil).instantiateViewController(withIdentifier: "PillGuideVC")
            self.navigationController?.pushViewController(dvc, animated: true)
        }), for: .touchUpInside)
        
        initUI()
        setGesture()
    }
}

// MARK: - Custome Methods

extension PopUpVC {
    private func initUI() {
        self.view.backgroundColor = UIColor(red: 0.0 / 255.0 , green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.5)
    }
    
    private func setGesture() {
        xImageView.isUserInteractionEnabled = true
        xImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
}

// MARK: - @objc

extension PopUpVC {
    @objc
    func handleDismiss(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
