//
//  RideView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI
import CoreData

struct RideView: View {
    @Environment(\.managedObjectContext) private var context: NSManagedObjectContext
    @FetchRequest(entity: Ride.entity(), sortDescriptors: []) private var rides: FetchedResults<Ride>

    @State private var goToAddRideView = false
    private var allStatistics: [StatisticsData] {
        return Helper.shared.transformDataIntoStatistics(PersistenceController.shared.fetchBikes())
    }
    
    var body: some View {
        VStack(spacing: 0) {
            StatisticsView(allStatistics: allStatistics)
            VStack(alignment: .leading) {
                List(Helper.shared.convertToRideModel(rides.reversed()), id: \.self) { item in
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
        RideView()
    }
}
