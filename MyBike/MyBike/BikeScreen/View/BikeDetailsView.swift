//
//  BikeDetailsView.swift
//  MyBike
//
//  Created by Darius Couti on 06.06.2023.
//

import SwiftUI

struct BikeDetailsView: View {
    @State var model: BikeModel
    @State var allRides: [RideModel]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image("no_bike_detailsBackground")
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
                    .padding(.top, 70)
                    HStack {
                        VStack(alignment: .leading) {
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
                    .padding(.top, 20)
                }
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Rides: \(allRides.count)")
                        .font(Fonts.labelTextRide)
                    Text("Total Rides Distance: \(Helper.shared.getTotalDistance(for: model.ID))km")
                        .font(Fonts.labelTextRide)
                }
                .foregroundColor(.white)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, 20)
            .background(Color("appMirage"))
            VStack(alignment: .leading) {
                List(allRides, id: \.self) { item in
                    RideCell(model: item)
                        .listRowBackground(Color("appMirage"))
                        .listRowInsets(.init(top: 5,
                                             leading: 0,
                                             bottom: 5,
                                            trailing: 0))
                        
                }
                .scrollContentBackground(.hidden)
                .padding(.horizontal, -20)
                
            }
            .background(Color("appMirage"))
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("\(model.name)")
                        .bold()
                        .foregroundColor(.white)
                        .font(Fonts.title)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color(.black), for: .navigationBar)
    }
}

struct BikeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BikeDetailsView(model: .testBike(), allRides: [.testRide()]).frame(height: 350)
    }
}
