//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Ayush Kumar on 7/25/16.
//  Copyright © 2016 Ayush Kumar. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvo: UIImageView!
    @IBOutlet weak var nextEvo: UIImageView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvo.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            
            self.updateUI()
        }
    }

    func updateUI() {
        
        var height = pokemon.height
        if (Double(height) != nil) {
            height = String(Double(height)! / 10) + " meters"
        } else {
            height = "Not Found"
        }
        heightLbl.text = height
        var weight = pokemon.weight
        if (Double(weight) != nil) {
            weight = String(Double(weight)! / 10) + " kg"
        } else {
            weight = "Not Found"
        }
        weightLbl.text = weight
        
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        pokedexId.text = "\(pokemon.pokedexId)"
        attackLbl.text = pokemon.attack
        
        
        
        
        if pokemon.nextEvoId == "" {
            evoLbl.text = "No Evolutions"
            nextEvo.hidden = true
        } else {
            nextEvo.hidden = false
            nextEvo.image = UIImage(named: pokemon.nextEvoId)
            var str = "Next Evolution: \(pokemon.nextEvoTxt)"
            
            if pokemon.nextEvoLvl != "" {
                str += " - LVL \(pokemon.nextEvoLvl)"
            }
            evoLbl.text = str
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
