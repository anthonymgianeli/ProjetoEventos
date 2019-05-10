//
//  RootViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imagesemanais: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
     @IBOutlet weak var myLabel: UILabel!
    
    
    let CellIdentifier = "CellIdentifier"
    var words: [String] = []
    var descricoes: [String] = []
    var imagens: [UIImage] = []
    var result: Int = 0
    var side: Int = 0
    var slides: [UIImage] = []
    var frame = CGRect(x:0,y:0,width: 0,height: 0)
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadScrollView()
    }
    
    override func viewDidLoad() {
        
        //Titles
        words.append("Desfile em SP")
        words.append("Festa da unicamp")
        words.append("Stand up dos 4 amigos")
        words.append("Mega Balada do Seculo")
        words.append("Encontro de Carros Antigos")
        
        //Descritions
        descricoes.append("Um dos maiores eventos de moda de São Paulo, trazendo modelos de todas pastes do brasil.")
        descricoes.append("A Unicamp vem com a sua maior festa anual com a interação de todos os alunos, com objetivo de unir cada vez mais a universidade.")
        descricoes.append("O Stand Up mais divertido de todos os tempos com alguns dos comediantes mais famosos desses tempos que ninguem consegue ficar serio quando eles entram no palco.")
        descricoes.append("A balada mais top de campinas, a festa esta maior a cada ano que se passa, vem pessoas de todas as cidades da região.")
        descricoes.append("Venha participar de um dos maiores encontros de carros antigos da região.")
        
        //images
        if let imagem = UIImage(named: "imagem1"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "imagem2"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "imagem3"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "imagem4"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "imagem5"){
            imagens.append(imagem)
        }
        
        //slides
        if let slide = UIImage(named: "imagem1"){
            slides.append(slide)
        }
        if let slide = UIImage(named: "imagem2"){
            slides.append(slide)
        }
        if let slide = UIImage(named: "imagem3"){
            slides.append(slide)
        }
        if let slide = UIImage(named: "imagem4"){
            slides.append(slide)
        }
        if let slide = UIImage(named: "imagem5"){
            slides.append(slide)
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //TableView settings
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! CellEventos
        
        let word = words[indexPath.row]
        let descricao = descricoes[indexPath.row]
        
        // Configure cell of TableView
        cell.title.text = word
        cell.descricao.text = descricao
        cell.imagem.image = imagens [indexPath.row]
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //fim table
    
    //SrollView
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    func loadScrollView() {
        
        self.scrollView.layer.borderColor = UIColor.white.cgColor
        self.scrollView.layer.shadowColor = UIColor.black.cgColor
        
        //uso está sendo apenas visual
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        
        //resetar subviews existentes
        let subviews = self.scrollView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        //preparar subview
        for index in 0..<slides.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(slides.count), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
        scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
   
    
    
    override var myOutlet: UIView? {
        get {
            return myLabel
        }
    }
    
    override var name: String {
        get {
            return "Main View Controller"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //print("O view controller é \(self)")
    }
    
    @IBAction func hereAndBackAgain(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoNext" {
            if segue.destination is DetalhesEventosViewController {
            }
        }
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
