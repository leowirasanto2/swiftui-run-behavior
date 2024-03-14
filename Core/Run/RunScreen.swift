//
//  RunScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI
import MapKit

struct RunScreen: View {
    @Binding var path: [RouteDestination]
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
        }
        .navigationBarBackButtonHidden(true)
        .overlay {
            VStack(alignment: .leading) {
                Spacer()
                
                Button {
                    path.removeAll()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding()
                }
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(Circle())
                .padding(.leading)
                
                RunControlView { result in
                    print(result)
                } onDone: {
                    path.removeAll()
                }
                .padding()
                .background(.white.opacity(0))
            }
            .shadow(radius: 5)
        }
    }
}

#Preview {
    RunScreen(path: .constant([]))
}
