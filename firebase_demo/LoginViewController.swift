//
//  LoginViewController.swift
//  firebase_demo
//
//  Created by 周彥宏 on 2017/6/25.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    //實作登入
    @IBAction func LoginAction(_ sender: UIButton) {
        
        if self.emailField.text == "" || self.passwordField.text == ""{
            
            let alertVC = UIAlertController(title: "Oops!!", message: "Please enter an Email or password!!", preferredStyle: .alert);
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            alertVC.addAction(okAction);
            self.present(alertVC, animated: true, completion: nil);
            
        }else{
            
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                
                if error == nil{
                    print("You have successfully logged in");
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main");
                    self.present(vc!, animated: true, completion: nil);
                    
                }else{
                    
                    let alertVC = UIAlertController(title: "logged in Error!!!!", message: error?.localizedDescription, preferredStyle: .alert);
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
