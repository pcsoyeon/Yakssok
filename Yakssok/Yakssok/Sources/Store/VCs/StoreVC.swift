//
//  StoreVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/17.
//

import UIKit

class StoreVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var customNavigationView: UIView!
    @IBOutlet weak var answerCollectionView: UICollectionView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    
    private var answers = [String]()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        setNavigationBar(customNavigationBarView: customNavigationView, title: "", backButtonIsHidden: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setData()
        setCollectionView()
    }
    
    // MARK: - IB Actions
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        // collectionView reload
    }
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        // colllectionView reload
    }
}

extension StoreVC {
    func initUI() {
        view.backgroundColor = .mainBackground
    }
    
    func setData() {
        answers.append(contentsOf: [
            "눈 밑이\n파르르 떨려",
            "다리가\n자주 퉁퉁 부어",
            "눈이\n자주 침침해",
            "배가\n자주 꾸룩거려",
            "소화가\n안되는 기분이야",
            "손목이\n욱신거려",
            "피부가\n건조해",
            "목이\n칼칼해"
        ])
    }
    
    func setCollectionView() {
        answerCollectionView.delegate = self
        answerCollectionView.dataSource = self
        
        answerCollectionView.showsHorizontalScrollIndicator = false
        answerCollectionView.backgroundColor = .mainBackground
        
        answerCollectionView.register(AnswerCell.self, forCellWithReuseIdentifier: AnswerCell.identifier)
    }
}

// MARK: - CollectionView Delegate

extension StoreVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 10) / 2
        let cellHeight = (collectionView.frame.height - 40) / 4
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}


// MARK: - CollectionView DataSource

extension StoreVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswerCell.identifier, for: indexPath) as? AnswerCell else { return UICollectionViewCell() }
        cell.initCell(answer: answers[indexPath.row])
        return cell
    }
}
