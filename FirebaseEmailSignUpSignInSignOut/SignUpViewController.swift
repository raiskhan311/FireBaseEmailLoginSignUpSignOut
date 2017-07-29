//
//  SignUpViewController.swift
//  FirebaseEmailSignUpSignInSignOut
//
//  Created by mac on 29/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {

    @IBOutlet weak var txt_username: UITextField!

    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var txt_password: UITextField!
    
    
    @IBAction func btn_signup(_ sender: Any) {
        
        guard let username = txt_username.text,
        username != "",
        let email = txt_email.text,
        email != "",
        let password = txt_password.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill all fields")
                return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else{return}
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            })
        }
    }
}
