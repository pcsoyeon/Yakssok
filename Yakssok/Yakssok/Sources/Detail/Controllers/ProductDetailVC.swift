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
    
    @IBOutlet weak var likeImageView: UIImageView!
    
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var statusMovedView: UIView!
    @IBOutlet weak var pillInfoLabel: UILabel!
    @IBOutlet weak var docInfoLabel: UILabel!
    
    // MARK: - Properties
    
    private var isFilled: Bool = false
    private var currentIndex = 0
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(customNavigationBarView: customNavigationView, title: "", backButtonIsHidden: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setGesture()
        setCollectionView()
        setTextLabelGesture()
    }
}

extension ProductDetailVC {
    private func initUI() {
        productBackView.layer.cornerRadius = 5
        productBackView.layer.masksToBounds = true
        
        backView.backgroundColor = .mainBackground
        view.backgroundColor = .mainBackground
    }
    
    private func setGesture() {
        likeImageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedLikeImage))
        likeImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func tappedLikeImage() {
        if isFilled {
            likeImageView.image = UIImage(named: "icnLikeFilled")
        } else {
            likeImageView.image = UIImage(named: "icnLike")
        }
        isFilled.toggle()
    }
    
    private func setCollectionView() {
        let infoCollectionViewlayout = infoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        infoCollectionViewlayout?.scrollDirection = .horizontal
        infoCollectionViewlayout?.estimatedItemSize = .zero
        
        infoCollectionView.showsHorizontalScrollIndicator = false
        infoCollectionView.showsVerticalScrollIndicator = false
        infoCollectionView.backgroundColor = .mainBackground
        
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
        
        infoCollectionView.register(UINib(nibName: PillInfoCVC.identifier, bundle: nil), forCellWithReuseIdentifier: PillInfoCVC.identifier)
        infoCollectionView.register(UINib(nibName: DocInfoCVC.identifier, bundle: nil), forCellWithReuseIdentifier: DocInfoCVC.identifier)
    }
    
    private func setTextLabelGesture() {
        let tapProceedLabelGesture = UITapGestureRecognizer(target: self, action: #selector(tapProceedLabel))
        pillInfoLabel.addGestureRecognizer(tapProceedLabelGesture)
        pillInfoLabel.isUserInteractionEnabled = true
        
        let tapCompleteLabelGesture = UITapGestureRecognizer(target: self, action: #selector(dragToProceed))
        docInfoLabel.addGestureRecognizer(tapCompleteLabelGesture)
        docInfoLabel.isUserInteractionEnabled = true
    }
}

// MARK: - @objc

extension ProductDetailVC {
    @objc
    private func tapProceedLabel() {
        if currentIndex == 1 {
            let indexPath = IndexPath(item: 0, section: 0)
            infoCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            UIView.animate(withDuration: 0.3) {
                self.statusMovedView.transform = .identity
            }
            currentIndex = 0
            self.pillInfoLabel.textColor = .textDarkGrey
            self.pillInfoLabel.font = .SpoqaHanSansNeo(type: .bold, size: 16)
            self.docInfoLabel.textColor = .textDarkGrey
            self.docInfoLabel.font = .SpoqaHanSansNeo(type: .regular, size: 16)
        }
    }
    
    @objc
    private func dragToProceed() {
        let indexPath = IndexPath(item: 1, section: 0)
        infoCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        if currentIndex == 0 {
            UIView.animate(withDuration: 0.3) {
                self.statusMovedView.transform = CGAffineTransform(translationX: 189, y: 0)
            }
            currentIndex = 1
            self.pillInfoLabel.textColor = .textDarkGrey
            self.pillInfoLabel.font = .SpoqaHanSansNeo(type: .regular, size: 16)
            self.docInfoLabel.textColor = .textDarkGrey
            self.docInfoLabel.font = .SpoqaHanSansNeo(type: .bold, size: 16)
        }
    }
}

extension ProductDetailVC: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let targetIndex = targetContentOffset.pointee.x / scrollView.frame.size.width
        if targetIndex == 1 && currentIndex == 0 {
            UIView.animate(withDuration: 0.5) {
                self.statusMovedView.transform = CGAffineTransform(translationX: 189, y: 0)
            }
            currentIndex = 1
            self.pillInfoLabel.textColor = .textDarkGrey
            self.pillInfoLabel.font = .SpoqaHanSansNeo(type: .regular, size: 16)
            self.docInfoLabel.textColor = .textDarkGrey
            self.docInfoLabel.font = .SpoqaHanSansNeo(type: .bold, size: 16)
        } else if targetIndex == 0 && currentIndex == 1 {
            UIView.animate(withDuration: 0.5) {
                self.statusMovedView.transform = .identity
            }
            currentIndex = 0
            self.pillInfoLabel.textColor = .textDarkGrey
            self.pillInfoLabel.font = .SpoqaHanSansNeo(type: .bold, size: 16)
            self.docInfoLabel.textColor = .textDarkGrey
            self.docInfoLabel.font = .SpoqaHanSansNeo(type: .regular, size: 16)
        }
    }
}

extension ProductDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ProductDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PillInfoCVC.identifier, for: indexPath) as? PillInfoCVC else {
                return UICollectionViewCell()
            }
            return cell
        } else if indexPath.row == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DocInfoCVC.identifier, for: indexPath) as? DocInfoCVC else {
                return UICollectionViewCell()
            }
            return cell
        }
        return UICollectionViewCell()
    }
}
