//
//  RootViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class RootViewController: BaseViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override var myOutlet: UIView? {
        get {
            return myLabel
        }
    }
    
    override var name: String {
        get {
            return "Root View Controller"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //print("O view controller é \(self)")
    }
    
    @IBAction func hereAndBackAgain(_ segue: UIStoryboardSegue) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoNext" {
            if let destination = segue.destination as? ChildViewController {
                destination.text = "Setei um valor"
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
