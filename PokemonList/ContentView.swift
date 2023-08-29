//
//  ContentView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 10/08/23.
//

import SwiftUI

struct ContentView: View {
    
    let pokemonDetail: PokemonDetail
    @StateObject var pokemonViewModel = PokemonListViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(pokemonViewModel.formatPokemonId(pokemonDetail.id))")
                        .font(.headline)
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                    Text(pokemonDetail.name.capitalized)
                        .font(.headline)
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                }
                HStack {
                    pokemonViewModel.getPokemonTypes(types: pokemonDetail.types, isHome: true)
                    pokemonViewModel.getPokemonImage(imageUrl: pokemonDetail.sprites.other.officialArtwork.front_default)
                }
            }
        }
        .background(pokemonViewModel.getTypeColor(type: pokemonDetail.types[0].type.name))
        .cornerRadius(12)
        .shadow(color: pokemonViewModel.getTypeColor(type: pokemonDetail.types[0].type.name), radius: 6, x: 0.0, y: 0.0)
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
