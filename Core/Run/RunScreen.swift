//
//  RunScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI
import MapKit

struct RunScreen: View {
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 37.334_900,longitude: -122.009_020),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    @State var currentPosition: CLLocationCoordinate2D = .init(latitude: -8.650000, longitude: 115.216667)
    
    var body: some View {
        VStack {
            Map(initialPosition: .camera(.init(centerCoordinate: currentPosition, distance: 1500))) {
                Marker(coordinate: currentPosition) {
                    Image(systemName: "figure.run.circle.fill")
                }
                .tint(.green)
            }
            .frame(width: .infinity, height: .infinity)
        }
        .overlay {
            VStack {
                Spacer()
                
                RunControlView()
                .padding()
                .background(.white.opacity(0))
            }
        }
    }
}

#Preview {
    RunScreen()
}
