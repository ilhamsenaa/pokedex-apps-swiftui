//
//  PokemonDetailStats.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 27/08/23.
//

import SwiftUI

struct PokemonDetailStats: View {
    let helper = Helper()
    let pokemonDetail: PokemonDetail
    let pokemonMaxStats = 200.0
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(pokemonDetail.stats) { pokemonStats in
                HStack() {
                    Text("\(self.helper.replaceSnakeCaseWithNormalString(snakeCaseString: pokemonStats.stat.name).capitalized): \(pokemonStats.baseStat)")
                    ProgressView(value: Double(pokemonStats.baseStat)/pokemonMaxStats)
                        .frame(width: 200)
                }
                .padding(.top, 20)
            }
        }
    }
}

//struct PokemonDetailStats_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailStats()
//    }
//}
