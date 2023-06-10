//
//  BikesView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct BikesView: View {
    
    @State private var goToAddBikeView = false
    @State private var goToEditBikeView = false
    @State private var showingAlert = false
    @State private var selectedBike: BikeModel? = nil
    @State private var bikeID: UUID = UUID()
    
    private var rides: [Ride] {
        return PersistenceController.shared.fetchRides()
    }
    private var bikes: [Bike] {
        return PersistenceController.shared.fetchBikes()
    }
    
    var body: some View {
        VStack {
            List(Helper.shared.convertToBikeModel(bikes), id: \.self) { item in
                ZStack {
                    BikeCell(model: item)
                    NavigationLink(destination: BikeDetailsView(model: item, allRides: Helper.shared.convertToRideModel(from: rides, using: item.ID))) {
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
                    VStack {
                        HStack {
                            Spacer()
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
                            .alert("\(Helper.shared.getBike(from: bikeID)?.name ?? "") will be deleted", isPresented: $showingAlert) {
                                Button("Cancel", role: .cancel) { }
                                Button("Delete", role: .destructive) {
                                    guard let bike = Helper.shared.getBike(from: bikeID) else { return }
                                    PersistenceController.shared.deleteBike(bike)
                                }
                            }
                        }
                        Spacer()
                    }
                    NavigationLink(destination: EditBikeView(defaultBike: Helper.shared.isDefaultBike(selectedBike ?? item), selectedBike: selectedBike ?? item), isActive: $goToEditBikeView) {
                        EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets())
                .padding(.top, 10)
                .background(.black)
            }
        }
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
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
}
    struct BikesView_Previews: PreviewProvider {
        static var previews: some View {
            BikesView()
        }
    }


