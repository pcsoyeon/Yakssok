//
//  ProductDetailVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/18.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var customNavigationView: UIView!
    @IBOutlet weak var productBackView: UIView!

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(customNavigationBarView: customNavigationView, title: "", backButtonIsHidden: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
}

extension ProductDetailVC {
    private func initUI() {
        productBackView.layer.cornerRadius = 5
        productBackView.layer.masksToBounds = true
        
        backView.backgroundColor = .mainBackground
        view.backgroundColor = .mainBackground
    }
}
