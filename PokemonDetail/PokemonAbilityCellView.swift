//
//  PokemonAbilityCellView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 20/08/23.
//

import SwiftUI

struct PokemonAbilityCellView: View {
    @StateObject var pokemonDetailViewModel = PokemonDetailViewModel()
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        ContainerView {
            pokemonDetailViewModel.getPokemonAbility(abilities: pokemonDetail.abilities)
        }
    }
}

//struct PokemonAbilityCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonAbilityCellView()
//    }
//}
