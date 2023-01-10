//
//  PokemonSelected.swift
//  Pokedex SwiftUI
//
//  Created by Bian Damara on 10/01/23.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
    var wight: Int
}

struct PokemonSprites: Codable {
    var front_default: String?
}

class PokemonSelectedAPI {
    func getSprite(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url ) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
            
        }.resume()
    }
}
