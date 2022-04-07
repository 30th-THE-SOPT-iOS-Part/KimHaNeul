//
//  JoinSettingNameViewController.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/04/07.
//

import UIKit

class JoinSettingNameViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 다음 뷰로 사용자 이름 넘겨줌
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingPwVC" {
            if let destination = segue.destination as? JoinSettingPasswordViewController {
                destination.userName = userNameTF.text
            }
        }
    }
    
    // 이전 화면으로 이동
    @IBAction func popViewAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
// return시 키패드 내림
extension JoinSettingNameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

