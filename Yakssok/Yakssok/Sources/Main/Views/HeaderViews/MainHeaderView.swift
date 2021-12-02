//
//  MainHeaderView.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/17.
//

import UIKit

class MainHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - UI
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .mainBackground
        self.searchTextField.setLeftPaddingPoints(10)
        
        guard let text = self.titleLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.SpoqaHanSansNeo(type: .bold, size: 23)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "쏙쏙이"))
        self.titleLabel.attributedText = attributeString
    }
}
