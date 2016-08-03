//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ayush Kumar on 7/23/16.
//  Copyright © 2016 Ayush Kumar. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoTxt: String!
    private var _pokemonUrl: String!
    private var _nextEvoId: String!
    private var _nextEvoLvl: String!
    
    var name: String {
        get {
            return _name
        }
    }
    
    var pokedexId: Int {
        get {
            return _pokedexId
        }
    }
    
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
    }
    
    var type: String {
        get {
            if _type == nil {
                _type = ""
            }
            return _type
        }
    }

    
    var defense: String {
        get {
            if _defense == nil {
                _defense = ""
            }
            return _defense
        }
    }
    
    var height: String {
        get {
            if _height == nil {
                _height = ""
            }
            return _height
        }
    }
    
    var weight: String {
        get {
            if _weight == nil {
                _weight = ""
            }
            return _weight
        }
    }
    
    var attack: String {
        get {
            if _attack == nil {
                _attack = ""
            }
            return _attack
        }
    }
    
    var nextEvoTxt: String {
        get {
            if _nextEvoTxt == nil {
                _nextEvoTxt = ""
            }
            return _nextEvoTxt
        }
    }
    
    var nextEvoId: String {
        get {
            if _nextEvoId == nil {
                _nextEvoId = ""
            }
            return _nextEvoId
        }
    }
    
    var nextEvoLvl: String {
        get {
            if _nextEvoLvl == nil {
                _nextEvoLvl = ""
            }
            return _nextEvoLvl
        }
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails (completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0 {
                    
                    if let type = types[0]["name"] {
                        self._type = type.capitalizedString
                    }
                    
                    if types.count > 1 {
                        
                        for x in 1 ..< types.count {
                            if let name = types[x]["name"] {
                                self._type! += " / \(name.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0{
                    
                    if let url = descArr[0]["resource_uri"] {
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")
                        Alamofire.request(.GET, nsurl!).responseJSON { response in
                            
                            let desResult = response.result
                            if let descDict = desResult.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                }
                            }
                            
                            completed()
                            
                        }
                    }
                    
                } else {
                    self._description = ""
                }
                
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0{
                    
                    // Make sure not mega (can't support megas yet)
                    if let to = evolutions[0]["to"] as? String {
                        
                        if to.rangeOfString("mega") == nil {
                            if let uri = evolutions[0]["resource_uri"] {
                                
                                let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvoId = num
                                self._nextEvoTxt = to
                                
                                if let lvl = evolutions[0]["level"] as? Int {
                                    self._nextEvoLvl = "\(lvl)"
                                } else {
                                    self._nextEvoLvl = ""
                                }
                                
                                // Some evolutions are wrong due to "baby pokemon"
                                if (self._nextEvoTxt == "Clefairy" && self._name != "Cleffa") || (self._nextEvoTxt == "Pikachu" && self._name != "Pichu") || (self._nextEvoTxt == "Jigglypuff" && self._name != "Igglybuff") || (self._nextEvoTxt == "Togetic" && self._name != "Togepi") || (self._nextEvoTxt == "Jynx" && self._name != "Smoochum") || (self._nextEvoTxt == "Magmar" && self._name != "Magby") || (self._nextEvoTxt == "Electabuzz" && self._name != "Elekid") || (self._nextEvoTxt == "Marill" && self._name != "Azurill") || (self._nextEvoTxt == "Wobbuffet" && self._name != "Wynaut") || (self._nextEvoTxt == "Rosella" && self._name != "Budew") || (self._nextEvoTxt == "Chimecho" && self._name != "Chingling") || (self._nextEvoTxt == "Sudowoodo" && self._name != "Bonsly") || (self._nextEvoTxt == "Mr. Mime" && self._name != "Mime Jr.") || (self._nextEvoTxt == "Chansey" && self._name != "Happiny") || (self._nextEvoTxt == "Snorlax" && self._name != "Munchlax") || (self._nextEvoTxt == "Lucario" && self._name != "Riolu") || (self._nextEvoTxt == "Mantine" && self._name != "Mantyke") {
                                    self._nextEvoTxt = ""
                                    self._nextEvoLvl = ""
                                    self._nextEvoId = ""
                                }
                                
                                if self._name == "Tyrogue" {
                                    self._nextEvoTxt = "Multiple"
                                    self._nextEvoLvl = "20"
                                    self._nextEvoId = "107"
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        completed()
    }
    
}












