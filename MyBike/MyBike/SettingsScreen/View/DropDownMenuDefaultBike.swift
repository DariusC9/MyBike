//
//  DropDownMenuDefaultBike.swift
//  MyBike
//
//  Created by Darius Couti on 09.06.2023.
//

import SwiftUI

struct DropDownMenuDefaultBike: View {
    @State var options: [Bike] = PersistenceController.shared.fetchBikes()
    @State var defaultBike = PersistenceController.shared.fetchDefaulBike()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text("Default Bike")
                    .foregroundColor(.white)
                    .font(Fonts.labelText)
                Image("icon_required")
                Spacer()
            }
            .padding(.horizontal, 10)
            Menu {
                VStack {
                    ForEach(options, id: \.id) { option in
                        Button(action: {
                            PersistenceController.shared.setDefaultBikeToFalse()
                            if let selectedBikeID = option.id {
                                defaultBike = Helper.shared.getBike(from: selectedBikeID)
                            }
                            defaultBike?.defaultBike = true
                            PersistenceController.shared.saveContext()
                        }, label: {
                            if let bikeName = option.name {
                                Text(bikeName)
                            }
                        })
                    }
                }
            } label: {
                HStack {
                    Text(showBikeName())
                        .foregroundColor(.white)
                        .font(Fonts.textField)
                        .padding()
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(.white)
                        .padding(.trailing)
                    
                }
                .background(Color("appCloudBurst"))
                .cornerRadius(8)
            }
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 1)
                    .background(Color("appCloudBurst"))
            )
            .padding(.horizontal, 10)
            
        }
        .onAppear(perform: {
            options = PersistenceController.shared.fetchBikes()
            defaultBike = PersistenceController.shared.fetchDefaulBike()
        })
    }
    
    private func showBikeName() -> String {
    
        if defaultBike == nil {
            return "Select a default bike"
        } else {
            return defaultBike?.name ?? ""
        }
    }
    
}

//struct DropDownMenuDefaultBike_Previews: PreviewProvider {
//    static var previews: some View {
//        DropDownMenuDefaultBike(options: PersistenceController.shared.fetchBikes())
//    }
//}
