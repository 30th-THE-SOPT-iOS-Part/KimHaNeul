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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
// return시 키패드 내림
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
