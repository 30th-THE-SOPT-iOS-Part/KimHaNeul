//
//  ViewController.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/04/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setPasswordTF()
    }
    func setUI() {
        // 버튼 속성 초기화
        loginBtn.isEnabled = false
        loginBtn.backgroundColor = UIColor(named: "blue_165")
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.setTitleColor(.white, for: .disabled)
    
        // textfield 편집 추적
        userIDTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    // 비밀번호 textfield isSecureTextEntry 버튼 세팅
    func setPasswordTF() {
        let secureButton = UIButton(type: .custom)
        secureButton.setImage(UIImage(named: "password hidden eye icon.png"), for: .normal)
        secureButton.setImage(UIImage(named: "password shown eye icon.png"), for: .selected)
        secureButton.addTarget(self, action: #selector(secureEntry), for: .touchUpInside)
        secureButton.sizeToFit()
        
        passwordTF.rightView = secureButton
        passwordTF.rightViewMode = .always
    }
    // 비밀번호 textfield의 secure버튼(눈 아이콘) 클릭됨에 따라 isSecureTextEntry 제어
    @objc func secureEntry(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTF.isSecureTextEntry = !sender.isSelected
    }

    
    
    // 클릭시 loginSuccessVC 띄움
    @IBAction func LoginAction(_ sender: UIButton) {
        guard let userID = userIDTF.text, let password = passwordTF.text else { return }
        login(name: userID, email: userID, password: password)
    }
    func login(name: String, email: String, password: String) {
        UserService.shared.login(
            name: name,
            email: email,
            password: password) { [self] response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else { return }
                loginSuccessAlert(message: data.message)
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
    func loginSuccessAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { [self] action in
            // 홈으로 이동
            goHome()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    func goHome() {
        let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        let mainTabBarVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarVC")
        mainTabBarVC.modalPresentationStyle = .fullScreen
        self.present(mainTabBarVC, animated: true, completion: nil)
    }
    
    
}
extension ViewController: UITextFieldDelegate {
    
    // return시 키패드 내림
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // textfield 비어있지 않으면 다음 버튼 활성화
    @objc func textFieldDidChange(_ sender: Any?) {
        if let userText = userIDTF.text, let passText = passwordTF.text {
            if !userText.isEmpty && !passText.isEmpty {
                loginBtn.isEnabled = true
                loginBtn.backgroundColor = UIColor(named: "blue_83")
            }
            else {
                loginBtn.isEnabled = false
                loginBtn.backgroundColor = UIColor(named: "blue_165")
            }
        }
    }
    
}

