//
//  JoinSettingPasswordViewController.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/04/07.
//

import UIKit

class JoinSettingPasswordViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 속성 초기화
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = UIColor(named: "blue_165")
        nextBtn.setTitleColor(.white, for: .normal)
        
        // textfield 편집 추적
        passwordTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        // 비밀번호 textfield secure text entry 기본 true로 설정
        setPasswordTFSecureTrue()
        
    }
    
    // 클릭시 loginSuccessVC 띄움
    @IBAction func nextBtnAction(_ sender: Any) {
        guard let loginSuccessVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginSuccessVC") as? LoginSuccessViewController else {
            return
        }
        guard let userName = userName else {
            return
        }
        // 이전 뷰에서 받은 userName 넘겨줌
        loginSuccessVC.userName = userName
        loginSuccessVC.modalPresentationStyle = .fullScreen
        self.present(loginSuccessVC, animated: true, completion: nil)
    }
    
    // 이전 화면으로 이동
    @IBAction func popViewAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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
// return시 키패드 내림
extension JoinSettingPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // textfield 비어있지 않으면 다음 버튼 활성화
    @objc func textFieldDidChange(_ sender: Any?) {
        if let passwordText = passwordTF.text {
            if !passwordText.isEmpty {
                nextBtn.isEnabled = true
                nextBtn.backgroundColor = UIColor(named: "blue_83")
                nextBtn.setTitleColor(.white, for: .normal)
            }
            else {
                nextBtn.isEnabled = false
                nextBtn.backgroundColor = UIColor(named: "blue_165")
                nextBtn.setTitleColor(.white, for: .normal)
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
