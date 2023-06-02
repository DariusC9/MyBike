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
    @State private var selectedOption = ""
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Button(action: {
                isMenuVisible.toggle()
            }) {
                HStack {
                    Text(selectedOption.isEmpty ? "Select an option" : selectedOption)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(.white)
                        .padding(.trailing)
                    
                }
                .background(Color("appWaikawaGray"))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            }
            
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
}


struct SettingsView: View {
    @State private var text: String = ""
    var body: some View {
        VStack{
            DropdownView()
            HStack {
                
            }
            DropdownView()
            
        }
}
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
