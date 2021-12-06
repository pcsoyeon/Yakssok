//
//  DocInfoCVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/12/07.
//

import UIKit

class DocInfoCVC: UICollectionViewCell {
    static let identifier = "DocInfoCVC"

    @IBOutlet weak var docInfoTableView: UITableView!
    
    // MARK: - Properties
    
    private var docInfos = [DocInfoDataModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTableView()
        setData()
    }
}

extension DocInfoCVC {
    func initUI() {
        
    }
    
    func setTableView() {
        docInfoTableView.delegate = self
        docInfoTableView.dataSource = self
        
        docInfoTableView.backgroundColor = .mainBackground
        docInfoTableView.showsVerticalScrollIndicator = false
        docInfoTableView.separatorStyle = .none
        docInfoTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        let nib = UINib(nibName: DocInfoTVC.identifier, bundle: nil)
        docInfoTableView.register(nib, forCellReuseIdentifier: DocInfoTVC.identifier)
    }
    
    func setData() {
        docInfos.append(contentsOf: [
            DocInfoDataModel(docImage: "imgUser1", docName: "김둥근", docMajor: "[가정의학]", rankingImage: "icnRanking2", ranking: 5.0, docDescription:
                             """
                             월경 전 여러 증상 완화, 월경 전 긴장증, 부종, 경련
                             요통 및 두통에 특히 효과적이고 대부분의 사람들에게
                             큰 부작용 없이 좋은 효과를 줄 수 있을 거라 생각해요.
                             """, date: ""),
            DocInfoDataModel(docImage: "imgUser2", docName: "이재근", docMajor: "[가정의학]", rankingImage: "icnRanking3", ranking: 3.0, docDescription: """
                             약이 굉장히 순하기 때문에 짧은 시간에 빠른 효과를
                             보시려면 이 영양제를 추천하지 않아요 ㅠㅠ
                             그 대신 저는 ‘락토일레븐’이라는 제품을 추천합니다.
                             """, date: "")
        ])
    }
}

extension DocInfoCVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 194
    }
}

extension DocInfoCVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DocInfoTVC.identifier) as? DocInfoTVC else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.initCell(docInfo: docInfos[indexPath.row])
        return cell
    }
}
