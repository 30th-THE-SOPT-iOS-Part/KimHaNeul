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
    var password: String?
    var delegate: PopVCSignal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI() {
        settingUserName()
        welcomeLabel.sizeToFit()
    }
    func settingUserName() {
        if let userName = userName {
            welcomeLabel.text = "\(userName)님 Instagram에 오신 것을 환영합니다"
        }
    }
    
    @IBAction func backToLoginAction(_ sender: UIButton) {
        print(userName)
        print(password)
        signUp(name: userName ?? "", email: userName ?? "", password: password ?? "")
        //dismiss(animated: false)
        /*
        let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        let mainTabBarVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarVC")
        mainTabBarVC.modalPresentationStyle = .fullScreen
        self.present(mainTabBarVC, animated: true, completion: nil)
         */
    }
    func signUp(name: String, email: String, password: String) {
        UserService.shared.signUp(
            name: name,
            email: email,
            password: password) { [self] response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                signUpSuccessAlert(message: data.message)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    func signUpSuccessAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { [self] action in
            delegate?.popVC()
            dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func loginAnotherAccountAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

protocol PopVCSignal {
    func popVC()
}
