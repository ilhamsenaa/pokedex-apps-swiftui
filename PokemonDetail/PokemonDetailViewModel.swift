//
//  PokemonDetailViewModel.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 20/08/23.
//

import Foundation
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    var pokemonNetwork = PokemonNetwork()
    let helper = Helper()
    
    func getPokemonAbility(abilities: [AbilityElement]) -> some View {
        return ForEach(abilities) { ability in
            if (ability.isHidden == false) {
                Text(ability.ability.name.capitalized)
                    .padding(.vertical, 10)
            } else {
                HStack {
                    Text(ability.ability.name.capitalized)
                        .padding(.horizontal, 10)
                    Text("Hidden Ability")
                        .padding(.horizontal, 10)
                }
                .padding(.vertical, 5)
            }
        }
    }
    
    func getPokemonMoveList(moveList: [Moves]) -> some View {
        List{
            ForEach(moveList) { pokemonMove in
                Text(self.helper.replaceSnakeCaseWithNormalString(snakeCaseString: pokemonMove.move.name).capitalized)
            }
        }
    }
    
    func getPokemonGeneralInfo(pokemonDetail: PokemonDetail) -> some View {
        VStack {
                Text("Abilities:")
                    .padding(.top, 20)
                PokemonAbilityCellView(pokemonDetail: pokemonDetail)
            
                Text("Height: \(pokemonDetail.height)")
                    .padding(.top, 20)
                Text("Weight: \(pokemonDetail.weight)")
                    .padding(.top, 20)
        }
    }
    
    func getPokemonTabContent(content: String, pokemonDetail: PokemonDetail) -> some View {
        switch content {
        case "General":
            return AnyView(getPokemonGeneralInfo(pokemonDetail: pokemonDetail))
        case "Moves":
            return AnyView(getPokemonMoveList(moveList: pokemonDetail.moves))
        case "Stats":
            return AnyView(PokemonDetailStats(pokemonDetail: pokemonDetail))
        case "Encounter Location":
            return AnyView(getPokemonGeneralInfo(pokemonDetail: pokemonDetail))
        default:
            return AnyView(getPokemonGeneralInfo(pokemonDetail: pokemonDetail))
        }
    }
}
