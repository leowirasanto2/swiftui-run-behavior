//
//  PermissionScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 12/03/24.
//

import SwiftUI

struct PermissionScreen: View {
    @State private var isLocationGranted = false
    @State private var isNotificationGranted = false
    @Environment(\.dismiss) private var dismiss
    var onAllPermissionsGranted: () -> ()
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(spacing: 16) {
                Text("To get started, we need \nyour permission")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                    .padding()
                
                PermissionItem(permissionTitle: "Location access", permissionDesc: "Run Behavior is an app to record your run behavior including tracking your path while running.", isGranted: $isLocationGranted)
                    .padding(.horizontal)
                    .onTapGesture {
                        isLocationGranted.toggle()
                    }
                
                PermissionItem(permissionTitle: "Notification access", permissionDesc: "Get notified to keep your running shape by enabling the notification access.", isGranted: $isNotificationGranted)
                    .padding(.horizontal)
                    .onTapGesture {
                        isNotificationGranted.toggle()
                    }
                
                if isLocationGranted && isNotificationGranted {
                    Button {
                        onAllPermissionsGranted()
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()
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
                    .padding()
                }
            }
            .background(Color.lightBlack)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    PermissionScreen {
    }
}
