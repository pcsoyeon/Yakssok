//
//  MyTVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/19.
//

import UIKit

class MyPageTVC: UITableViewCell {
    static let identifier = "MyPageTVC"

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MyPageTVC {
    func initCell(title: String) {
        titleLabel.text = title
    }
}
