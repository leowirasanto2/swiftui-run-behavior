//
//  CollapsedFormItem.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI

struct CollapsedFormItem: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Text(description)
                .foregroundStyle(.black)
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CollapsedFormItem(title: "When", description: "Add dates")
}
