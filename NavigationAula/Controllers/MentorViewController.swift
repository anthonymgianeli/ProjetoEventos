//
//  MentorViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 17/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class MentorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var courses = ["Desenvolvimento", "Sistema Interno", "Financeiro", "Design Gráfico"]
    
    var people    = ["Por João Victor", "Por Arthur", "Por Anthony", "Por Kewin"]
    
    
    var play = UIImage(named: "play-button-2")
    var completed = UIImage(named: "Grupo 173")
    
    var thumbs = [UIImage(named: "Fotolia_120871392_Subscription_Monthly_XXL"),UIImage(named: "Fotolia_120871495_Subscription_Monthly_XXL"),UIImage(named: "Fotolia_120890120_Subscription_Monthly_XL"),UIImage(named: "Fotolia_120890380_Subscription_Monthly_XXL")]
    
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

        
        if segmentedControl.selectedSegmentIndex == 0 {
            cell.curso.text = courses[indexPath.row]
            cell.autor.text = people[indexPath.row]
            cell.thumb.image = thumbs[indexPath.row]
            cell.play.image = play
            cell.progress.progress = 0.5

        } else {
            cell.curso.text = courses[indexPath.row]
            cell.autor.text = people[indexPath.row]
            cell.thumb.image = thumbs[indexPath.row]
            cell.play.image = completed
            cell.progress.progress = 1.0
        }
        
        return cell
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
    
}
