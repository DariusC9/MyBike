//
//  RideView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct RideView: View {
    var rideList = [
        RideModel.testRide(),
        RideModel.testRide(),
        RideModel.testRide(),
        RideModel.testRide(),
    ]
    var body: some View {
        
        VStack(alignment: .leading) {
            List(rideList, id: \.self) { list in
                RideCell(model: list)
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


struct RideView_Previews: PreviewProvider {
    static var previews: some View {
        RideView()
    }
}
