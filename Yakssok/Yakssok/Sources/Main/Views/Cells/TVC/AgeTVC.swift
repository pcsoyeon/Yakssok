//
//  AgeTVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/15.
//

import UIKit

class AgeTVC: UITableViewCell {
    static let identifier = "AgeTVC"
    
    // MARK: - UI

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var productList = [ProductDataModel]()
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        setData()
        setCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension AgeTVC {
    private func initUI() {
        contentView.backgroundColor = .mainBackground
        
        titleLabel.text = "20대 여성들이 선호해요!"
        titleLabel.numberOfLines = 1
    }
    
    private func setCollectionView() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        productCollectionView.backgroundColor = .mainBackground
        productCollectionView.showsHorizontalScrollIndicator = false
        
        productCollectionView.register(UINib(nibName: AgeCVC.identifier, bundle: nil), forCellWithReuseIdentifier: AgeCVC.identifier)
    }
    
    private func setData() {
        productList.append(contentsOf: [
            ProductDataModel(productImage: "image1", productName: "블랙모어스", description: "프로바이오틱스", ranking: 4.5),
            ProductDataModel(productImage: "image2", productName: "GNC 철분 18", description: "엽산/철분제", ranking: 2.5),
            ProductDataModel(productImage: "image3", productName: "얼라이브 데일리", description: "종합 비타민", ranking: 3.7),
            ProductDataModel(productImage: "image4", productName: "종근당 유산균", description: "프로바이오틱스", ranking: 4.2)
        ])
    }
}

extension AgeTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 28 - 60) / 2
        return CGSize(width: cellWidth, height: 194)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 21, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}

extension AgeTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgeCVC.identifier, for: indexPath) as? AgeCVC else { return UICollectionViewCell() }
        cell.initCell(productImage: productList[indexPath.row].productImage, productName: productList[indexPath.row].productName, description: productList[indexPath.row].description)
        return cell
    }
}
