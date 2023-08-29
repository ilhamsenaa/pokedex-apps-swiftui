//
//  PokemonListViewModel.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 11/08/23.
//

import Foundation
import SwiftUI

class PokemonListViewModel: ObservableObject {
    var pokemonNetwork = PokemonNetwork()
    @Published var getPokemon = [PokemonDetail]()

    func getNewPagePokemonList(currentId: Int, lastPokemonCell: Int, pokemonDetail: PokemonDetail) -> some View {
        return ContentView(pokemonDetail: pokemonDetail)
            .onAppear() {
                        if (currentId == (lastPokemonCell+20)) {
                            print("current Pokemon:\(currentId), lastPokemonCell: \(lastPokemonCell), results: \(lastPokemonCell+20)")
                            self.pokemonNetwork.handlePokemonList()
                        }
            }
    }
    
    func getPokemonTypes(types: [PokemonTypes], isHome: Bool) -> some View {
        var trailingType: Int
        if (types.count == 1) {
            trailingType = 107
        } else {
            trailingType = 0
        }
        return ForEach(types) { type in
            PokemonTypeCellView(pokemonTypeName: type.type.name, pokemonTypeSlot: trailingType, backgroundColor: self.getPokemonTypeBackground(type: type.type.name, isHome: isHome))
        }
    }
    
    func getPokemonTypeBackground(type: String, isHome: Bool) -> Color {
        if (isHome == true) {
            return Color.white.opacity(0.25)
        }
        return getTypeColor(type: type)
    }
    
    func getTypeColor(type: String) -> Color {
        switch type {
        case "grass":
            return Color.green
        case "fire":
            return Color.red
        case "water":
            return Color.blue
        case "normal":
            return Color(red: 0.3432, green: 0.3432, blue: 0.3136)
        case "electric":
            return Color.yellow
        case "ground":
            return Color(red: 0.4308, green: 0.3692, blue: 0.2000)
        case "fighting":
            return Color.brown
        case "dark":
            return Color.black
        case "ghost":
            return Color(red: 220/255, green: 220/255, blue: 201/255)
        case "poison":
            return Color(red: 0.5254, green: 0.1864, blue: 0.2881)
        case "ice":
            return Color(red: 0.4627, green: 0.8392, blue: 1.0)
        case "rock":
            return Color(red: 0.2400, green: 0.23, blue: 0.14)
        case "bug":
            return Color(red: 0.4375, green: 0.4792, blue: 0.0833)
        case "dragon":
            return Color(red: 0.2692, green: 0.1346, blue: 0.5962)
        case "psychic":
            return Color.purple
        case "steel":
            return Color(red: 0.3194, green: 0.3194, blue: 0.3611)
        case "fairy":
            return Color(red: 0.4227, green: 0.2718, blue: 0.3055)
        case "flying":
            return Color(red: 0.4227, green: 0.2718, blue: 0.3055)
        default:
            return Color.red
        }
    }
    
    func getPokemonImage(imageUrl: String) -> some View {
        return AsyncImage(url: URL(string: imageUrl)) {
            phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 90)
                    .padding(.bottom, 20)
            } else if phase.error != nil {
                Text("There was an error loading the image.")
                    .padding(10)
                    .frame(width: 170, height: 90)
            } else {
                ProgressView()
                    .padding(30)
                    .frame(width: 170, height: 90)
            }
        }
    }
    
    func formatPokemonId(_ id: Int) -> String {
        return String(format: "#%04d", id)
    }

    init() {
//        getNewPagePokemonList(currentId: <#T##Int#>, lastPokemonCell: <#T##Int#>, pokemonDetail: <#T##PokemonDetail#>)
    }
}
