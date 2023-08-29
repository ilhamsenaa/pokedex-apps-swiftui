//
//  PokemonMovesListView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 21/08/23.
//

import SwiftUI

struct PokemonMovesListView<MovesList: View>: View {
    let pokemonMovesList: MovesList
    
    init(@ViewBuilder pokemonMovesList: @escaping () -> MovesList) {
        self.pokemonMovesList = pokemonMovesList()
    }
    
    var body: some View {
        ScrollView {
            pokemonMovesList
        }
    }
}

//struct PokemonMovesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonMovesListView()
//    }
//}
