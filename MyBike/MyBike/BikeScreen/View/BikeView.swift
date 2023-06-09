//
//  BikeView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct BikeView: View {
    
    @State private var goToAddBikeView = false
    @State private var goToEditBikeView = false
    @State private var showingAlert = false
    @State private var selectedBike: BikeModel? = nil
    @State private var bikeID: UUID = UUID()

    @State var rides = PersistenceController.shared.fetchRides()
    @State var bikes = PersistenceController.shared.fetchBikes()
    
    var bikeList: [BikeModel]
    
    var body: some View {
        
        VStack {
            List(bikeList, id: \.self) { item in
                NavigationLink(destination: BikeDetailsView(model: item, allRides: Transformer.shared.convertToRideModel(from: rides))) {
                    ZStack(alignment: .topTrailing) {
                        BikeCell(model: item)
                            .padding(.top, 15)
                        Menu {
                            Button {
                                selectedBike = item
                                goToEditBikeView.toggle()
                            } label: {
                                    Image("icon_edit")
                                    Text("Edit")
                            }
                            Button {
                                showingAlert.toggle()
                                bikeID = item.ID

                            } label: {
                                    Text("Delete")
                                    Image("icon_delete")
                            }

                        } label: {
                            Image("icon_overflow")
                        }
                        .padding()
                        .alert("\(Transformer.shared.fetchBikeName(bikeID)) will be deleted", isPresented: $showingAlert) {
                            Button("Cancel", role: .cancel) { }
                            Button("Delete", role: .destructive) {
                                guard let bike = Transformer.shared.fetchBike(from: bikeID) else { return}
                                PersistenceController.shared.deleteBike(bike)
                            }
                    }
                        NavigationLink(destination: EditBikeView(defaultBike: Transformer.shared.defaultBikeBool(from: selectedBike ?? item, bikes), selectedBike: selectedBike ?? item), isActive: $goToEditBikeView) {
                            EmptyView()
                                    }
                        .hidden()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .buttonStyle(PlainButtonStyle())
                }
                .listRowInsets(EdgeInsets())
            }
            .scrollContentBackground(.hidden)
        }
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

