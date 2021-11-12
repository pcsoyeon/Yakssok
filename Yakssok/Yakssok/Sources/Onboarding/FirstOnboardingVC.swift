//
//  FirstOnboardingVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/13.
//

import UIKit

class FirstOnboardingVC: UIViewController {

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
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondOnboardingVC") as? SecondOnboardingVC else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
}

extension FirstOnboardingVC {
    private func setUI() {
        if let image = UIImage(named: "Character") {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFill
        
        if let image = UIImage(named: "Indicator1") {
            indicatorImageView.image = image
        }
        
        nextButton.layer.cornerRadius = 25
        nextButton.layer.masksToBounds = true
    }
}


