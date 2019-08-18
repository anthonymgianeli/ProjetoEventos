//
//  SimpleViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PerfilViewController: BaseViewController {

    
    var labelAtCell = ["Loja de Recompensas", "Meu Histórico", "Notificações",
                       "Configurações", "Ajuda", "Quero ser instrutor!", "Sair da Conta"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var jobRoleLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override var name: String {
        get {
            return "Simple View Controller"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        post()
        setupLabels()
    }
    
    func setupLabels() {
        
        self.nameLbl.text = "Anthony Marques Gianeli"
        self.jobRoleLbl.text = "iOS Developer"
        self.profileImage.image = UIImage(named: "anthony")
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

extension PerfilViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelAtCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewID") as!  PerfilTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.label.textColor = UIColor(displayP3Red: 76.0/255.0, green: 27.0/255.0, blue: 153.0/255.0, alpha: 1.0)
        case 5:
            cell.label.textColor = UIColor(displayP3Red: 76.0/255.0, green: 27.0/255.0, blue: 153.0/255.0, alpha: 1.0)
        default:
            print("change color error")
        }
        
        cell.label.text = labelAtCell[indexPath.row]
        
        return cell
    }
    
}
