//
//  RideCell.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct RideCell: View {
    @State var model: RideModel
    @State var bikeName: String = ""
    @State var goToEditRideView = false
    @State var showingAlert = false
    @State var rideID: UUID = UUID()
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 0) {
                Image("icon_bikes_inactive")
                    .scaleEffect(0.5)
                    .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                Text("\(model.title)")
                    .foregroundColor(.white)
                    .font(Fonts.rideTitle)
                Spacer()
                Menu {
                    Button {
                        goToEditRideView.toggle()
                    } label: {
                            Image("icon_edit")
                            Text("Edit")
                    }
                    Button {
                        showingAlert.toggle()
                        rideID = model.ID

                    } label: {
                            Text("Delete")
                            Image("icon_delete")
                    }
                } label: {
                    Image("icon_overflow")
                }
            }
            .alert("\(Transformer.shared.fetchRideName(rideID)) will be deleted", isPresented: $showingAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    guard let ride = Transformer.shared.fetchRide(from: rideID) else { return}
                    PersistenceController.shared.deleteRide(ride)
                }
        }
            .padding(.leading, -5)
            HStack(spacing: 0) {
                Text("Bike: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.bikeName)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Distance: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.distance)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Duration: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.duration)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("Date: ")
                    .foregroundColor(.white)
                    .font(Fonts.labelTextRide)
                Text("\(model.Date)")
                    .foregroundColor(.white)
                    .font(Fonts.detailsText)
                Spacer()
            }
            NavigationLink(destination: EditRideView(selectedRide: model), isActive: $goToEditRideView) {
                EmptyView()
                        }
            .hidden()
        }
        .padding()
        .background(Color("appCloudBurst"))
    }
}

struct RideCell_Previews: PreviewProvider {
    static var previews: some View {
        RideCell(model: RideModel.testRide())
    }
}
