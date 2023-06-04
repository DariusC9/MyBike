//
//  AddBikeView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct AddBikeView: View {
    
    @State var bikeNameText: String = ""
    @State var wheelSizeText: String = ""
    @State var serviceInText: String = ""
    @State var defaultBike: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        ZStack{
            Color
                .black
//                .ignoresSafeArea(bottom)
            VStack{
                HStack{
    //                Image()
    //                VStack{
                        
    //                }
                }
                
                VStack(spacing: 20) {
                    AddBikeCell(subTitle: "Bike Name*", textFieldBind: $bikeNameText)
                    AddBikeCell(subTitle: "Wheel Size*", textFieldBind: $wheelSizeText)
                    AddBikeCell(subTitle: "Service in*", textFieldBind: $serviceInText)
                    Toggle("Default Bike", isOn: $defaultBike)
                        .tint(Color("appBlueRibbon"))
                    Button(action: {
                        // TODO: Add action
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
        .navigationBarTitle("Add Bike", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
                .foregroundColor(.blue)
        }
        )
    }
}
    
    struct AddBikeView_Previews: PreviewProvider {
        static var previews: some View {
            AddBikeView(bikeNameText: "Placeholder", wheelSizeText: "Placeholder", serviceInText: "Placeholder", defaultBike: true)
        }
    }

