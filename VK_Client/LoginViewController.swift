//
//  ViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 01.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        passwordField.isSecureTextEntry = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShown (notification: Notification) {
        let info = notification.userInfo as! NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardWillHide (notification: Notification) {
        
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    func showLoginError () {
        let alert = UIAlertController(title: "Ошибка", message: "Указан неверный логин и/или пароль. Пожалуйста проверьте и введите заново.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ошибке", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func loginCheck () -> Bool {
        guard let login = loginField.text else { return false }
        guard let password = passwordField.text else { return false }
        
        if login == "admin" && password == "1234" {
            return true
        } else {
            return false
        }
    }
  
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSegue" else {
            return false
        }
        let checkResult = loginCheck()
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }

}

