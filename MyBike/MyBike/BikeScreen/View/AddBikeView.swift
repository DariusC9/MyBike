//
//  AddBikeView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI
import CoreData

struct AddBikeView: View {
    @Environment(\.managedObjectContext) private var context: NSManagedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var bikeNameText: String = ""
    @State var wheelSizeText: String = ""
    @State var serviceInText: String = ""
    @State var defaultBike: Bool = false

    
    @State var bikeNameBorder: Color = .white
    @State var wheelSizeBorder: Color = .white
    @State var serviceBorder: Color = .white
    
    @State var bikeType: BikeType = .roadBike
    @State var bikeColor: String = "bikeCornFlowerBlue"
    
    var body: some View {
        
        ZStack{
            Color("appMirage")

            VStack{
                CarouselView(color: $bikeColor, bikeType: $bikeType)
                VStack(spacing: 20) {
                    AddCell(subTitle: "Bike Name", textFieldBind: $bikeNameText, borderColor: $bikeNameBorder, placeholder: "Add bike name")
                    AddCell(subTitle: "Wheel Size", textFieldBind: $wheelSizeText, borderColor: $wheelSizeBorder, placeholder: "Add wheels size")
                    AddCell(subTitle: "Service in", textFieldBind: $serviceInText, borderColor: $serviceBorder, placeholder: "Add service for bike")
                    Toggle("Default Bike", isOn: $defaultBike)
                        .foregroundColor(.white)
                        .font(Fonts.labelTextRide)
                        .tint(Color("appBlueRibbon"))
                    Button(action: {
                        saveBike()
                    }) {
                        Text("Add Bike")
                            .foregroundColor(.white)
                            .font(Fonts.buttonText)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color("appBlueRibbon"))
                            .cornerRadius(5)
                        
                        
                    }
                }
                .padding(.horizontal, 10)
            }
        }
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
                    Text("Add Bike")
                        .foregroundColor(.white)
                        .font(Fonts.title)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("appMirage"), for: .navigationBar)
    }
    
    // MARK: - Private
    
    private func saveBike() {
        var wheelSize: Int64?
        var service: Int64?
        var shouldNotSave = false
        if bikeNameText.isEmpty {
            bikeNameBorder = .red
            shouldNotSave = true
        }
        wheelSize = Int64(wheelSizeText)
        if wheelSizeText.isEmpty || wheelSize == nil {
            wheelSizeBorder = .red
            shouldNotSave = true
        }
        service = Int64(serviceInText)
        if serviceInText.isEmpty || service == nil {
            serviceBorder = .red
            shouldNotSave = true
        }
        if shouldNotSave {
            return
        }
        if defaultBike {
            PersistenceController.shared.setDefaultBikeToFalse()
        }
        
        let newBike = Bike(context: context)
        newBike.id = UUID()
        newBike.name = bikeNameText
        newBike.defaultBike = defaultBike
        newBike.distance = service ?? 0
        newBike.wheelSize = wheelSize ?? 0
        newBike.type = bikeType.rawValue
        newBike.color = bikeColor

        PersistenceController.shared.saveContext()
        presentationMode.wrappedValue.dismiss()
    }
}
    
struct AddBikeView_Previews: PreviewProvider {
    static var previews: some View {
        AddBikeView(bikeNameText: "Placeholder", wheelSizeText: "Placeholder", serviceInText: "Placeholder", defaultBike: true)
    }
}

