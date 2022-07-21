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
                Spacer()
                SymbolCell(symbol: symbol, isPushed: true)
                Spacer()
                Button {
                    copyToClipboard()
                } label: {
                    Label("Copy to clipboard", systemImage: "doc.on.doc.fill")
                        .tint(.secondary)
                        .font(.callout)
                }
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
    
    func copyToClipboard() {
        UIPasteboard.general.string = self.symbol.name
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
