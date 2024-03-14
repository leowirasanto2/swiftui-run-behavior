//
//  DashboardView.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 12/03/24.
//

import SwiftUI

enum RouteDestination: Int {
    case permissionScreen
    case runScreen
    case preRunScreen
    case formScreen
}

struct DashboardView: View {
    @State private var path = [RouteDestination]()
    @State private var isPermissionGranted = false
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    RunStatisticCarouselItem()
                        .padding()
                    
                    FillFormCarouselItem {
                        path = [RouteDestination.formScreen]
                    }
                    .padding()
                }
                .tabViewStyle(.page)
                .frame(height: 550)
                
                Spacer()
                
                Button {
                    if isPermissionGranted {
                        path = [RouteDestination.preRunScreen]
                    } else {
                        path = [RouteDestination.permissionScreen]
                    }
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
            .navigationDestination(for: RouteDestination.self) { selected in
                switch selected {
                case .formScreen:
                    InputFormScreen()
                case .permissionScreen:
                    PermissionScreen(path: $path) {
                        isPermissionGranted = true
                    }
                case .preRunScreen:
                    PreRunScreen(path: $path)
                case .runScreen:
                    RunScreen(path: $path)
                }
            }
        }
        
    }
}

#Preview {
    DashboardView()
}
