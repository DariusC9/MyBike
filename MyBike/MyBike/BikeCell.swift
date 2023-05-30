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
            VStack {
                ZStack {
                    Image(viewModel.bikeImages.topImageName)
                                .scaleEffect(1.75)
                    Image(viewModel.bikeImages.middleImageName)
                                .scaleEffect(1.75)
                    Image(viewModel.bikeImages.wheelImageName)
                                .scaleEffect(1.75)

                }
                .offset(y: 15)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: \(viewModel.name)")
                        Text("Wheels: \(viewModel.wheelSize)\"")
                        Text("Service in: \(viewModel.distance)km")
                    }
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    Spacer()
                }
                .padding()
            }
            .padding(10)
        }
        
    }
    
    struct BikeCell_Previews: PreviewProvider {
        static var previews: some View {
            BikeCell()
        }
    }
    
}
