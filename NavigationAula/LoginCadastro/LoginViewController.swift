//
//  LoginViewController.swift
//  NavigationAula
//
//  Created by anthony gianeli on 08/05/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var signSelector: UISegmentedControl!
    
    
    var isSignIn:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        signButton.layer.cornerRadius = 20
        signButton.clipsToBounds = true
    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        // flip the boolean
        isSignIn = !isSignIn
        
        // check the bool and set the button and labels
        if isSignIn {
            signButton.setTitle("     Entrar     ", for: .normal)
        } else {
            signButton.setTitle("     Cadastrar    ", for: .normal)
        }
    }
    
    @IBAction func signInTappedButton(_ sender: UIButton) {
        // TODO: do some form validation
        if let email = emailTextField.text, let pass = passwordTextField.text {
            // check if it`s sign in or register
            if isSignIn {
                // sign in the user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    
                    // check that isn`t nil
                    if let u = user {
                        // user is found, go to home screen
                        self.performSegue(withIdentifier: "entrarHome", sender: self)
                    }
                    else {
                        // error: check error and show message
                        return
                    }
                })
                
            } else {
                // register the user with Firebase
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    
                    // check that isn`t nil
                    if let u = user {
                        // user is found, go to home screen
                        self.performSegue(withIdentifier: "entrarCadastro", sender: self)
                    }
                    else {
                        // error: check error and show message
                        return
                    }
                })
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
