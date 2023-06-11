//
//  EditBikeView.swift
//  MyBike
//
//  Created by Darius Couti on 07.06.2023.
//

import SwiftUI
import CoreData

struct EditBikeView: View {
    @Environment(\.managedObjectContext) private var context: NSManagedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var bikeNameText: String = ""
    @State var wheelSizeText: String = ""
    @State var serviceInText: String = ""
    @State var defaultBike: Bool
    
    @State var bikeNameBorder: Color = .white
    @State var wheelSizeBorder: Color = .white
    @State var serviceBorder: Color = .white
    
    @State var bikeType: BikeType = .roadBike
    @State var selectedBike: BikeModel
    
    var closure: ((Bool) -> Void)?
    
    var body: some View {
        
        ZStack{
            Color("appMirage")

            VStack{
                CarouselView(color: $selectedBike.color, bikeType: $bikeType)
                VStack(spacing: 20) {
                    AddCell(subTitle: "Bike Name", textFieldBind: $bikeNameText, borderColor: $bikeNameBorder, placeholder: selectedBike.name)
                    AddCell(subTitle: "Wheel Size", textFieldBind: $wheelSizeText, borderColor: $wheelSizeBorder, placeholder: String(selectedBike.wheelSize))
                    AddCell(subTitle: "Service in", textFieldBind: $serviceInText, borderColor: $serviceBorder, placeholder: String(selectedBike.distance))
                    Toggle("Default Bike", isOn: $defaultBike)
                        .foregroundColor(.white)
                        .tint(Color("appBlueRibbon"))
                    Button(action: {
                        editBike()
                    }) {
                        Text("Save")
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
                    Text("Edit Bike")
                        .foregroundColor(.white)
                        .font(Fonts.title)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("appMirage"), for: .navigationBar)
    }
    
    // MARK: - Private
    
    private func editBike() {
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
            closure?(false)
            return
        }
        if defaultBike {
            PersistenceController.shared.setDefaultBikeToFalse()
        }
        let savedId = selectedBike.ID
        guard let bike = Helper.shared.getBike(from: savedId) else { return }
        bike.name = bikeNameText
        bike.defaultBike = defaultBike
        bike.distance = service ?? 0
        bike.wheelSize = wheelSize ?? 0
        bike.type = bikeType.rawValue
        bike.color = selectedBike.color

        PersistenceController.shared.saveContext()
        closure?(true)
        presentationMode.wrappedValue.dismiss()
    }
    private func deleteBike() {
        let bikes = PersistenceController.shared.fetchBikes()
        
        for bike in bikes {
            if bike.id == selectedBike.ID {
                context.delete(bike)
                PersistenceController.shared.saveContext()
            }
        }
    }
}

struct EditBikeView_Previews: PreviewProvider {
    static var previews: some View {
        EditBikeView(defaultBike: false, selectedBike: .testBike())
    }
}
