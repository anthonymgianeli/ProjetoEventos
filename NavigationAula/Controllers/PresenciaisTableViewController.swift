//
//  PresenciaisTableViewController.swift
//  NavigationAula
//
//  Created by Arthur Rodrigues on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class PresenciaisTableViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "presenciaiscell") as! PresenciaisTableViewCell
        
        cell.nomePresencial.text = "salve cachorro doido"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }


}
