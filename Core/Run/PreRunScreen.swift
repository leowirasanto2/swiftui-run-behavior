//
//  PreRunScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI

struct PreRunScreen: View {
    @Binding var path: [RouteDestination]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .center, spacing: 100) {
            Text("Ready to run?")
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
            
            
            NavigationLink {
                RunScreen(path: $path)
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
                dismiss()
            } label: {
                Text("Change plan")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    PreRunScreen(path: .constant([]))
}
