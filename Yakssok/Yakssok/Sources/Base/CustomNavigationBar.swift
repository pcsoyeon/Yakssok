//
//  CustomNavigationBar.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/18.
//

import UIKit

class CustomNavigationBar: UIView {
    
    // MARK: - UI
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icBack"), for: .normal)
        return button
    }()
    
    var titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // MARK: - Custom Methods
    
    init(vc: UIViewController, title: String, backButtonIsHidden: Bool) {
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
        addSubview(titleImageView)
        addSubview(separatorView)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            titleImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func setAction(vc: UIViewController) {
        let backAction = UIAction { _ in
            vc.navigationController?.popViewController(animated: true)
        }
        backButton.addAction(backAction, for: .touchUpInside)
    }
}
