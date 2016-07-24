//
//  PokeCell.swift
//  Pokedex
//
//  Created by Ayush Kumar on 7/23/16.
//  Copyright © 2016 Ayush Kumar. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image =  UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
