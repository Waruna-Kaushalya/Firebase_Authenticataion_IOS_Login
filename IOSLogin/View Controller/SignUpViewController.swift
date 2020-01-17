//
//  SignUpViewController.swift
//  IOSLogin
//
//  Created by Waruna Kaushalya on 1/17/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore



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
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields "
        }
         //check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and number"
        }
        
        
        return nil
        
    }

    @IBAction func signUpTapped(_ sender: Any) {
        //Validate the field
        let error = validateFields()
        
        if error != nil {
            //there's somthing wrong with the fields, show error mssage
           showError(error!)
            
        }else{
            
            //Create cleared version of the data
//            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            let email = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//
//
//
//
//            //Create the user
//
//
//            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
//
//
//                if err != nil {
//                    //there was an error creating the user
//                    self.showError("Error creating user")
//
//
//                }else{
//                    //user was created successfully. now store the first and last name
//                 let db = Firestore.firestore()
//
//
//                    db.collection("users").addDocument(data: ["firstname":firstName,"lastname":lastName, "Uid": result!.user.uid]) { (error) in
//                        if error != nil {
//                            self.showError("User data coudn't ")
//                        }
//                    }
//                         //Transition to the home screen
//                    self.transitionToHome()
//                }
//
//            }
//
//
//
//        }
//
//
//
//    }
//
//    func showError(_ message:String) {
//        errorlabel.text = message
//        errorlabel.alpha = 1
//    }
//
//    func transitionToHome(){
//        let homeViewController =  storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()
//    }
//
//}



            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
    
    func showError(_ message:String) {
        
        errorlabel.text = message
        errorlabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
