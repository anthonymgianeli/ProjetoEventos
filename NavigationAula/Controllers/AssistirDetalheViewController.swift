//
//  AssistirDetalheViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class AssistirDetalheViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var detailTitle: String?
    @IBOutlet weak var navItem: UINavigationItem!
    
    var words: [String] = []
    var descricoes: [String] = []
    var imagens: [UIImage] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navItem.title = detailTitle
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        words.append("Treinamento")
        words.append("Festa da unicamp")
        words.append("Stand up dos 4 amigos")
        words.append("Mega Balada do Seculo")
        words.append("Encontro de Carros Antigos")
        
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        
        if let imagem = UIImage(named: "Fotolia_120871392_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120871495_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120890120_Subscription_Monthly_XL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120890380_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120890426_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_220554851_Subscription_Monthly_XL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_220558115_Subscription_Monthly_XL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_220763802_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! CellEventos
        
        
        // Configure cell of TableView
        cell.title.text = words[indexPath.row]
        cell.descricao.text = descricoes[indexPath.row]
        cell.imagem.image = imagens [indexPath.row]
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    

    

}
