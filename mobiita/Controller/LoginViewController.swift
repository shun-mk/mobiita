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
    
    @IBOutlet weak var inputUserId: UITextField!        // ユーザIDテキストエリア
    @IBOutlet weak var inputPassword: UITextField!       // パスワードテキストエリア
    @IBOutlet weak var loginButton: UIButton!       // ログインボタン
    @IBOutlet weak var backGroundView: UIView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ログイン"
        inputUserId.delegate = self
        inputPassword.delegate = self
        inputPassword.isSecureTextEntry = true
        
        inputUserId.backgroundColor = UIColor.clear
        inputPassword.backgroundColor = UIColor.clear
        
        loginButton.layer.cornerRadius = 5.0
        loginButton.addTarget(self, action: #selector(LoginViewController.buttonTapped(sender:)), for: .touchDown)

        // 背景色をグラデーションにする
        makeBackgroundGradation()
        // 初期表示時、ボタンを押せないようにしておく
        checkValidLogin()
     
     
    }
    
    /// メモリー不足にてインスタンスが破棄される直前に呼ばれる。
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
    
    
    // MARK: ログインアクション系関数
    
    /// リターン押下時に呼び出される処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn \(textField.text)")
        
        // 改行ボタンが押されたらKeyboardを閉じる処理.
        textField.resignFirstResponder()
        
        return true
    }
    
    /// ログインボタン押下時アクション
    func buttonTapped(sender: AnyObject) {
        
        //入力されたIDとPasswordを取得し、コンソールへ表示
        let userId = inputUserId.text
        let password = inputPassword.text
        print("USERID:\(userId)")
        print("PASSWORD:\(password)")
        
    }
    
    /// テキスト入力完了時に呼ばれるメソッド
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.checkValidLogin()
    }
    
    /// ユーザー名とパスワードが入力されているか判定するメソッド
    /// どちらかが未入力であった場合、ログインボタンを押下できなくする
    private func checkValidLogin() {
        let userId = inputUserId.text ?? ""
        let password = inputPassword.text ?? ""
        if userId.isEmpty || password.isEmpty {     // どちらかが空白であった場合
            loginButton.isEnabled = false
        } else {                                    // どちらも入力されていた場合
            loginButton.isEnabled = true
        }
       
    }
    
    // MARK:Background
    
    /// 背景色をグラデーションにする(紫メイン)
    private func makeBackgroundGradation(){
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        
        let color_1 = UIColor(red: 172/255.0, green: 38/255.0, blue: 117/255.0, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 165/255.0, green: 40/255.0, blue: 131/255.0, alpha: 1.0).cgColor
        let color_3 = UIColor(red: 110/255.0, green: 70/255.0, blue: 160/255.0, alpha: 1.0).cgColor
        gradient.colors = [color_1, color_2, color_3]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 0.5 as Float)
        let position_3 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [position_1, position_2, position_3]
        
        self.backGroundView.layer.insertSublayer(gradient, at: 0)
    }
    
    

}
