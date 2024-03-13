//
//  PreRunScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI

struct PreRunScreen: View {
    var body: some View {
        VStack(alignment: .center, spacing: 100) {
            Text("Ready to run?")
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
            
            Button {
                
            } label: {
                Text("GO!")
                    .font(.largeTitle)
                    .italic()
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(50)
                    .clipShape(Circle())
                    .background(
                        Circle()
                            .fill(
                                .shadow(.inner(color: .black, radius: 3, x: -2, y: 2))
                            )
                            .foregroundStyle(Color.green)
                    )
            }
            
            Button {
                
            } label: {
                Text("Change plan")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    PreRunScreen()
}
