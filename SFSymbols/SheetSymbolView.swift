//
//  SheetSymbolView.swift
//  SFSymbols
//
//  Created by Kamil Skrzyński on 20/07/2022.
//

import SwiftUI

struct SheetSymbolView: View {
    
    let symbol: Symbol
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.primary.opacity(0.15))
                        .frame(width: 300, height: 210)
                    Image(systemName: symbol.name)
                        .font(.system(size: 100))
                }
                Text(symbol.name)
                    .font(.title3)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.primary.opacity(0.7))
                            .font(.system(size: 25))
                    }
                }
            }
        }
    }
}

struct SheetSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SheetSymbolView(symbol:
                            Symbol(
                                name: "pencil.tip.crop.circle.badge.plus",
                                isMulticolor: false)
        )
    }
}
