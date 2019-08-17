//
//  MentorViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 17/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class MentorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var sections = ["Desenvolvimento", "Gestão", "Financeiro", "Relacionamento Interpessoal"]
    var bands    = [["The Beatles", "AC/DC", "The Who"], ["The 1975", "The Neighbourhood"], ["Kölsch","Solomun", "Agoria"], ["2Pac", "The Notorius B.I.G"]]
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
}
