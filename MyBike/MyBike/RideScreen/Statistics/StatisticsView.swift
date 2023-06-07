//
//  StatisticsView.swift
//  MyBike
//
//  Created by Darius Couti on 07.06.2023.
//

import SwiftUI

struct StatisticsData: Hashable {
    let color: Color
    let value: Int
    let bikeName: String
    let bikeID: UUID
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(bikeID)
    }
}

struct StatisticsView: View {
    let allStatistics: [StatisticsData]
    
    var body: some View {
        VStack {
            Text("All Rides Statistics")
            ZStack {
                createBackground()
                VStack {
                    createStatisticsView()
                    Text("Total: \(getTotal())")
                }
            }
        }
    }
    
    // MARK: - Private
    
    @ViewBuilder
    private func createBackground() -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(0..<9) { _ in
                    Rectangle()
                        .size(width: geometry.size.width - 5,
                                     height: 1)
                        .foregroundColor(.clear)
                        .cornerRadius(2)
                        .border(.blue, width: 0.5)
                }
            }
        }
    }
    
    @ViewBuilder
    private func createStatisticsView() -> some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom) {
                ForEach(allStatistics, id: \.self) { statistic in
                    VStack() {
                        Rectangle()
                            .size(width: calculateWidthFor(geometry.size.width),
                                         height: calculateHeightFor(statistic.value, geometry.size.height - 100))
                            .foregroundColor(statistic.color)
                            .cornerRadius(2)
                            .rotationEffect(Angle(degrees: 180))
                        Text(statistic.bikeName).scaledToFit()
                    }
                    
                }
            }.padding(20)
        }
    }
    
    private func calculateHeightFor(_ value: Int, _ totalHeight: CGFloat) -> CGFloat {
        return CGFloat(value) * totalHeight / CGFloat(getMaxValue())
    }
    
    private func calculateWidthFor(_ totalWidth: CGFloat) -> CGFloat {
        return totalWidth / CGFloat(allStatistics.count) - 15
    }
     
    private func getMaxValue() -> Int {
        guard var max = allStatistics.first?.value else {
            return 0
        }
        for statistic in allStatistics {
            if statistic.value > max {
                max = statistic.value
            }
        }
        return max
    }
    
    private func getTotal() -> Int {
        return allStatistics.reduce(0) {
            return $0 + $1.value
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(allStatistics: [
            StatisticsData(color: .green, value: 1300, bikeName: "Road", bikeID: UUID()),
            StatisticsData(color: .yellow, value: 500, bikeName: "E-bike", bikeID: UUID()),
            StatisticsData(color: .red, value: 1300, bikeName: "Distrugatorul", bikeID: UUID()),
            StatisticsData(color: .pink, value: 100, bikeName: "MTB", bikeID: UUID())]).frame(height: 350)
    }
}
