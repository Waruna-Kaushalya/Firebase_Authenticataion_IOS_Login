//
//  SignUpViewController.swift
//  IOSLogin
//
//  Created by Waruna Kaushalya on 1/17/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        
        //Hide the error label
        errorlabel.alpha = 0
        
        
        //style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton )

        
    }
    
    
    //check the fields and validate that the data is correct
    //If everithing is correct, this method return nill
    //Otherwise, it return the error msg
    
    func validateFields() -> String?  {
        //check that all fields are field in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields "
        }
         //check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password isn't secure enough
            return "Please make sure your password is at least 8 characters"
        }
        
        
        return nil
        
    }

    @IBAction func signUpTapped(_ sender: Any) {
        //Validate the field
        
        //Create the user
        
        //Transition to the home screen
        
    }
    
}
