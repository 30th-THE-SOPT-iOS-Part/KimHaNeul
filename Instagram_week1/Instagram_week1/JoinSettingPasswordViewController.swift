//
//  JoinSettingPasswordViewController.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/04/07.
//

import UIKit

class JoinSettingPasswordViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
// return시 키패드 내림
extension JoinSettingPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
