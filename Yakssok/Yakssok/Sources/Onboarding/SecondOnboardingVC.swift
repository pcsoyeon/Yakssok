//
//  SecondOnboardingVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/12.
//

import UIKit

class SecondOnboardingVC: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicatorImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    // MARK: - IB Actions
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdOnboardingVC") as? ThirdOnboardingVC else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }

}

extension SecondOnboardingVC {
    private func setUI() {
        if let image = UIImage(named: "Guide") {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFill
        
        if let image = UIImage(named: "Indicator2") {
            indicatorImageView.image = image
        }
        
        nextButton.layer.cornerRadius = 25
        nextButton.layer.masksToBounds = true
    }
}
