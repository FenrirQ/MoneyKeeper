//
//  LoginTableViewController.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 8/11/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class LoginTVC: UITableViewController {

    
    @IBOutlet weak var emailTextField: DesignableUITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }

    
    @IBAction func login(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        TutorialDataServices.shared.login(email: email, password: password)
    }
    
    
    //MARK: Register Notification Observer
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showAlertView), name: NotificationKey.loginTapped, object: nil)
    }
    
    //MARK: Alert View
    func showAlertView(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo else {return}
        guard let status = userInfo["status"] as? Int else {return}
        
        switch status {
        case ServerStatus.isSuccess.rawValue:
            createAlert(title: "Đăng nhập thành công!", message: "")
        default:
            createAlert(title: "Đăng nhập thất bại!", message: "Tài khoản và mật khẩu không hợp lệ")
        }
    }
    
    func createAlert(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            if title == "Đăng nhập thành công!" {
                self.performSegue(withIdentifier: "unwindFromLoginToMain", sender: nil)
            }
        }
        alertView.addAction(action)
        present(alertView, animated: true, completion: nil)
        
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
