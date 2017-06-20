//
//  Pokemon.swift
//  NetworkingAlamo
//
//  Created by Christian Arias on 12/15/16.
//  Copyright © 2016 apeamac. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height:String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(10)/"
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var weight: String {
        return _weight
    }
    
    var height: String {
        return _height
    }
    
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        let url = URL(string: _pokemonUrl)!
        Alamofire.request(url).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    if let name = types[0]["name"] {
                        self._name = name
                    }
                    
                }
             completed()
            }
        }
    }
    
    
    
}
