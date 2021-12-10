//
//  StoreMessageDetailVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/12/02.
//

import UIKit

class StoreMessageDetailVC: UIViewController {

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Actions
    
    @IBAction func touchUpHomeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpDetailButton(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "ProductDetail", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC else { return }
        dvc.productImage = "scanProduct"
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}
