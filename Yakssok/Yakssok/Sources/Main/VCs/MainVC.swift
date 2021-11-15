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
    
    // MARK: - Properties

    
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
}

extension MainVC {
    private func setTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        mainTableView.register(UINib(nibName: AgeTVC.identifier, bundle: nil), forCellReuseIdentifier: AgeTVC.identifier)
        mainTableView.register(UINib(nibName: SituationTVC.identifier, bundle: nil), forCellReuseIdentifier: SituationTVC.identifier)
    }
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 304
        } else {
            return 374
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 161
        } else {
            return 0
        }
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
