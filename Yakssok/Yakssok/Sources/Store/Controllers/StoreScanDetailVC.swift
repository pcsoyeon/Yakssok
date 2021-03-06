//
//  StoreScanDetailVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/26.
//

import UIKit

class StoreScanDetailVC: UIViewController {

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
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "StoreMessageVC") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}
