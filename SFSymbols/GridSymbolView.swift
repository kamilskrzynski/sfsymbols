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
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.primary.opacity(0.15))
                        .frame(width: 100, height: 80)
                    if symbol.isMulticolor {
                        Image(systemName: symbol.name)
                            .renderingMode(.original)
                            .imageScale(.large)
                            .font(.system(size: 30))
                    } else {
                        Image(systemName: symbol.name)
                            .renderingMode(.template)
                            .foregroundColor(.primary)
                            .imageScale(.large)
                            .font(.system(size: 30))
                    }
                }
                Text(symbol.name)
                    .font(.caption)
                    .multilineTextAlignment(.center)
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
                            isMulticolor: false)
    )
    }
}
