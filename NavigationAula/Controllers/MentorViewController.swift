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
    
    var people    = [["João Victor Batista", "Arthur Rodrigues", "Jéssica Pereira"], ["Kewin Lima"], ["Vinicius Oliviera", "Gabriela Resende"], ["Marcela Barros", "Mônica Sousa"]]
    
    var info = [["Tenho tido algumas dificuldades na hora de tratar requisições no backend", "Gostaria de ajuda para desenvolver melhor arquivos css", "Preciso de sugestões de como treinar uma rede neural para resultados mais precisos"],["Tenho tido algumas dificuldades na hora de tratar requisições no backend"],["","",],["",""]]
    
    var image = UIImage(named: "seta")
    
    
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
        cell.info.text = info[indexPath.section][indexPath.row]
        cell.img.image = image
        return cell
    }
    
}
