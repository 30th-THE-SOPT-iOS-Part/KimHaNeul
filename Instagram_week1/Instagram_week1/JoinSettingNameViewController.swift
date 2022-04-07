//
//  JoinSettingNameViewController.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/04/07.
//

import UIKit

class JoinSettingNameViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 버튼 속성 초기화
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = UIColor(named: "blue_165")
        nextBtn.setTitleColor(.white, for: .normal)
        
        // textfield 편집 추적
        userNameTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
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
    // textfield 비어있지 않으면 다음 버튼 활성화
    @objc func textFieldDidChange(_ sender: Any?) {
        if let userNameText = userNameTF.text {
            if !userNameText.isEmpty {
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
    
}

