//
//  ContentView.swift
//  SFSymbols
//
//  Created by Kamil Skrzyński on 15/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    private let viewModel = Model()
    @State private var selection: Selection = .byName
    @State private var search: String = ""
    
    let columns: [GridItem] = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                Text("Total symbols: \(viewModel.selectedSymbols(for: selection, searchFilter: search).count)")
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.selectedSymbols(for: selection, searchFilter: search), id: \.self) { symbol in
                        GridSymbolView(symbol: symbol)
                    }
                }
                .searchable(text: $search)
            }
            .navigationTitle("SF Symbols")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker(selection: $selection, label: Text("Sort")) {
                            ForEach(Selection.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .tint(.primary.opacity(0.8))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
