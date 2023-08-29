//
//  PokemonModel.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 11/08/23.
//

import Foundation
import SwiftUI

struct PokemonList: Codable {
    
    var count: Int
    var next: String?
    var previous: String?
    var results: [Results]
}

struct Results: Codable, Identifiable {
    var id: String {
        return name
    }
    var name: String
    var url: String
}

struct PokemonDetail: Codable, Identifiable {
    var id: Int
    var name: String
    var height: Int
    var weight: Int
    var types: [PokemonTypes]
    var sprites: Sprites
    var abilities: [AbilityElement]
    let moves: [Moves]
    let stats: [StatElement]
}

struct PokemonTypes: Codable, Identifiable {
    var id: Int {
        return slot
    }
    var slot: Int
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
    var url: String
}

struct Sprites: Codable {
    var front_default: String
    var other: SpritesOther
}

struct SpritesOther: Codable {
    var officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    var front_default: String
    var front_shiny: String
}

struct AbilityElement: Codable, Identifiable {
    let ability: Ability
    let isHidden: Bool
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case id = "slot"
    }
}

struct Ability: Codable {
    let name: String
    let url: String
}

struct Moves: Codable, Identifiable {
    var id = UUID()
    let move: Move
    let versionGroupDetail: [VersionGroupDetail]
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetail = "version_group_details"
    }
}

struct Move: Codable {
    let name: String
    let url: String
}

struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Move
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

struct StatElement: Codable, Identifiable {
    var id = UUID()
    let baseStat, effort: Int
    let stat: StatStat

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct StatStat: Codable {
    let name: String
    let url: String
}
