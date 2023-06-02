//
//  SettingsView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct DropdownView: View {
    @State private var isMenuVisible = false
    private let options = ["Option 1", "Option 2", "Option 3"]
     var subTitle: String
    @State private var selectedOption = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("\(subTitle)*")
                .foregroundColor(.white)
                .font(Fonts.labelText)
            ZStack(alignment: .trailing) {
                Button(action: {
                    isMenuVisible.toggle()
                }) {
                    HStack {
                        Text(selectedOption.isEmpty ? "Select an option" : selectedOption)
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
                
                if isMenuVisible {
                    VStack {
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                selectedOption = option
                                isMenuVisible = false
                            }) {
                                Text(option)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                            .background(Color.white)
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.top, -8)
                    .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
                }
            }
        }
        .padding(.horizontal, 10)
    }
    
}
struct SettingsView: View {
    @State private var text: String = ""
    @State private var textFieldService = ""
    @State private var isToggleOn = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            DropdownView(subTitle: "Distance Units*")
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
            DropdownView(subTitle: "Default Bike")
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
