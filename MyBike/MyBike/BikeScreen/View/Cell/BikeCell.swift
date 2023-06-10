//
//  BikeCell.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import SwiftUI

struct BikeCell: View {
    let model: BikeModel
    
    var body: some View {
        ZStack {
            Image("no_bike_background")
                .aspectRatio(contentMode: .fill)
            VStack {
                createBikeImage()
                createDetails()
                createWrench()
            }.padding(.top, 50)
        }
    }
    
    @ViewBuilder
    private func createBikeImage() -> some View {
        ZStack {
            Image(model.bikeImages.wheelImageName)
                .scaleEffect(1.75)
            Image(model.bikeImages.middleImageName)
                .scaleEffect(1.75)
                .colorMultiply(Color(model.color))
            Image(model.bikeImages.topImageName)
                .scaleEffect(1.75)
        }
    }
    
    @ViewBuilder
    private func createDetails() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: \(model.name)")
                    .font(Fonts.rideTitle)
                Text("Wheels: \(model.wheelSize)\"")
                    .font(Fonts.labelTextRide)
                Text("Service in: \(Helper.shared.getDistanceWithUnit(model.distance))")
                    .font(Fonts.labelTextRide)
            }
            .foregroundColor(.white)
            .padding(.top, 20)
            Spacer()
        }
        .padding(.leading, 20)
    }
    
    @ViewBuilder
    private func createWrench() -> some View {
        ZStack(alignment: .leading) {
            Image("loading_bar")
                .resizable()
                .frame(width: 320, height: 4)
            Image("loading_over")
                .resizable()
                .frame(width: 320 * Helper.shared.getPercentUntilService(for: model.ID), height: 4)
            Image("loading_circle")
            
            Image("loading_bolt")
                .offset(x: 320)
            Image("loading_wrench")
                .offset(x: 320 * Helper.shared.getPercentUntilService(for: model.ID))
        }
        .padding(.top, 10)
    }
}
    struct BikeCell_Previews: PreviewProvider {
        static var previews: some View {
            BikeCell(model: .testBike())
        }
    }
    

