//
//  SignupTVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 8/13/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class SignupTVC: UITableViewController {

    
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
    
    //MARK: Register Notification Observer
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showAlertView), name: NotificationKey.loginTapped, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func signup(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        TutorialDataServices.shared.signup(email: email, password: password)
    }
    
    //MARK: Alert View
    func showAlertView(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo else {return}
        guard let status = userInfo["status"] as? Int else {return}
        
        switch status {
        case ServerStatus.isSuccess.rawValue:
            createAlert(title: "Đăng ký thành công!", message: "")
        case ServerStatus.isExisted.rawValue:
            createAlert(title: "Đăng ký thất bại!", message: "Tài khoản đã tồn tại")
        default:
            createAlert(title: "Đăng ký thất bại!", message: "Tài khoản và mật khẩu không hợp lệ")
        }
    }
    
    func createAlert(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            if title == "Đăng ký thành công!" {
                self.performSegue(withIdentifier: "unwindFromSignupToMain", sender: nil)
            }
        }
        alertView.addAction(action)
        present(alertView, animated: true, completion: nil)
        
    }
    
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
