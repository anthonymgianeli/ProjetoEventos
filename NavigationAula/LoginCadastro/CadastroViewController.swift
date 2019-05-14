//
//  CadastroViewController.swift
//  NavigationAula
//
//  Created by anthony gianeli on 08/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CadastroViewController: BaseViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
//    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    @IBOutlet weak var finalizarButton: UIButton!
    
    var handle: AuthStateDidChangeListenerHandle?
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            post()
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        finalizarButton.clipsToBounds = true
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        let user = Auth.auth().currentUser
        if let user = user {
            // Pega id do usuario atual
            let uID = user.uid
            
            
            // salva no bd
            ref?.child("User").child(uID).child("nome").setValue(nameTextField.text)
            ref?.child("User").child(uID).child("idade").setValue(idadeTextField.text)
            ref?.child("User").child(uID).child("endereco").setValue(enderecoTextField.text)
//            ref?.child("User").child(uID).child("cpf").setValue(cpfTextField.text)
        }
    }

func post (){
    let title = "firebase"
    let subtitle = "ola"

    let post :[String: AnyObject] = ["title" : title as AnyObject, "subtitle" : subtitle as AnyObject]

    let dbReference = Database.database().reference()
    dbReference.child("Posts").childByAutoId().setValue(post)
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
