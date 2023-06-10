//
//  SettingsView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var text: String = ""
    @State private var textFieldService = ""
    @State private var isToggleOn = false
    @State var borderColor = Color.white
    @State var selectedOption: Pair = .empty()

    
    var body: some View {
        VStack(spacing: 20) {
            DropDownMenuDistanceUnits()
            VStack (alignment: .leading, spacing: 5){
                
                Text("Service Reminder")
                    .foregroundColor(.white)
                    .font(Fonts.labelText)

                HStack {

                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $textFieldService)
                        .textFieldStyle(.plain)
                        .padding(10)
                        .foregroundColor(.white)
                        .font(Fonts.textField)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                                .background(Color("appCloudBurst"))
                        )
                    

                    
                    Toggle("", isOn: $isToggleOn)
                        .labelsHidden()
                        .tint(Color("appBlueRibbon"))
                }
            }
            .padding(.horizontal, 10)
            DropDownMenuDefaultBike()
            Spacer()
            
        }

        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("appMirage"))

}
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
