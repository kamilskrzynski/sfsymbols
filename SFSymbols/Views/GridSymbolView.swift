//
//  GridSymbolView.swift
//  SFSymbols
//
//  Created by Kamil Skrzyński on 20/07/2022.
//

import SwiftUI

struct GridSymbolView: View {
    
    let symbol: Symbol
    @State private var selectedSymbol: Symbol? = nil
    
    var body: some View {
        Button {
            selectedSymbol = symbol
        } label: {
            VStack {
                SymbolCell(symbol: symbol, isPushed: false)
            }
            .tint(.primary)
            .frame(width: 100, height: 110)
        }
        .sheet(item: $selectedSymbol) { symbol in
            SheetSymbolView(symbol: symbol)
        }
    }
}

struct GridSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        GridSymbolView(symbol:
                        Symbol(
                            name: "pencil.tip.crop.circle.badge.plus",
                            isMulticolor: false,
                            isVariable: true
                        )
        )
    }
}
