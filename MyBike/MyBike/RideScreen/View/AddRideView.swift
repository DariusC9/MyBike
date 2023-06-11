//
//  AddRideView.swift
//  MyBike
//
//  Created by Darius Couti on 31.05.2023.
//

import SwiftUI
import CoreData

struct AddRideView: View {
    @Environment(\.managedObjectContext) private var context: NSManagedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var textFieldTitle: String = ""
    @State var textFieldDistance: String = ""
    @State var textFieldDuration: String = ""
    @State var textFieldDate: String = ""
    
    @State var titleBorder: Color = .white
    @State var bikeNameBorder: Color = .white
    @State var distanceBorder: Color = .white
    @State var durationBorder: Color = .white
    @State var dateBorder: Color = .white
    
    @State var bikesName: [Pair] = []
    @State var selectedBike: Pair = .empty()
    @State var showAlert = false

    
    var body: some View {

        VStack(spacing: 20) {
            AddCell(subTitle: "Ride Title", textFieldBind: $textFieldTitle, borderColor: $titleBorder, placeholder: "Add Ride Title")
            DropdownView(selectedOption: $selectedBike, subTitle: "Bike", borderColor: $bikeNameBorder, options: bikesName)
                .padding(.horizontal, -10)
            AddCell(subTitle: "Distance", textFieldBind: $textFieldDistance, borderColor: $distanceBorder, placeholder: "Add Ride Distance")
            AddCell(subTitle: "Duration", textFieldBind: $textFieldDuration, borderColor: $durationBorder, placeholder: "Add Ride Duration")
            AddCell(subTitle: "Date", textFieldBind: $textFieldDate, borderColor: $dateBorder, placeholder: "Add Ride Date")
            Button(action: {
                saveRide()
            }) {
                Text("Add Ride")
                    .foregroundColor(.white)
                    .font(Fonts.buttonText)
                    .frame(maxWidth: .infinity, minHeight: 35)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Can't save ride"), message: Text("You can't save a ride if you don't select a bike or you did not saved a bike first"), dismissButton: .cancel(Text("Ok")))
            }
            .padding(.top, 20)
            Spacer()
            
        }
        .onAppear(perform: getBikeNames)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("appMirage"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
                .foregroundColor(.blue)
                .font(Font.system(size: 14))
        }
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Add Ride")
                        .foregroundColor(.white)
                        .font(Fonts.title)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("appMirage"), for: .navigationBar)
    }
    
    private func getBikeNames() {
        let bikes = PersistenceController.shared.fetchBikes()
        bikesName = bikes.compactMap { Pair(id: $0.id,
                                            name: $0.name) }
    }
    
    private func saveRide() {
        var distance: Int?
        var date: String?
        var duration: String = ""
        var shouldNotSave = false
        
        distance = Int(textFieldDistance)
        if textFieldDistance.isEmpty || distance == nil {
            distanceBorder = .red
            shouldNotSave = true
        }
        duration = textFieldDuration.description
        if duration.isEmpty {
            durationBorder = .red
            shouldNotSave = true
        }
        date = textFieldDate
        if let userDate = date {
            if textFieldDate.isEmpty || checkDate(userDate) {
                dateBorder = .red
                shouldNotSave = true
            }
        }
        if selectedBike.name == nil,
           selectedBike.id == nil {
            showAlert = true
            shouldNotSave = true
        }
        if shouldNotSave {
            return
        }
        
        let newRide = Ride(context: context)
        newRide.id = UUID()
        newRide.bikeId = selectedBike.id
        newRide.title = textFieldTitle
        if let userDistance = distance {
            newRide.distance = Int64(userDistance)
        }
        newRide.duration = textFieldDuration
        newRide.date = textFieldDate
        if let id = selectedBike.id {
            newRide.bikeRelationship = Helper.shared.getBike(from: id)
        }
        PersistenceController.shared.saveContext()
        presentationMode.wrappedValue.dismiss()
    }
    
    private func checkDate(_ date: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        
        if let _ = dateFormatter.date(from: date) {
            return false
        } else {
            return true
        }
    }
}

struct AddRideView_Previews: PreviewProvider {
    static var previews: some View {
        AddRideView()
    }
}
