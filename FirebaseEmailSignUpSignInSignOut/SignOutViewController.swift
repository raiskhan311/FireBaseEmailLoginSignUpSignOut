//
//  SignOutViewController.swift
//  FirebaseEmailSignUpSignInSignOut
//
//  Created by mac on 29/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Firebase

class SignOutViewController: UIViewController {

    @IBOutlet weak var lbl_username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let username = Auth.auth().currentUser?.displayName else {return}
        // Do any additional setup after loading the view.
        lbl_username.text = "Hello \(username)"
    }

    @IBAction func btn_SignOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        }catch{
            print(error)
        }
    }
}
