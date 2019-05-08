//
//  SimpleViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SimpleViewController: BaseViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override var myOutlet: UIView? {
        get {
            return myLabel
        }
    }
    
    override var name: String {
        get {
            return "Simple View Controller"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        post()
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
