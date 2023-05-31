//
//  BikeCell.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import SwiftUI

struct BikeCell: View {
    let viewModel: BikeViewModel = .empty()
    
    var body: some View {
        
        ZStack{
            Image("no_bike_background")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                ZStack {
                    Image(viewModel.bikeImages.topImageName)
                                .scaleEffect(1.75)
                    Image(viewModel.bikeImages.middleImageName)
                                .scaleEffect(1.75)
                    Image(viewModel.bikeImages.wheelImageName)
                                .scaleEffect(1.75)

                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: \(viewModel.name)")
                            .font(Fonts.rideTitle)
                        Text("Wheels: \(viewModel.wheelSize)\"")
                            .font(Fonts.labelTextRide)
                        Text("Service in: \(viewModel.distance)km")
                            .font(Fonts.labelTextRide)
                    }
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    Spacer()
                }
                .padding()
                
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
