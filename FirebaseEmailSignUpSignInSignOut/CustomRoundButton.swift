//
//  CustomRoundButton.swift
//  FirebaseEmailSignUpSignInSignOut
//
//  Created by mac on 29/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class CustomRoundButton : UIButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}

