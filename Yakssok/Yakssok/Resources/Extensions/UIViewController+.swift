//
//  UIViewController+.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/18.
//

import UIKit

extension UIViewController {
    func setupStatusBar(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            let margin = view.layoutMarginsGuide
            let statusbarView = UIView()
            statusbarView.backgroundColor = color
            statusbarView.frame = CGRect.zero
            view.addSubview(statusbarView)
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                statusbarView.topAnchor.constraint(equalTo: view.topAnchor),
                statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
                statusbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                statusbarView.bottomAnchor.constraint(equalTo: margin.topAnchor)
            ])
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = color
        }
    }
    
    func setNavigationBar(customNavigationBarView: UIView, title: String, backButtonIsHidden: Bool) {
        let navigationBar = CustomNavigationBar(vc: self, title: title, backButtonIsHidden: backButtonIsHidden)
        
        customNavigationBarView.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: customNavigationBarView.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: customNavigationBarView.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: customNavigationBarView.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: customNavigationBarView.bottomAnchor)
        ])
        
        setupStatusBar(.mainBackground)
    }
    
    func onboardingNavigationBar(customNavigationBarView: UIView, backButtonIsHidden: Bool) {
        let navigationBar = OnboardingNavigationBar(vc: self, backButtonIsHidden: backButtonIsHidden)
        
        customNavigationBarView.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: customNavigationBarView.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: customNavigationBarView.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: customNavigationBarView.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: customNavigationBarView.bottomAnchor)
        ])
        
        setupStatusBar(.mainBackground)
    }
}
