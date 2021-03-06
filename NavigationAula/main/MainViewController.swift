//
//  RootViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var button, button2, button3 : UIButton!
    var buttonAtual : UIButton?
    
    
    let CellIdentifier = "CellIdentifier"
    var words: [String] = []
    var descricoes: [String] = []
    var imagens: [UIImage] = []
    var slides: [UIImage] = []
    var frame = CGRect(x:0,y:0,width: 0,height: 0)
    var detalhe: DetalhesEventosViewController?
    

    
    @objc func button1Tapped(sender: UIButton) {
        buttonAtual = button
        print("button1Tapped")
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    @objc func button2Tapped(_ sender: UIButton) {
        buttonAtual = button2
        print("button2Tapped")
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    @objc func button3Tapped(_ sender: UIButton) {
        buttonAtual = button3
        print("button3Tapped")
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //SrollView
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let size = scrollView.frame.size
        let origin = CGPoint.zero
        let frame = CGRect(origin: origin, size: size)
        
        
        
        button = UIButton(type: .custom)
        button.frame = frame
        button.setBackgroundImage(UIImage(named: "imagem1"), for: .normal)
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        scrollView.addSubview(button)
        
        button2 = UIButton(type: .custom)
        button2.frame = frame.offsetBy(dx: size.width, dy: 0)
        button2.setBackgroundImage(UIImage(named: "imagem2"), for: .normal)
        button2.addTarget(self, action: #selector(self.button2Tapped(_:)), for: .touchUpInside)
        
        scrollView.addSubview(button2)
        
        button3 = UIButton(type: .custom)
        button3.frame = frame.offsetBy(dx: size.width * 2, dy: 0)
        button3.setBackgroundImage(UIImage(named: "imagem3"), for: .normal)
        button3.addTarget(self, action: #selector(self.button3Tapped(_:)), for: .touchUpInside)
        
        scrollView.addSubview(button3)
        
        scrollView.contentSize = CGSize(width: size.width * 3, height: size.height)
        scrollView.delegate = self
        
        scrollView.setContentOffset(CGPoint.zero, animated: true)
        scrollView.isPagingEnabled = true
    }
    
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
    }
    // fim
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //print("O view controller é \(self)")
    }
    
    @IBAction func hereAndBackAgain(_ segue: UIStoryboardSegue) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let destination = segue.destination as? DetalhesEventosViewController{
                destination.image = self.buttonAtual?.backgroundImage(for: .normal)
                
                if buttonAtual == button{
                    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                        if segue.identifier == "detailSegue"{
                            self.detalhe?.descricao.text = "ïmage"
                            if let child = segue.destination as? DetalhesEventosViewController{
                                child.text = "image"
                                print ("entrou")
                            }
                        }
                    }
                }
                else if buttonAtual == button2{
                    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                        if segue.identifier == "detailSegue"{
                            if let child = segue.destination as? DetalhesEventosViewController{
                                child.text = "image2"
                            }
                        }
                    }
                } else if buttonAtual == button3 {
                    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                        if segue.identifier == "detailSegue"{
                            if let child = segue.destination as? DetalhesEventosViewController{
                                child.text = "image3"
                            }
                        }
                    }
                }
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
