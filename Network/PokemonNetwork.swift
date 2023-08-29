//
//  PokemonNetwork.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 13/08/23.
//

import Foundation
import UIKit

class PokemonNetwork: ObservableObject {
    @Published var results = [Results]()
    @Published var count: Int = 0
    @Published var pokemonUrlList = [String]()
//    @Published var pokemonSprites: Sprites = Sprites(front_default: "")
    @Published var pokemonDetail: PokemonDetail?
    @Published var pokemonDetailArr = [PokemonDetail]()
    var totalPokemon = 20
    var number = 0
    @Published var offsetPokemon = 0
    let basePokemonDetailUrlString = "https://pokeapi.co/api/v2/pokemon"
    
    init() {
//        self.pokemonDetail = PokemonDetail (id: 0, name: "", height: 0, weight: 0, types: [], sprites: Sprites.init(front_default: "", other: SpritesOther.init(officialArtwork: OfficialArtwork.init(front_default: "", front_shiny: ""))))
        loadDataList()
    }
    
    func handlePokemonList() {
        results.removeAll()
        offsetPokemon += 20
        loadDataList()
    }
}

extension PokemonNetwork {
    @MainActor
    func fetchPokemonList() async throws {
        var pokemonUrlString: String { "\(basePokemonDetailUrlString)?limit=\(totalPokemon)&offset=\(offsetPokemon)" }
        guard let pokemonDetailUrl = URL(string: pokemonUrlString) else { return }
        let (data, response) = try await URLSession.shared.data(from: pokemonDetailUrl)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
        guard let pokemonList = try? JSONDecoder().decode(PokemonList.self, from: data) else { return }
        
        self.results.append(contentsOf: pokemonList.results)
    }
    
    @MainActor
    func fetchPokemonDetail(url: String) async throws {
        let pokemonUrlString = url
        guard let pokemonDetailUrl = URL(string: pokemonUrlString) else { return }
        let (data, response) = try await URLSession.shared.data(from: pokemonDetailUrl)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
        guard let pokemonDetail = try? JSONDecoder().decode(PokemonDetail.self, from: data) else { return }
        
        self.pokemonDetailArr.append(pokemonDetail)
    }
    
    func loadDataDetail(url: String) {
        Task(priority: .medium) {
            try await fetchPokemonDetail(url: url)
        }
    }
    
    func loadDataList() {
        Task(priority: .high) {
            do {
                try await fetchPokemonList()
                for pokemonId in results {
                    do {
                        try await self.fetchPokemonDetail(url: pokemonId.url)
                    } catch {
                        print ("error")
                    }
                }
            }
        }
    }
}
