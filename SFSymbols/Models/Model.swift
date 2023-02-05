//
//  Model.swift
//  SFSymbols
//
//  Created by Kamil Skrzyński on 20/07/2022.
//

import Foundation

enum Selection: String, CaseIterable {
    case byDefault = "Sorted by default"
    case byName = "Sorted by name"
    case multicolored = "Multicolored only"
    case variable = "Variables"
}

class Model {
    
    var symbolsSortedByDefault: [Symbol] = []
    var symbolsSortedByName: [Symbol] = []
    var multicoloredSymbols: [Symbol] = []
    var variableSymbols: [Symbol] = []
    
    init() {
        getSymbols()
    }
    
    func selectedSymbols(for selection: Selection, searchFilter: String = "") -> [Symbol] {
        
        var symbols = [Symbol]()
        
        switch selection {
        case .byDefault:
            symbols = symbolsSortedByDefault
        case .byName:
            symbols = symbolsSortedByName
        case .multicolored:
            symbols = multicoloredSymbols
        case .variable:
            symbols = variableSymbols
        }
        
        if searchFilter.isEmpty {
            return symbols
        }
        
        return symbols.filter { $0.name.lowercased().contains(searchFilter.lowercased())}
    }
}

extension Model {
    
    func getSymbols() {
        let byDefault = getSymbolsFromFile(fileName: "ByDefault")
        let byName = getSymbolsFromFile(fileName: "ByName")
        let multicolored = getSymbolsFromFile(fileName: "Multicolored")
        let variable = getSymbolsFromFile(fileName: "Variable")

        multicoloredSymbols = multicolored.map {
            Symbol(name: $0, isMulticolor: true, isVariable: variable.contains($0))
        }

        variableSymbols = variable.map {
            Symbol(name: $0, isMulticolor: multicolored.contains($0), isVariable: true)
        }
        
        symbolsSortedByName = byName.map {
            Symbol(name: $0, isMulticolor: multicolored.contains($0), isVariable: variable.contains($0))
        }
        
        symbolsSortedByDefault = byDefault.map {
            Symbol(name: $0, isMulticolor: multicolored.contains($0), isVariable: variable.contains($0))
        }
    }
    
    func getSymbolsFromFile(fileName: String) -> [String] {
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let symbolsArray = try? String(contentsOf: file) else { return [] }
        return symbolsArray.split(separator: "\n").compactMap { String($0).isEmpty ? nil : String($0) }
    }
}
