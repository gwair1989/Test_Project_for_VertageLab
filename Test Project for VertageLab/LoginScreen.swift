//
//  LoginScreen.swift
//  Test Project for VertageLab
//
//  Created by Aleksandr Khalupa on 24.06.2021.
//

import UIKit

class LoginScreen: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var loginEmailTF: UITextField!
    @IBOutlet weak var passwordLoginTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = 0.3
        loginEmailTF.layer.borderWidth = 0.3
        passwordLoginTF.layer.borderWidth = 0.3
        passwordLoginTF.delegate = self
        loginEmailTF.delegate = self
    }

    @IBAction func pressedLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "toMapVC", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        guard let login = loginEmailTF.text else{return}
//        Here we save the data to the FB database
        if segue.identifier == "toMapVC"{
            let mapVC = segue.destination as! MapScreen
            mapVC.userName = login
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
       return true
    }
    
}

