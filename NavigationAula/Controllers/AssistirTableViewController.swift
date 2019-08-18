//
//  AssistirTableViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class AssistirTableViewController: UITableViewController {

    var areas = ["Recursos Humanos","Desenvolvimento","Gestão","Financeiro","Marketing","Design"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Assistir", for: indexPath) as! AssistirTableViewCell
        cell.area.text = areas[indexPath.row]
        return cell
    }
 

    

}
