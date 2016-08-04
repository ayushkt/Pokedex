//
//  Constants.swift
//  Pokedex
//
//  Created by Ayush Kumar on 8/2/16.
//  Copyright © 2016 Ayush Kumar. All rights reserved.
//

import Foundation

var HEIGHTS: [String : String] = ["Chespin":"4", "Quilladin":"7", "Chesnaught":"16", "Fennekin":"4", "Braixen":"10", "Delphox":"15", "Froakie":"3", "Frogadier":"6", "Greninja":"15", "Bunnelby":"4", "Diggersby":"10", "Fletchling":"3", "Fletchinder":"7", "Talonflame":"12", "Scatterbug":"3", "Spewpa":"3", "Vivillon":"12", "Litleo":"6", "Pyroar":"15", "Flabebe":"1", "Floette":"2", "Florges":"11", "Skiddo":"9", "Gogoat":"17", "Pancham":"6", "Pangoro":"21", "Furfrou":"12", "Espurr":"3", "Meowstic-Male":"6", "Honedge":"8", "Doublade":"8.4", "Aegislash-Shield":"17", "Spritzee":"2", "Aromatisse":"8", "Swirlix":"4", "Slurpuff":"8", "Inkay":"4", "Malamar":"15", "Binacle":"5", "Barbaracle":"13", "Skrelp":"5", "Dragalge":"18", "Clauncher":"5", "Clawitzer":"13", "Helioptile":"5", "Heliolisk":"10", "Tyrunt":"8", "Tyrantrum":"25", "Amaura":"13", "Aurorus":"27", "Sylveon":"10", "Hawlucha":"8", "Dedenne":"2", "Carbink":"3", "Goomy":"3", "Sliggoo":"8", "Goodra":"20", "Klefki":"2", "Phantump":"4", "Trevenant":"15", "Pumpkaboo-Average":"4", "Gourgeist-Average":"17", "Bergmite":"10", "Avalugg":"20", "Noibat":"5", "Noivern":"15", "Xerneas":"30", "Yveltal":"58", "Zygarde":"50"]
var WEIGHTS: [String : String] = ["Chespin":"90", "Quilladin":"290", "Chesnaught":"900", "Fennekin":"94", "Braixen":"145", "Delphox":"390", "Froakie":"70", "Frogadier":"109", "Greninja":"400", "Bunnelby":"50", "Diggersby":"424", "Fletchling":"17", "Fletchinder":"160", "Talonflame":"245", "Scatterbug":"25", "Spewpa":"84", "Vivillon":"170", "Litleo":"135", "Pyroar":"815", "Flabebe":"1", "Floette":"9", "Florges":"100", "Skiddo":"310", "Gogoat":"910", "Pancham":"80", "Pangoro":"1360", "Furfrou":"280", "Espurr":"35", "Meowstic-Male":"85", "Honedge":"20", "Doublade":"45", "Aegislash-Shield":"530", "Spritzee":"5", "Aromatisse":"155", "Swirlix":"35", "Slurpuff":"50", "Inkay":"35", "Malamar":"470", "Binacle":"310", "Barbaracle":"960", "Skrelp":"73", "Dragalge":"815", "Clauncher":"83", "Clawitzer":"353", "Helioptile":"60", "Heliolisk":"210", "Tyrunt":"260", "Tyrantrum":"2700", "Amaura":"252", "Aurorus":"2250", "Sylveon":"235", "Hawlucha":"215", "Dedenne":"22", "Carbink":"57", "Goomy":"28", "Sliggoo":"175", "Goodra":"1505", "Klefki":"30", "Phantump":"70", "Trevenant":"710", "Pumpkaboo-Average":"50", "Gourgeist-Average":"390", "Bergmite":"995", "Avalugg":"5050", "Noibat":"80", "Noivern":"850", "Xerneas":"2150", "Yveltal":"2030", "Zygarde":"3050"]
let URL_BASE = "https://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/"

typealias DownloadComplete = () -> ()

