//
//  FilmsVC.swift
//  StarWarChallengeAlpha
//
//  Created by mac on 7/20/19.
//  Copyright © 2019 wox. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    var person: Person!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var crawlLabel: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var episodeLbl: UILabel!
    let api = FilmsApi()
    var films = [String]()
    var currentfilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
        films = person.filmUrls
        prevButton.isEnabled = false
        
        nextButton.isEnabled = films.count > 1
        
        guard let firstfilm = films.first else {return }
        
        getFilm(url: firstfilm)
        
        // Do any additional setup after loading the view.
    }
    
    func getFilm(url:String) {
        api.getFilms(url: url) { (film) in
            if let film = film{
                self.setUpView(film: film)
            }
        }
    }
    
    func setUpView(film:Films){
        
        titleLabel.text = film.title
        episodeLbl.text = String(film.episode)
        producerLabel.text = film.producer
        directorLabel.text = film.director
        releasedLabel.text = film.director
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: "")
        
        let final = stripped.replacingOccurrences(of: "\r", with: "")
        crawlLabel.text = final // film.crawl
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        
        currentfilm -= 1
        setBUttonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
        currentfilm += 1
        setBUttonState()
    }
    
    func setBUttonState(){
        nextButton.isEnabled = currentfilm == films.count - 1 ? false : true
        prevButton.isEnabled = currentfilm == 0 ? false : true
       
        getFilm(url: films[currentfilm])

    }

}
