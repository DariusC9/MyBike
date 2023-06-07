//
//  BikeView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct BikeView: View {
    
    @State private var goToAddBikeView = false
    var rides = PersistenceController.shared.fetchRides()
    var bikes = PersistenceController.shared.fetchBikes()
    
    var bikeList: [BikeModel]
    
    var body: some View {
        
            VStack {
                List(bikeList, id: \.self) { item in
                    NavigationLink(destination: BikeDetailsView(model: item, allRides: Transformer.shared.convertToRideModel(from: rides))) {
                        BikeCell(model: item)
                        .padding(.top, 15)
                        .background(.black)
                        
                    }
                }
                .scrollContentBackground(.hidden)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: NavigationLink(destination: AddBikeView(), isActive: $goToAddBikeView) {
                },
                trailing: Button(action: {
                    goToAddBikeView.toggle()
                }) {
                    HStack {
                        Image("icon_add")
                        Text("Add Bike")
                            .foregroundColor(.blue)
                            .font(Fonts.navBar)
                    }
                }
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Bikes")
                            .bold()
                            .foregroundColor(.white)
                            .font(Fonts.title)
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(.black), for: .navigationBar)
            .padding(.horizontal, 10)
            .background(.black)
    }
    
    struct BikeView_Previews: PreviewProvider {
        static var previews: some View {
            BikeView(bikeList: [BikeModel.testBike()])
        }
    }
}
