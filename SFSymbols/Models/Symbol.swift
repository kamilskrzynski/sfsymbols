//
//  Symbol.swift
//  SFSymbols
//
//  Created by Kamil Skrzyński on 20/07/2022.
//

import Foundation

struct Symbol: Hashable, Identifiable {
    
    let id = UUID()
    let name: String
    let isMulticolor: Bool
    let isVariable: Bool
}
