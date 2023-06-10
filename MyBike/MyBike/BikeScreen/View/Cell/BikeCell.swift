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
        
        ZStack{
            Image("no_bike_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack {
                ZStack {
                    Image(model.bikeImages.wheelImageName)
                        .scaleEffect(1.75)
                    Image(model.bikeImages.middleImageName)
                        .scaleEffect(1.75)
                        .colorMultiply(Color(model.color))
                    Image(model.bikeImages.topImageName)
                        .scaleEffect(1.75)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: \(model.name)")
                            .font(Fonts.rideTitle)
                        Text("Wheels: \(model.wheelSize)\"")
                            .font(Fonts.labelTextRide)
                        Text("Service in: \(model.distance)km")
                            .font(Fonts.labelTextRide)
                    }
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    Spacer()
                }
                .padding(.leading, 20)
                
                ZStack(alignment: .leading) {
                    Image("loading_bar")
                        .resizable()
                        .frame(width: 300, height: 4)
                    Image("loading_over")
                        .resizable()
                        .frame(width: 230, height: 4)
                    Image("loading_circle")
                    
                    Image("loading_bolt")
                        .offset(x: 300)
                    Image("loading_wrench")
                        .offset(x: 230)
                }
                .padding(.top, 10)
            }
        }
        
    }
}
    struct BikeCell_Previews: PreviewProvider {
        static var previews: some View {
            BikeCell(model: .testBike())
        }
    }
    

