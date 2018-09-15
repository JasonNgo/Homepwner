//
//  CustomTextField.swift
//  Homepwner
//
//  Created by Jason Ngo on 2018-07-19.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        borderStyle = .line
        return true
    }

    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        borderStyle = .roundedRect
        return true
    }
    
} // CustomTextField
