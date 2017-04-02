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
    
    /** qiitaAPIクライアントID */
    let kClientId = "de1b2dd6bd71d8c71fbdce0e066562c759bcce9a"
    /** QiitaクライントSecret */
    let kClientSecret = "f6551191b43e82c3de17fa665da9f8ddd0a9c5b5"
    /** 認証用サイトURL */
    let kAuthUrl = "https://qiita.com/api/v2/oauth/authorize"
    /** スコープ(クエリ) */
    let kScope = "read_qiita"
    /** State(クエリ) */
    let kState = ""
    /** クライアントIDキー */
    let prefixCilentId = "client_id="
    /** scopeキー */
    let preficScope = "scope="
    
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
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.checkValidLoginBtn), name: .UITextFieldTextDidChange, object: nil)
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: IBAction
    
    /// close押下時アクション
    ///
    /// - Pareter sender: sender
    @IBAction func closeTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
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
        UIApplication.shared.openURL(self.genAuthUrl())
    }
    
    /**
     Auth認証用URL生成
     - returns: URL
     */
    private func genAuthUrl() -> URL{
        return URL(string: self.kAuthUrl + "?" + self.prefixCilentId + self.kClientId + "&" + self.preficScope + self.kScope)!
    }
    
    /// ユーザー名とパスワードが入力されているか判定するメソッド
    /// どちらかが未入力であった場合、ログインボタンを押下できなくする
    func checkValidLoginBtn() {
        let userId = userIdTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if userId.isEmpty || password.isEmpty {     // どちらかが空白であった場合
            loginButton.isEnabled = false
        } else {                                    // どちらも入力されていた場合
            loginButton.isEnabled = true
        }
       
    }

}
