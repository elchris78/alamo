//
//  SecondViewController.swift
//  NetworkingAlamo
//
//  Created by Christian Arias on 12/15/16.
//  Copyright © 2016 apeamac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    var pokemon = Pokemon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pokemon.downloadPokemonDetails { () -> () in
            
            self.nameLbl.text = self.pokemon.name
            self.descriptionLbl.text = self.pokemon.weight
            self.typeLbl.text = self.pokemon.height
            
        }
        
        
    }

    
}

