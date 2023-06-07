//
//  BikeDetailsView.swift
//  MyBike
//
//  Created by Darius Couti on 06.06.2023.
//

import SwiftUI

struct BikeDetailsView: View {
    var model: BikeModel
    var allRides: [RideModel]
    
    var body: some View {
        VStack {
            BikeCell(model: model)
            Text("Rides")
                .padding(.horizontal, 10)
            VStack {
                List(allRides, id: \.self) { item in
                    RideCell(model: item)
                        .listRowBackground(Color.black)
//                        .listRowInsets(.init(top: 5,
//                                             leading: 0,
//                                             bottom: 5,
//                                             trailing: 0))
                }
                .frame(maxWidth: .infinity)
                .scrollContentBackground(.hidden)
    
            }
        }
        .padding(.horizontal, 10)
    }
}

struct BikeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BikeDetailsView(model: .testBike(), allRides: [.testRide()])
    }
}
