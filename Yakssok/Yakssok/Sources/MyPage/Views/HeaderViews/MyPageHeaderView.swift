//
//  MyPageHeaderView.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/19.
//

import UIKit

class MyPageHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - UI
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let text = self.titleLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.SpoqaHanSansNeo(type: .bold, size: 23)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "이지"))
        self.titleLabel.attributedText = attributeString
    }
}
