//
//  AnswerCell.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/25.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    static let identifier = "AnswerCell"
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnswerCell {
    private func initUI() {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        
        contentView.backgroundColor = .mainBlue
    }
    
    private func setLayout() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension AnswerCell {
    func initCell(answer: String) {
        self.titleLabel.text = answer
    }
}
