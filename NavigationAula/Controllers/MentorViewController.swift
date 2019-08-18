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
    
    var courses = ["Desenvolvimento", "Sistema Interno", "Financeiro", "Relacionamento Interpessoal"]
    
    var people    = ["Por João Victor", "Por Arthur", "Por Anthony", "Por Kewin"]
    
    
    var image = UIImage(named: "play-button-2")
    
    var thumbs = [UIImage(named: ""),UIImage(named: ""),UIImage(named: ""),UIImage(named: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Curso", for: indexPath) as! MentorTableViewCell
        cell.curso.text = courses[indexPath.row]
        cell.autor.text = people[indexPath.row]
        cell.play.image = image
        cell.thumb.image = thumbs[indexPath.row]
        return cell
    }
    
    
    
}
