//
//  LoginSuccessViewController.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/04/07.
//

import UIKit

class LoginSuccessViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingUserName()
        welcomeLabel.sizeToFit()
        
    }
    @IBAction func backToLoginAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func settingUserName() {
        if let userName = userName {
            welcomeLabel.text = "\(userName)님 Instagram에 오신 것을 환영합니다"
        }
    }
}
