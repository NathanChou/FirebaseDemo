//
//  SignUpViewController.swift
//  firebase_demo
//
//  Created by 周彥宏 on 2017/6/25.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    //實作信箱註冊
    @IBAction func createAccountAction(_ sender: UIButton) {
        if emailField.text == "" || passwordField.text == ""{
            let alertVC = UIAlertController(title: "Oops!!", message: "Email or Password is Empty ,please check!", preferredStyle: .alert);
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            alertVC.addAction(okAction);
            self.present(alertVC, animated: true, completion: nil);
        }else{
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
                if error == nil{
                    print("You have successfully signed up");
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login");
                    self.present(vc!, animated: true, completion: nil);
                    
                }else{
                    let alertVC = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert);
                    let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
                    alertVC.addAction(okAction);
                    self.present(alertVC, animated: true, completion: nil);
                }
            });
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
