//
//  AboutViewController.swift
//  Practicum_Week2
//
//  Created by Fhict on 02/04/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var Textfield: UITextField!
    @IBAction func ShowTextField(sender: UIButton) {
        var Alert = UIAlertView(title: "Your text is:", message: Textfield.text, delegate: nil, cancelButtonTitle: "Done!")
        Alert.show()
    }
}
