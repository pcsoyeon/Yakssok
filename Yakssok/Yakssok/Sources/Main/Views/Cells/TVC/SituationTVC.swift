//
//  SituationTVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/15.
//

import UIKit

class SituationTVC: UITableViewCell {
    static let identifier = "SituationTVC"
    
    // MARK: - UI
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productTableView: UITableView!
    
    // MARK: - Properties
    
    private var productList = [ProductDataModel]()

    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        setData()
        setTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension SituationTVC {
    private func initUI() {
        contentView.backgroundColor = .mainBackground
        
        titleLabel.text = "배가 더부룩할 때 좋아요!"
        titleLabel.numberOfLines = 1
    }
    
    private func setData() {
        productList.append(contentsOf: [
            ProductDataModel(productImage: "product5", productName: "듀오락 바이탈리티", description: "일반 유산균", ranking: 4.5),
            ProductDataModel(productImage: "product6", productName: "세노비스 바이오틱스", description: "일반 유산균", ranking: 2.5),
            ProductDataModel(productImage: "product7", productName: "센트롬 멀티 구미", description: "종합 영양제", ranking: 3.7),
            ProductDataModel(productImage: "product8", productName: "블랙모어스 플러스 면역", description: "면역 케어", ranking: 3.7)
        ])
    }
    
    private func setTableView() {
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productTableView.separatorStyle = .none
        productTableView.backgroundColor = .mainBackground
        
        productTableView.register(UINib(nibName: ProductTVC.identifier, bundle: nil), forCellReuseIdentifier: ProductTVC.identifier)
    }
}

extension SituationTVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
}

extension SituationTVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTVC.identifier) as? ProductTVC else { return UITableViewCell() }
        cell.initCell(productImage: productList[indexPath.row].productImage, productName: productList[indexPath.row].productName, description: productList[indexPath.row].description, ranking: productList[indexPath.row].ranking)
        return cell
    }
}
