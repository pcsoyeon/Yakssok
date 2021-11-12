//
//  ThirdOnboardingVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/12.
//

import UIKit

class ThirdOnboardingVC: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicatorImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    // MARK: - IB Actions
    @IBAction func touchUpNextButton(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as? MainVC else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

extension ThirdOnboardingVC {
    private func setUI() {
        if let image = UIImage(named: "Message") {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFill
        
        if let image = UIImage(named: "Indicator3") {
            indicatorImageView.image = image
        }
        
        nextButton.layer.cornerRadius = 25
        nextButton.layer.masksToBounds = true
    }
}
