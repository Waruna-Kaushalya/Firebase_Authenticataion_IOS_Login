//
//  LoginViewController.swift
//  IOSLogin
//
//  Created by Waruna Kaushalya on 1/17/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    //first and last name text field
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        
        //Hide the error label
        errorLabel.alpha = 0
        
        //style the elements
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleFilledButton(loginButton)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logginTapped(_ sender: Any) {
    }
    
}
