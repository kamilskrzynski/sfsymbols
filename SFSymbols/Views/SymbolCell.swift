//
//  SymbolCell.swift
//  SFSymbols
//
//  Created by Kamil Skrzyński on 21/07/2022.
//

import SwiftUI

struct SymbolCell: View {
    
    let symbol: Symbol
    let isPushed: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var variableValue: Double = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: isPushed ? 30 : 10)
                    .foregroundColor(.primary.opacity(0.15))
                    .frame(width: isPushed ? 300 : 100, height: isPushed ? 240 : 80)
                if symbol.isMulticolor {
                    Image(systemName: symbol.name, variableValue: variableValue)
                        .renderingMode(.original)
                        .foregroundColor(.secondary)
                        .imageScale(.large)
                        .font(.system(size: isPushed ? 90 : 30))
                } else {
                    Image(systemName: symbol.name)
                        .renderingMode(.template)
                        .foregroundColor(.primary)
                        .imageScale(.large)
                        .font(.system(size: isPushed ? 90 : 30))
                }
            }
            Text(symbol.name)
                .font(isPushed ? .title3 : .caption)
                .lineLimit(isPushed ? 2 : nil)
                .multilineTextAlignment(.center)
        }
        .onAppear {
            if !symbol.isVariable {
                timer.upstream.connect().cancel()
            }
        }
        .onReceive(timer) { _ in
            withAnimation {
                if variableValue < 1.0 {
                    variableValue += 0.25
                } else {
                    variableValue = 0.0
                }
            }
        }
    }
}

struct SymbolCell_Previews: PreviewProvider {
    static var previews: some View {
        SymbolCell(
            symbol: Symbol(name: "trash", isMulticolor: true, isVariable: true),
            isPushed: true, variableValue: 1.0
        )
    }
}
