//
//  LoginViewController.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/12/01.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Property
    
    @IBOutlet weak var userIdTextField: UITextField!        // ユーザIDテキストエリア
    @IBOutlet weak var passwordTextField: UITextField!       // パスワードテキストエリア
    @IBOutlet weak var loginButton: UIButton!       // ログインボタン
    
    // MARK: - methods
    
    private func initLoginBtn() {
        loginButton.layer.cornerRadius = 5.0
        self.checkValidLoginBtn()
        self.loginButton.addAction { (button) in
            self.didTappedLoginBtn()
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ログイン"
        self.userIdTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordTextField.isSecureTextEntry = true
        self.initLoginBtn()
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBAction
    
    /// close押下時アクション
    ///
    /// - Pareter sender: sender
    @IBAction func closeTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
    
    // MARK: - delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.checkValidLoginBtn()
        return true
    }
    
    /// リターン押下時に呼び出される処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 改行ボタンが押されたらKeyboardを閉じる処理.
        textField.resignFirstResponder()
        
        if textField == self.userIdTextField {
            self.passwordTextField.becomeFirstResponder()
        }
        
        return true
    }
    
    /// ログインボタン押下時アクション
    func didTappedLoginBtn() {
        
    }
    
    /// ユーザー名とパスワードが入力されているか判定するメソッド
    /// どちらかが未入力であった場合、ログインボタンを押下できなくする
    private func checkValidLoginBtn() {
        let userId = userIdTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if userId.isEmpty || password.isEmpty {     // どちらかが空白であった場合
            loginButton.isEnabled = false
        } else {                                    // どちらも入力されていた場合
            loginButton.isEnabled = true
        }
       
    }

}
