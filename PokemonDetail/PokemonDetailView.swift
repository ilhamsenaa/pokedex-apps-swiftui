//
//  PokemonDetailView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 20/08/23.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemonDetail: PokemonDetail
    @StateObject var pokemonViewModel = PokemonListViewModel()
    @StateObject var pokemonDetailViewModel = PokemonDetailViewModel()
    @State var tabBarItemName = "General"
    
    var body: some View {
        VStack {
            HStack {
                Text("\(pokemonDetail.name.capitalized)")
                    .font(.system(size: 20, weight: .bold))
                Text("\(pokemonViewModel.formatPokemonId(pokemonDetail.id))")
                    .font(.system(size: 20, weight: .bold))
            }
            .padding(.bottom, 20)
            
            pokemonViewModel.getPokemonImage(imageUrl: pokemonDetail.sprites.other.officialArtwork.front_default)
            
            HStack {
                pokemonViewModel.getPokemonTypes(types: pokemonDetail.types, isHome: false)
            }
            .padding(.bottom, 20)
            
            TabBarView(tabBarItems: ["General", "Moves", "Stats", "Encounter Location"], selectedTabName: $tabBarItemName)
            pokemonDetailViewModel.getPokemonTabContent(content: tabBarItemName, pokemonDetail: pokemonDetail)
                
//            ScrollView {
//                pokemonDetailViewModel.getPokemonMoveList(moveList: pokemonDetail.moves)
//            }
        }
        
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView()
//    }
//}
