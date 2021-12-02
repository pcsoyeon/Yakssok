//
//  OnboardingNavigationBar.swift
//  Yakssok
//
//  Created by soyeon on 2021/12/03.
//

import UIKit

class OnboardingNavigationBar: UIView {
    
    // MARK: - UI
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btnNaviBack"), for: .normal)
        return button
    }()
    
    // MARK: - Custom Methods
    
    init(vc: UIViewController, backButtonIsHidden: Bool) {
        super.init(frame: .zero)
        
        backButton.isHidden = backButtonIsHidden
        
        setUI()
        setLayout()
        setAction(vc: vc)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .mainBackground
    }
    
    
    private func setLayout() {
        addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        ])
    }
    
    private func setAction(vc: UIViewController) {
        let backAction = UIAction { _ in
            vc.navigationController?.popViewController(animated: true)
        }
        backButton.addAction(backAction, for: .touchUpInside)
    }
}

