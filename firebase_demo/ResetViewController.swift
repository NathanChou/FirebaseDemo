//
//  ResetViewController.swift
//  firebase_demo
//
//  Created by 周彥宏 on 2017/6/25.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        if self.emailField.text == ""{
            let alertVC = UIAlertController(title: "Oops!!", message: "Please enter an email", preferredStyle: .alert);
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            alertVC.addAction(okAction);
            self.present(alertVC, animated: true, completion: nil);
        }else{
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailField.text!, completion: { (error) in
                
                var title = "";
                var message = "";
                
                if error != nil{
                    title = "Error!";
                    message = (error?.localizedDescription)!;
                }else{
                    title = "Success!";
                    message = "Password reset email is sent";
                    self.emailField.text = "";
                }
                
                let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert);
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
                alertVC.addAction(okAction);
                self.present(alertVC, animated: true, completion: nil);
                
            });
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
