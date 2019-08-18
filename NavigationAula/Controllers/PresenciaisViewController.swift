//
//  PresenciaisViewController.swift
//  NavigationAula
//
//  Created by Arthur Rodrigues on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class PresenciaisViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var porQuem = ["Por João", "Por Arthur", "Por Kewin","Por João", "Por Arthur", "Por Kewin","Por João"]
    
    var porQuem2 = ["Por Arthur", "Por Kewin", "Por João"]
    
    var nomesDosPresenciais = ["Data Science","Automação","MongoDB","SQL",
                               "Python","PowerBI","R"]
    
    var confirmed = [UIImage(named: ""), UIImage(named: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
}


extension PresenciaisViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0{
            return nomesDosPresenciais.count
        } else {
            return porQuem2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "presencialID") as! PresencialTableViewCell
        
        if segmentedControl.selectedSegmentIndex == 0 {
        
            cell.nomeLbl.text = nomesDosPresenciais[indexPath.row]
            
            cell.porLbl.text = porQuem[indexPath.row]
            
            cell.confirmedOrNot.image = UIImage(named: "Não Confirmado")
            
        } else {
            
            cell.nomeLbl.text = nomesDosPresenciais[indexPath.row]
            
            cell.porLbl.text = porQuem[indexPath.row]
            
            cell.confirmedOrNot.image = UIImage(named: "Confirmado")
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "detail", sender: indexPath.row)
        
    }
    
    
}
