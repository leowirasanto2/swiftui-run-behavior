//
//  RunControlView.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI

struct RunControlView: View {
    @State var isMinimized: Bool = false
    
    var body: some View {
        VStack {
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
            .gesture(
            DragGesture()
                .onEnded { offset in
                    withAnimation(.snappy) {
                        switch(offset.translation.width, offset.translation.height) {
                        case (-100...100, ...0):
                            isMinimized = false
                        case (-100...100, 0...):
                            isMinimized = true
                        default: break
                        }
                    }
                }
            )
            .padding()
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 22))
        }
    }
}

#Preview {
    RunControlView()
}
