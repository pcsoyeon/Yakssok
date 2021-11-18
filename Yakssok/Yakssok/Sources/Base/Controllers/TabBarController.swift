//
//  TabBarController.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/13.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setTabs()
        setMiddleTab()
    }
    
}

// MARK: - UI

extension TabBarController {
    private func initUI() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = .mainBlue
        
        if #available(iOS 15, *) {
            let appearance = UITabBarAppearance()
            let tabBar = UITabBar()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.selectionIndicatorTintColor = .mainBlue
            tabBar.standardAppearance = appearance;
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

// MARK: - Set Tabs

extension TabBarController {
    private func setTabs() {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainTab = mainStoryboard.instantiateViewController(identifier: "MainVC")
        mainTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "main"), selectedImage: UIImage(named: "main"))
        
        let storyboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        let tab = storyboard.instantiateViewController(identifier: "MyPageVC")
        tab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "main"), selectedImage: UIImage(named: "main"))
        
        let myStoryboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        let myTab = myStoryboard.instantiateViewController(identifier: "MyPageVC")
        myTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "mypage"), selectedImage: UIImage(named: "mypage"))
        
        let tabs =  [mainTab, tab, myTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = mainTab
    }
}


// MARK: - Set Middle Tab

extension TabBarController {
    func setMiddleTab() {
        let cameraTab = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        var cameraTabFrame = cameraTab.frame
        cameraTabFrame.origin.y = view.bounds.height - cameraTabFrame.height - 35
        cameraTabFrame.origin.x = view.bounds.width/2 - cameraTabFrame.size.width/2
        cameraTab.frame = cameraTabFrame
        
        cameraTab.backgroundColor = UIColor.mainBlue
        cameraTab.layer.cornerRadius = cameraTabFrame.height/2
        view.addSubview(cameraTab)
        
        cameraTab.setImage(UIImage(named: "camera"), for: .normal)
        cameraTab.addTarget(self, action: #selector(touchUpCameraTab(sender:)), for: .touchUpInside)
    }
    
    @objc
    private func touchUpCameraTab(sender: UIButton) {
        let dvc = UIStoryboard.init(name: "PopUp", bundle: nil).instantiateViewController(identifier: "NavigationController")
        dvc.modalTransitionStyle = .crossDissolve
        dvc.modalPresentationStyle = .overCurrentContext
        self.present(dvc, animated: true, completion: nil)
    }
}
