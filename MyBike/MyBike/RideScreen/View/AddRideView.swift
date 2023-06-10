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
    
    @State var textFieldTitle: String = ""
    @State var textFieldDistance: String = ""
    @State var textFieldDuration: String = ""
    @State var textFieldDate: String = ""
    @Environment(\.presentationMode) var presentationMode
    
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
            AddBikeCell(subTitle: "Ride Title", textFieldBind: $textFieldTitle, borderColor: $titleBorder, placeholder: "Add Ride Title")
            DropdownView(selectedOption: $selectedBike, subTitle: "Bike", borderColor: $bikeNameBorder, options: bikesName)
                .padding(.horizontal, -10)
            AddBikeCell(subTitle: "Distance", textFieldBind: $textFieldDistance, borderColor: $distanceBorder, placeholder: "Add Ride Distance")
            AddBikeCell(subTitle: "Duration", textFieldBind: $textFieldDuration, borderColor: $durationBorder, placeholder: "Add Ride Duration")
            AddBikeCell(subTitle: "Date", textFieldBind: $textFieldDate, borderColor: $dateBorder, placeholder: "Add Ride Date")
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
                    Text("Add Ride")
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
        if selectedBike.name == nil {
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
            let bike = Transformer.shared.fetchBike(from: id)
            bike?.ridesRelationship?.adding(newRide)
            newRide.bikeRelationship = Transformer.shared.fetchBike(from: id)
        PersistenceController.shared.saveContext()
        presentationMode.wrappedValue.dismiss()
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

    struct AddRideView_Previews: PreviewProvider {
        static var previews: some View {
            AddRideView()
        }
    }



struct AddBikeCell: View {
    
    var subTitle: String
    @Binding var textFieldBind: String
    @Binding var borderColor: Color
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(subTitle)*")
                .foregroundColor(.white)
                .font(Fonts.labelText)
            ZStack(alignment: .leading) {
                    if textFieldBind.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.white)
                            .font(Fonts.textField)
                            .opacity(0.7)
                            .padding(.leading, 10)
                    }
                    TextField("", text: $textFieldBind, onEditingChanged: { isEditing in
                        if isEditing {
                            borderColor = .white
                        }
                    })
                    .foregroundColor(.white)
                    .font(Fonts.textField)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                }
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(borderColor, lineWidth: 1)
                        .background(Color("appCloudBurst"))
                )
        }
    }
}
