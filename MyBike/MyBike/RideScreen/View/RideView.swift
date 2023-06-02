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
        
        VStack(spacing: 0) {
            List(rideList, id: \.self) { list in
                RideCell(model: list)
                    .background(.black)
            }
            .scrollContentBackground(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
    }


struct RideView_Previews: PreviewProvider {
    static var previews: some View {
        RideView()
    }
}
