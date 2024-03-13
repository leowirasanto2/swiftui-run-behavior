//
//  DashboardView.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 12/03/24.
//

import SwiftUI

struct RouteDestination {
    static let permissionScreen = "permission_screen"
    static let runScreen = "run_screen"
    static let formScreen = "form_screen"
}

struct DashboardView: View {
    @State private var navigationPath = NavigationPath()
    @State private var isPermissionGranted = false
    @State private var showForm = false
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            if showForm {
                InputFormScreen(show: $showForm)
            } else {
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
                            withAnimation(.snappy) {
                                showForm.toggle()
                            }
                        }
                        .padding()
                    }
                    .tabViewStyle(.page)
                    .frame(height: 550)
                    
                    Spacer()
                    
                    NavigationLink {
                        if isPermissionGranted {
                            Text("granted")
                        } else {
                            PermissionScreen()
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
            }
        }
    }
}

#Preview {
    DashboardView()
}
