//
//  TabBarViewcontroller.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/04/17.
//

import UIKit

class TabBarViewcontroller: UITabBarController {

    @IBOutlet weak var mainTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        // 1. 스토리보드에서 각 tab bar item에 tag 설정함
        // 2. icon Render As 처리
        // : profile icon만 original image, 나머지는 default로 하여 틴트 컬러만 바꿔줌
        if item.tag == 3 {
            tabBar.backgroundColor = .black
            tabBar.tintColor = .white
        }
        else {
            tabBar.backgroundColor = .white
            tabBar.tintColor = .black
            
        }
    }
    
}

