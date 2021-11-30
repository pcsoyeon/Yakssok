//
//  MyPageVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/13.
//

import UIKit

class MyPageVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var customNavigationView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    
    // MARK: - Properties
    
    private var firstSectionData = [String]()
    private var secondSectionData = [String]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setData()
        setTableView()
    }
}

extension MyPageVC {
    private func initUI() {
        setNavigationBar(customNavigationBarView: customNavigationView, title: "", backButtonIsHidden: true)
    }
    
    private func setTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        myTableView.backgroundColor = .mainBackground
        
        myTableView.register(UINib(nibName: MyPageTVC.identifier, bundle: nil), forCellReuseIdentifier: MyPageTVC.identifier)
        
        let headerNib = UINib(nibName: "MyPageHeaderView", bundle: nil)
        myTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "MyPageHeaderView")
    }
    
    private func setData() {
        firstSectionData.append(contentsOf: [
            "회원 정보 수정",
            "나의 건강 모아보기"
        ])
        
        secondSectionData.append(contentsOf: [
            "공지사항",
            "1:1 문의",
            "이용약관",
            "개인정보 처리방침"
        ])
    }
}

extension MyPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 185
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyPageHeaderView") as! MyPageHeaderView
        return headerView
    }
}

extension MyPageVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return firstSectionData.count
        case 1:
            return secondSectionData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTVC.identifier) as? MyPageTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.initCell(title: firstSectionData[indexPath.row])
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTVC.identifier) as? MyPageTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.initCell(title: secondSectionData[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
        
    }
}
