//
//  PokemonListView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 11/08/23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var pokemonNetwork = PokemonNetwork()
    @StateObject var pokemonViewModel = PokemonListViewModel()
    private let gridItems = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(pokemonNetwork.pokemonDetailArr) { result in
//                        pokemonViewModel.getNewPagePokemonList(currentId: result.id, lastPokemonCell: pokemonNetwork.offsetPokemon, pokemonDetail: result)
                        NavigationLink(destination: PokemonDetailView(pokemonDetail: result)) {
                            ContentView(pokemonDetail: result)
                                .onAppear() {
                                    if result.id == (pokemonNetwork.offsetPokemon+20) {
                                        pokemonNetwork.handlePokemonList()
                                    }
                                }
                        }
                            
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
