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

    var sections =  ["Histórico", "Mentorias"]
    
    var names = [["Treinamento 1", "Treinamento 2"] , ["Mentoria 1", "Mentoria 2"]]
    
    var imageNamed = ["arthur", "joao"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var sectorLbl: UILabel!
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
        self.sectorLbl.text = "Tecnologia da Informação"
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewID") as!  PerfilTableViewCell
        
        cell.mentorName.text = names[indexPath.section][indexPath.row]
        
        cell.mentorImage?.image = UIImage(named: imageNamed[indexPath.row])
        
        return cell
    }
    
    
    
}
