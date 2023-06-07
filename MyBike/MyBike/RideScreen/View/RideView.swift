//
//  RideView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct RideView: View {
    var allRides: [RideModel]
    var allStatistics: [StatisticsData]
    
    var body: some View {
        VStack{
            StatisticsView(allStatistics: allStatistics)
            VStack(alignment: .leading) {
                List(allRides, id: \.self) { item in
                    RideCell(model: item)
                        .listRowBackground(Color.black)
                        .listRowInsets(.init(top: 5,
                                             leading: 0,
                                             bottom: 5,
                                            trailing: 0))
                }
                .scrollContentBackground(.hidden)
                
            }
            .background(.black)
        }
    }
    }


struct RideView_Previews: PreviewProvider {
    static var previews: some View {
        RideView(allRides: [.testRide()], allStatistics: [
            StatisticsData(color: ".green", value: 1300, bikeName: "Road", bikeID: UUID()),
            StatisticsData(color: ".yellow", value: 500, bikeName: "E-bike", bikeID: UUID()),
            StatisticsData(color: ".red", value: 1300, bikeName: "Distrugatorul", bikeID: UUID()),
            StatisticsData(color: ".pink", value: 100, bikeName: "MTB", bikeID: UUID())])
    }
}
