//
//  MainHeaderView.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/17.
//

import UIKit

class MainHeaderView: UIView {
    
    // MARK: - Initializers 
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        initUI()
    }
}

extension MainHeaderView {
    private func initUI() {
        self.backgroundColor = .mainBackground
    }
}
