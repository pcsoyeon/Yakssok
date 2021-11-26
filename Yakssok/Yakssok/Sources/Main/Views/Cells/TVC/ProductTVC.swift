//
//  ProductTVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/17.
//

import UIKit

class ProductTVC: UITableViewCell {
    static let identifier = "ProductTVC"
    
    // MARK: - UI
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    
    // MARK: - Life  Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ProductTVC {
    private func initUI() {
        contentView.backgroundColor = .mainBackground
        
        productImageView.backgroundColor = .subBlue
        productImageView.layer.cornerRadius = 20
        productImageView.layer.masksToBounds = true
        
        backView.layer.cornerRadius = 20
        backView.layer.masksToBounds = true
        backView.layer.borderColor = UIColor.systemGray5.cgColor
        backView.layer.borderWidth = 1
    }
}

extension ProductTVC {
    func initCell(productImage: String, productName: String, description: String, ranking: Double) {
        productImageView.image = UIImage(named: productImage)
        productNameLabel.text = productName
        descriptionLabel.text = description
        rankingLabel.text = "\(ranking)"
    }
}
