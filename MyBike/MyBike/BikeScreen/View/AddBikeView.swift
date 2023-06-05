//
//  AddBikeView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI
import CoreData

struct AddBikeView: View {

    @State var bikeNameText: String = ""
    @State var wheelSizeText: String = ""
    @State var serviceInText: String = ""
    @State var defaultBike: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        
        ZStack{
            Color("appMirage")

            VStack{
                CarouselView()
                VStack(spacing: 20) {
                    AddBikeCell(subTitle: "Bike Name*", textFieldBind: $bikeNameText)
                    AddBikeCell(subTitle: "Wheel Size*", textFieldBind: $wheelSizeText)
                    AddBikeCell(subTitle: "Service in*", textFieldBind: $serviceInText)
                    Toggle("Default Bike", isOn: $defaultBike)
                        .tint(Color("appBlueRibbon"))
                    Button(action: {
                        // TODO: Add action
//                        let newBike = Bike(context: PersistenceController.shared.mainContext)
//                        newBike.id = UUID()
//                        newBike.name = bikeNameText
//                        
//                        PersistenceController.shared.saveContext()
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
        .edgesIgnoringSafeArea(.bottom)
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
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("appMirage"), for: .navigationBar)
    }
}
    
    struct AddBikeView_Previews: PreviewProvider {
        static var previews: some View {
            AddBikeView(bikeNameText: "Placeholder", wheelSizeText: "Placeholder", serviceInText: "Placeholder", defaultBike: true)
        }
    }

