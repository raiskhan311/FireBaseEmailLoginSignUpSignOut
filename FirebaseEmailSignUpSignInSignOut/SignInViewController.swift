//
//  SignInViewController.swift
//  FirebaseEmailSignUpSignInSignOut
//
//  Created by mac on 29/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var txt_email: UITextField!

    @IBOutlet weak var txt_password: UITextField!
    
    
    @IBAction func btn_signIn(_ sender: Any) {
        guard let email = txt_email.text,
        email != "",
        let password = txt_password.text,
        password != ""
        
        
            else {
            AlertController.showAlert(self, title: "Missing INfo", message: "Please enter required field")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else {return}
            print(user.email ?? "Missing Email")
            print(user.displayName ?? "User not Available")
            print(user.uid)
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    }
}

