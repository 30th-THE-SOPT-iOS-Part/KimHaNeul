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
        
        // 버튼 속성 초기화
        loginBtn.isEnabled = false
        loginBtn.backgroundColor = UIColor(named: "blue_165")
        loginBtn.setTitleColor(.white, for: .normal)
    
        // textfield 편집 추적
        userIDTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        // 비밀번호 textfield secure text entry 기본 true로 설정
        setPasswordTFSecureTrue()
        
    }
    
    // 클릭시 loginSuccessVC 띄움
    @IBAction func LoginAction(_ sender: UIButton) {
        guard let loginSuccessVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginSuccessVC") as? LoginSuccessViewController else {
            return
        }
        loginSuccessVC.userName = userIDTF.text
        loginSuccessVC.modalPresentationStyle = .fullScreen
        self.present(loginSuccessVC, animated: true, completion: nil)
    }
    
    // 비밀번호 textfield secure text entry가 true일 때
    func setPasswordTFSecureTrue() {
        let secureTrueButton = UIButton(type: .custom)
        let secureImage = UIImage(named: "password hidden eye icon.png")
        secureTrueButton.setImage(secureImage, for: .normal)
        secureTrueButton.addTarget(self, action: #selector(secureEntry), for: .touchUpInside)
        secureTrueButton.sizeToFit()
        
        passwordTF.rightView = secureTrueButton
        passwordTF.rightViewMode = .always
    }
    
    // 비밀번호 textfield secure text entry가 false일 때
    func setPasswordTFSecureFalse() {
        let secureFalseButton = UIButton(type: .custom)
        let notSecureImage = UIImage(named: "password shown eye icon.png")
        secureFalseButton.setImage(notSecureImage, for: .normal)
        secureFalseButton.addTarget(self, action: #selector(secureEntry), for: .touchUpInside)
        secureFalseButton.sizeToFit()
        
        passwordTF.rightView = secureFalseButton
        passwordTF.rightViewMode = .always
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
                loginBtn.setTitleColor(.white, for: .normal)
            }
            else {
                loginBtn.isEnabled = false
                loginBtn.backgroundColor = UIColor(named: "blue_165")
                loginBtn.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    // 비밀번호 textfield 눈 아이콘 클릭시 secure text entry 변경
    @objc func secureEntry(_ sender: Any?) {
        if passwordTF.isSecureTextEntry == true {
            passwordTF.isSecureTextEntry = false
            
            setPasswordTFSecureFalse()
        }
        else {
            passwordTF.isSecureTextEntry = true
            
            setPasswordTFSecureTrue()
        }
    }
}

