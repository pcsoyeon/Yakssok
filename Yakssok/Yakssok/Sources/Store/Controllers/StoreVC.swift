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
    @IBOutlet weak var indicatorImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var arScanButton: UIButton!
    
    // MARK: - Properties
    
    private var answers = [String]()
    private var currentIndicator = 1
    
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
        getNotification()
    }
    
    // MARK: - IB Actions
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        answers.removeAll()
        
        switch currentIndicator {
        case 1:
            answers.append(contentsOf: [
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "눈이\n자주 침침해",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "피부가\n건조해",
                "목이\n칼칼해"
            ])
            currentIndicator = 1
            
        case 2:
            answers.append(contentsOf: [
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "눈이\n자주 침침해",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "피부가\n건조해",
                "목이\n칼칼해"
            ])
            currentIndicator = 1
        case 3:
            answers.append(contentsOf: [
                "배가\n자주 꾸룩거려",
                "소화가\n안되는 기분이야",
                "손목이\n욱신거려",
                "손목이\n욱신거려",
                "배가\n자주 꾸룩거려",
                "소화가\n안되는 기분이야",
                "손목이\n욱신거려",
                "손목이\n욱신거려",
            ])
            currentIndicator = 2
        default:
            answers.append(contentsOf: [
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "눈이\n자주 침침해",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "피부가\n건조해",
                "목이\n칼칼해"
            ])
        }
        answerCollectionView.reloadData()
        indicatorImageView.image = UIImage(named: "indicator\(currentIndicator)")
    }
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        answers.removeAll()
        switch currentIndicator {
        case 1:
            answers.append(contentsOf: [
                "배가\n자주 꾸룩거려",
                "소화가\n안되는 기분이야",
                "손목이\n욱신거려",
                "손목이\n욱신거려",
                "배가\n자주 꾸룩거려",
                "소화가\n안되는 기분이야",
                "손목이\n욱신거려",
                "손목이\n욱신거려",
            ])
            currentIndicator = 2
        case 2:
            answers.append(contentsOf: [
                "손목이\n욱신거려",
                "소화가\n안되는 기분이야",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
                "배가\n자주 꾸룩거려",
                "소화가\n안되는 기분이야",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
            ])
            currentIndicator = 3
        case 3:
            answers.append(contentsOf: [
                "손목이\n욱신거려",
                "소화가\n안되는 기분이야",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
                "배가\n자주 꾸룩거려",
                "소화가\n안되는 기분이야",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
            ])
            currentIndicator = 3
        default:
            answers.append(contentsOf: [
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "눈이\n자주 침침해",
                "배가\n자주 꾸룩거려",
                "눈 밑이\n파르르 떨려",
                "다리가\n자주 퉁퉁 부어",
                "피부가\n건조해",
                "목이\n칼칼해"
            ])
        }
        answerCollectionView.reloadData()
        indicatorImageView.image = UIImage(named: "indicator\(currentIndicator)")
    }
    
    @IBAction func touchUpArScanButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "StoreGuideVC") else { return }
        self.answerCollectionView.deselectAll(animated: true)
        self.arScanButton.setImage(UIImage(named: "btnArScan"), for: .normal)
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

extension StoreVC {
    private func initUI() {
        view.backgroundColor = .mainBackground
    }
    
    private func setData() {
        answers.append(contentsOf: [
            "눈 밑이\n파르르 떨려",
            "다리가\n자주 퉁퉁 부어",
            "눈이\n자주 침침해",
            "배가\n자주 꾸룩거려",
            "눈 밑이\n파르르 떨려",
            "다리가\n자주 퉁퉁 부어",
            "피부가\n건조해",
            "목이\n칼칼해"
        ])
    }
    
    private func setCollectionView() {
        answerCollectionView.delegate = self
        answerCollectionView.dataSource = self
        
        answerCollectionView.showsHorizontalScrollIndicator = false
        answerCollectionView.backgroundColor = .mainBackground
        answerCollectionView.allowsMultipleSelection = true
        
        answerCollectionView.register(AnswerCell.self, forCellWithReuseIdentifier: AnswerCell.identifier)
    }
    
    private func getNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveAnswerNotification(_:)), name: NSNotification.Name("AnswerSelected"), object: nil)
    }
    
    @objc
    func didRecieveAnswerNotification(_ notification: Notification) {
        arScanButton.setImage(UIImage(named: "btnArScanActive"), for: .normal)
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
