//
//  RideCell.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct RideCell: View {
    let model: RideModel
    @State var bikeName: String = ""
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 0) {
                Image("icon_bikes_inactive")
                    .scaleEffect(0.5)
                    .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                Text("\(model.bikeName)")
                    .foregroundColor(.white)
                    .font(Fonts.rideTitle)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("...")
                    .foregroundColor(.white)
                    .font(Fonts.rideTitle)
                }
            }
            .padding(.leading, -5)
            HStack(spacing: 0) {
                Text("Bike: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.bikeName)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Distance: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.distance)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Duration: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.duration)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Date: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.Date)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
        }
        .padding()
        .background(Color("appCloudBurst"))
    }
}

struct RideCell_Previews: PreviewProvider {
    static var previews: some View {
        RideCell(model: RideModel.testRide())
    }
}
