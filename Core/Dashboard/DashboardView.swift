//
//  DashboardView.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 12/03/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello!")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    Text("Leo Laia")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Image("leo-pp")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
            }
            .padding()
            
            TabView {
                ForEach(0..<2) { index in
                    RunStatisticCarouselItem()
                        .padding()
                }
            }
            .tabViewStyle(.page)
            .frame(height: 550)
            
            Spacer()
            
            Button {
                
            } label: {
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.run")
                        .foregroundStyle(.white)
                    
                    Text("Run")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color.black)
        
        
    }
}

#Preview {
    DashboardView()
}
