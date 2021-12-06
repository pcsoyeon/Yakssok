//
//  DocInfoTVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/12/07.
//

import UIKit

class DocInfoTVC: UITableViewCell {
    static let identifier = "DocInfoTVC"
    
    // MARK: - UI
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var docImageView: UIImageView!
    
    @IBOutlet weak var docNameLabel: UILabel!
    @IBOutlet weak var docMajorLabel: UILabel!
    
    @IBOutlet weak var rankingImageView: UIImageView!
    @IBOutlet weak var rankingLabel: UILabel!
    
    @IBOutlet weak var docDescriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension DocInfoTVC {
    func initUI() {
        backView.layer.borderColor = UIColor.systemGray5.cgColor
        backView.layer.borderWidth = 1
        backView.layer.cornerRadius = 6
        backView.layer.masksToBounds = true
    }
}

extension DocInfoTVC {
    func initCell(docInfo: DocInfoDataModel) {
        docImageView.image = UIImage(named: docInfo.docImage)
        
        docNameLabel.text = docInfo.docName
        docMajorLabel.text = docInfo.docMajor
        docDescriptionLabel.text = docInfo.docDescription
        
        rankingImageView.image = UIImage(named: docInfo.rankingImage)
        rankingLabel.text = "\(docInfo.ranking)"
    }
}
