//
//  SuccessInputFormScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI

struct SuccessInputFormScreen: View {
    var body: some View {
        VStack {
            withAnimation(.smooth) {
                VStack(spacing: 16) {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    
                    Text("Your run recorded! :D")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.6))
    }
}

#Preview {
    SuccessInputFormScreen()
}
