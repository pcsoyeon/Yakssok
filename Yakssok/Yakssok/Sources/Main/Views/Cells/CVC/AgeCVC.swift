//
//  AgeCVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/15.
//

import UIKit

class AgeCVC: UICollectionViewCell {
    static let identifier = "AgeCVC"
    
    // MARK: - UI
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
}

extension AgeCVC {
    private func initUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
    }
}

extension AgeCVC {
    func initCell(productImage: String, productName: String, description: String) {
        productImageView.image = UIImage(named: productImage)
        productNameLabel.text = productName
        descriptionLabel.text = description
    }
}
