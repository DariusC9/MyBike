//
//  EditRideView.swift
//  MyBike
//
//  Created by Darius Couti on 08.06.2023.
//

import SwiftUI
import CoreData

struct EditRideView: View {
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
    
    var selectedRide: RideModel

    
    var body: some View {

        VStack(spacing: 20) {
            AddBikeCell(subTitle: "Ride Title", textFieldBind: $textFieldTitle, borderColor: $titleBorder)
            DropdownView(selectedOption: $selectedBike, subTitle: "Bike", borderColor: $bikeNameBorder, options: bikesName)
                .padding(.horizontal, -10)
            AddBikeCell(subTitle: "Distance", textFieldBind: $textFieldDistance, borderColor: $distanceBorder)
            AddBikeCell(subTitle: "Duration", textFieldBind: $textFieldDuration, borderColor: $durationBorder)
            AddBikeCell(subTitle: "Date", textFieldBind: $textFieldDate, borderColor: $dateBorder)
            Button(action: {
                editRide()
            }) {
                Text("Add Ride")
                    .foregroundColor(.white)
                    .font(Fonts.buttonText)
                    .frame(maxWidth: .infinity, minHeight: 35)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            .padding(.top, 20)
            Spacer()
            
        }
        .onAppear(perform: fetchBikeNames)
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
                    Text("Edit Ride")
                        .foregroundColor(.white)
                        .font(Fonts.title)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("appMirage"), for: .navigationBar)
    }
    
    private func fetchBikeNames() {
        let fetchRequest = NSFetchRequest<Bike>(entityName: "Bike")
        
        do {
            let results = try context.fetch(fetchRequest)
            bikesName = results.compactMap { Pair(id: $0.id,
                                                  name: $0.name) }
        } catch {
            print("Error fetching Bike names: \(error.localizedDescription)")
        }
    }
    
    private func editRide() {
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
        if selectedBike.name == nil {
            shouldNotSave = true
        }
        if shouldNotSave {
            return
        }
        let savedId = selectedRide.ID
        deleteRide()
        
        let newRide = Ride(context: context)
        newRide.id = savedId
        newRide.bikeId = selectedBike.id
        newRide.title = textFieldTitle
        if let userDistance = distance {
            newRide.distance = Int64(userDistance)
        }
        newRide.duration = textFieldDuration
        newRide.date = textFieldDate
        
        PersistenceController.shared.saveContext()
        presentationMode.wrappedValue.dismiss()
    }
    
    private func deleteRide() {
        var rides = PersistenceController.shared.fetchRides()
        
        for ride in rides {
            if ride.id == selectedRide.ID {
                context.delete(ride)
                PersistenceController.shared.saveContext()
            }
        }
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


struct EditRideView_Previews: PreviewProvider {
    static var previews: some View {
        EditRideView(selectedRide: RideModel.testRide())
    }
}
