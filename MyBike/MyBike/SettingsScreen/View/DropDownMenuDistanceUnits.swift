//
//  DropDownMenuDistanceUnits.swift
//  MyBike
//
//  Created by Darius Couti on 10.06.2023.
//

import SwiftUI

struct DropDownMenuDistanceUnits: View {
    @State private var menuLabelText = "...."
    private let kmText = "Km"
    private let milesText = "Miles"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text("Distance Units")
                    .foregroundColor(.white)
                    .font(Fonts.labelText)
                Image("icon_required")
                Spacer()
            }
            .padding(.horizontal, 10)
            Menu {
                VStack {
                    Button(action: {
                        menuLabelText = kmText
                    }, label: {
                        Text(kmText)
                    })
                    Button(action: {
                        menuLabelText = milesText
                    }, label: {
                        Text(milesText)
                    })
                }
            } label: {
                HStack {
                    Text("Button")
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
        
    }
}

struct DropDownMenuDistanceUnits_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenuDistanceUnits()
    }
}
