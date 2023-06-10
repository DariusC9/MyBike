//
//  RideView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct RideView: View {
    @State var allRides: [RideModel]
    @State var allStatistics: [StatisticsData]
    @State private var goToAddRideView = false
    
    var body: some View {
        VStack(spacing: 0) {
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
                .padding(.horizontal, -20)
                
            }
            .background(.black)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: NavigationLink(destination: AddRideView(), isActive: $goToAddRideView) {
            },
            trailing: Button(action: {
                goToAddRideView.toggle()
            }) {
                HStack {
                    Image("icon_add")
                    Text("Add Ride")
                        .foregroundColor(.blue)
                        .font(Fonts.navBar)
                }
            }
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Rides")
                        .bold()
                        .foregroundColor(.white)
                        .font(Fonts.title)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color(.black), for: .navigationBar)
        .padding(.horizontal, 10)
        .background(.black)
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
