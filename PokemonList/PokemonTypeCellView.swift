//
//  PokemonTypeCellView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 17/08/23.
//

import SwiftUI

struct PokemonTypeCellView: View {
    let pokemonTypeName: String
    let pokemonTypeSlot: Int
    var cgfloat: CGFloat {
        CGFloat(pokemonTypeSlot)
    }
    let backgroundColor: Color
    var body: some View {
        Text(pokemonTypeName.capitalized)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(backgroundColor, lineWidth: 2)
                )
                .background(backgroundColor)
                .cornerRadius(10)
                .frame(width: 100, height: 12)
                .padding(.trailing, cgfloat)
    }
}

//struct PokemonTypeCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonTypeCellView(pokemonTypeName: "lala", pokemonTypeSlot: 2)
//    }
//}
