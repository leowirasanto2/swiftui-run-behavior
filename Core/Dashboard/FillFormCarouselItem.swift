//
//  FillFormCarouselItem.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 12/03/24.
//

import SwiftUI

struct FillFormCarouselItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Did you forget to record your last run?")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            Text("Don't worry, you can record it here \nby filling the form :)")
                .font(.subheadline)
                .padding(.bottom)
            
            Image("fill-form-carousel-bg")
                .resizable()
                .blur(radius: 5)
                .frame(height: 250)
                .overlay {
                    Button {
                        
                    } label: {
                        Text("Tap to fill the form!")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

        }
        .padding()
        .background(Color.skeletonWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    FillFormCarouselItem()
}
