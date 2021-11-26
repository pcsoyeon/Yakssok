//
//  MyPageHeaderView.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/19.
//

import UIKit

class MyPageHeaderView: UIView {
    
    // MARK: - UI
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
