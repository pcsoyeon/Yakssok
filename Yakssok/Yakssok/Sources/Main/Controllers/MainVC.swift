//
//  MainVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/13.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var customNavigationView: UIView!
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setTableView()
    }
    
}

extension MainVC {
    private func initUI() {
        view.backgroundColor = .mainBackground
        
        setNavigationBar(customNavigationBarView: customNavigationView, title: "", backButtonIsHidden: true)
        
        mainTableView.backgroundColor = .mainBackground
    }
    
    private func setTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mainTableView.separatorColor = .systemGray5
        mainTableView.showsVerticalScrollIndicator = false
        
        mainTableView.register(UINib(nibName: AgeTVC.identifier, bundle: nil), forCellReuseIdentifier: AgeTVC.identifier)
        mainTableView.register(UINib(nibName: SituationTVC.identifier, bundle: nil), forCellReuseIdentifier: SituationTVC.identifier)
        
        let headerNib = UINib(nibName: "MainHeaderView", bundle: nil)
        mainTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "MainHeaderView")
    }
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 304
        } else {
            return 420
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = Bundle.main.loadNibNamed("MainHeaderView", owner: self, options: nil)?.last as! UIView
//        return headerView
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MainHeaderView") as! MainHeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 161
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = UIStoryboard(name: "ProductDetail", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailVC")
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

extension MainVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AgeTVC.identifier) as? AgeTVC else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SituationTVC.identifier) as? SituationTVC else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
