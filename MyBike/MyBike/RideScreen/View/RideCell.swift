//
//  RideCell.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct RideCell: View {
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 0) {
                Image("icon_bikes_inactive")
                    .scaleEffect(0.5)
                    .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                Text("Friday 29 Ride")
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
                Text("NukeProuf Scout 290")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Distance: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("60km")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Duration: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("2h, 14min")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Date: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("29.03.2023")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
        }
        .padding()
        .background(Color("appMirage"))
        .padding()
        
        
    }
}

struct RideCell_Previews: PreviewProvider {
    static var previews: some View {
        RideCell()
    }
}
