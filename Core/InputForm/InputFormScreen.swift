//
//  InputFormScreen.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 13/03/24.
//

import SwiftUI

enum SelectedForm {
    case date
    case distance
}

struct InputFormScreen: View {
    @State private var selectedForm: SelectedForm = .date
    @State private var start = Date()
    @State private var end = Date()
    @State private var distance = 0.0
    @State private var showSuccessScreen = false
    @State private var isFormEdited = false
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Close button
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .foregroundStyle(.white)
            
            // When
            
            VStack(alignment: .leading) {
                if selectedForm == .date {
                    // Expanded
                    VStack(alignment: .leading, spacing: 16) {
                        Text("When did you run?")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        VStack {
                            DatePicker("Start time", selection: $start, displayedComponents: [.date, .hourAndMinute])
                                .onChange(of: start) { oldValue, newValue in
                                    if newValue > end {
                                        end = newValue
                                    }
                                    isFormEdited = true
                                }
                            Divider()
                            DatePicker("Stop time", selection: $end, displayedComponents: [.date, .hourAndMinute])
                                .onChange(of: end) { oldValue, newValue in
                                    isFormEdited = true
                                }
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    }
                    .padding()
                    .background()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        if isDateInvalid() {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        }
                    }
                } else {
                    // Collapsed
                    CollapsedFormItem(title: "When", description: "Add dates")
                        .overlay {
                            if isDateInvalid() {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 2)
                            }
                        }
                }
                if isDateInvalid() {
                    Text("Start time couldn't be more than stop time.")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                }
            }
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedForm = .date
                }
            }
            .padding(.horizontal)
            
            // Distance
            
            VStack(alignment: .leading) {
                if selectedForm == .distance {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("How long did you run?")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Stepper {
                            Text("\(distance, specifier: "%.2f") kilometers")
                        } onIncrement: {
                            distance += 0.25
                        } onDecrement: {
                            guard distance > 0 else { return }
                            distance -= 0.25
                        }
                    }
                    .padding()
                    .background()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    CollapsedFormItem(title: "Distance", description: "Add distance")
                }
            }
            .padding(.horizontal)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedForm = .distance
                }
            }
            
            // Save button
            
            Button {
                guard isReadyToSave() else { return }
                showSuccessScreen.toggle()
            } label: {
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "opticaldiscdrive")
                        .foregroundStyle(.white)
                    
                    Text("Save")
                        .textCase(.uppercase)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(isReadyToSave() ? Color.green : Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .overlay {
            if showSuccessScreen {
                SuccessInputFormScreen()
                    .task {
                        try? await Task.sleep(nanoseconds: 2_000_000_000)
                        show = false
                    }
            }
        }
    }
    
    func isDateInvalid() -> Bool {
        start > end
    }
    
    func isReadyToSave() -> Bool {
        !isDateInvalid() && isFormEdited
    }
}

#Preview {
    InputFormScreen(show: .constant(true))
}
