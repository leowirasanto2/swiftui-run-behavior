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
    @State var isMinimized = false
    
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
                
                VStack(spacing: 16) {
                    Button {
                        withAnimation(.snappy) {
                            isMinimized.toggle()
                        }
                    } label: {
                        if isMinimized {
                            Image(systemName: "chevron.compact.up")
                                .resizable()
                                .frame(width: 30, height: 14)
                                .foregroundStyle(.white)
                        } else {
                            Image(systemName: "chevron.compact.down")
                                .resizable()
                                .frame(width: 30, height: 14)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    if isMinimized {
                        VStack(spacing: 16) {
                            Text("Duration")
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text("00:00:00")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.lightBlack)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        VStack(spacing: 16) {
                            Text("Duration")
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text("00:00:00")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.lightBlack)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        HStack(spacing: 16) {
                            VStack(spacing: 16) {
                                Text("Distance (KM)")
                                    .foregroundStyle(.white)
                                Text("7.5")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.lightBlack)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(spacing: 16) {
                                Text("Current Region")
                                    .foregroundStyle(.white)
                                Text("Denpasar")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.lightBlack)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("Pause")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.gray)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Button {
                                
                            } label: {
                                Text("Stop")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.red)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 22))
            }
            .padding()
            .background(.white.opacity(0))
        }
    }
}

#Preview {
    RunScreen()
}
