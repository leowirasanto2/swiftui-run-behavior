//
//  PermissionScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 12/03/24.
//

import SwiftUI

struct PermissionScreen: View {
    @State var isLocationGranted = false
    @State var isNotificationGranted = false
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(spacing: 16) {
                Text("To get started, we need \nyour permission")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                PermissionItem(permissionTitle: "Location access", permissionDesc: "Run Behavior is an app to record your run behavior including tracking your path while running.", isGranted: $isLocationGranted)
                    .padding(.bottom)
                    .onTapGesture {
                        isLocationGranted.toggle()
                    }
                
                PermissionItem(permissionTitle: "Notification access", permissionDesc: "Get notified to keep your running shape by enabling the notification access.", isGranted: $isNotificationGranted)
                    .onTapGesture {
                        isNotificationGranted.toggle()
                    }
                
                if isLocationGranted && isNotificationGranted {
                    Button {
                        
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.top)
                } else {
                    Button {
                        
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(true)
                    .padding(.top)
                }
            }
            .padding()
            .background(Color.lightBlack)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    PermissionScreen()
}
