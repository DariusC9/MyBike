//
//  BikeCell.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import SwiftUI

struct BikeCell: View {
    let model: BikeModel = .empty()
    
    var body: some View {
        
        ZStack{
            Image("no_bike_background")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                ZStack {
                    Image(model.bikeImages.topImageName)
                                .scaleEffect(1.75)
                    Image(model.bikeImages.middleImageName)
                                .scaleEffect(1.75)
                    Image(model.bikeImages.wheelImageName)
                                .scaleEffect(1.75)
                }
                .padding(.top, 30)
                
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
                        .frame(width: 350, height: 4)
                    Image("loading_over")
                        .resizable()
                        .frame(width: 230, height: 4)
                    Image("loading_circle")
                        
                    Image("loading_bolt")
                        .offset(x: 350)
                    Image("loading_wrench")
                        .offset(x: 230)
                }
                .padding(.top, 20)
            }
            .alignmentGuide(.top) { _ in
                UIScreen.main.bounds.size.height / 2
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
           )
        }
        
    }
    
    struct BikeCell_Previews: PreviewProvider {
        static var previews: some View {
            BikeCell()
        }
    }
    
}
