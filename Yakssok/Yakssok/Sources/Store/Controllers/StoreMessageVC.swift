//
//  StoreMessageVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/12/02.
//

import UIKit

class StoreMessageVC: UIViewController {

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpXbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpConfirmButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "StoreMessageDetailVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}
