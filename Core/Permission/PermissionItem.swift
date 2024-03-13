//
//  PermissionItem.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI

struct PermissionItem: View {
    let permissionTitle: String
    let permissionDesc: String
    @Binding var isGranted: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                if isGranted {
                    Circle()
                        .fill(Color.green)
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 30, height: 30)
                } else {
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 30, height: 30)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(permissionTitle)
                        .textCase(.uppercase)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Text(permissionDesc)
                        .font(.footnote)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    PermissionItem(permissionTitle: "Title", permissionDesc: "Description here.", isGranted: .constant(false))
}
