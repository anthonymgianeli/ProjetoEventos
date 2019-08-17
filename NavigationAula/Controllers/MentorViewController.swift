//
//  MentorViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 17/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class MentorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = ["Desenvolvimento", "Design", "Financeiro", "Relacionamento Interpessoal"]
    var people    = [["João Victor Batista", "Arthur Rodrigues", "Jéssica Pereira"], ["Kewin Lima", "Jorge Silva"], ["Pedro Silva","Vinicius Oliviera", "Gabriela Resende"], ["Marcela Barros", "Mônica Sousa"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self


    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.tableView(tableView, numberOfRowsInSection: section) > 0 {
            return sections[section]
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mentoria", for: indexPath) as! MentorTableViewCell
        cell.name.text = people[indexPath.section][indexPath.row]
        return cell
    }
    
}
