//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Salih KIR on 8.05.2022.
//


import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let count: Int
    let next, previous: String?
    let results: [PokemonResult]
}

// MARK: - Result
struct PokemonResult: Codable {
    let name: String
    let url: String
}
