//
//  RunStatisticCarouselItem.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 12/03/24.
//

import Charts
import SwiftUI

struct RunStatisticCarouselItem: View {
    @State var dataPoint: [RunDataPoint] = DummyData.generateRunStatisticDataPoints()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Your runs")
                    .font(.headline)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundStyle(.black)
                }
            }
            .padding(.bottom)
            
            HStack(alignment: .firstTextBaseline) {
                Text("114")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                
                Text("km")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundStyle(.orange)
                
                Spacer()
            }
            
            Text("This month")
                .font(.footnote)
                .foregroundStyle(.gray)
            
            Chart {
                ForEach(dataPoint, id: \.id) { point in
                    BarMark(
                        x: .value("Day", Calendar.current.component(.day, from: point.day)),
                        y: .value("Distance", point.distance))
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { date in
                AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                }
            }
            .frame(height: 300)
            
            
        }
        .padding()
        .background(Color.skeletonWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    RunStatisticCarouselItem()
}

struct RunDataPoint {
    var id = UUID()
    var day: Date
    var distance: Double
}

struct DummyData {
    static func generateRunStatisticDataPoints() -> [RunDataPoint] {
        return [
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -11, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 12.5),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -10, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 10.2),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -9, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 3.3),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -8, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 2.1),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -7, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 1.5),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -6, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 3.6),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -5, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 6),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -4, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 5),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -3, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 9),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -2, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 1),
            RunDataPoint(day: Calendar.current.date(byAdding: .day, value: -1, to: Calendar.current.startOfDay(for: Date())) ?? Date(), distance: 11),
            RunDataPoint(day: Calendar.current.startOfDay(for: Date()), distance: 11),
        ]
    }
}
