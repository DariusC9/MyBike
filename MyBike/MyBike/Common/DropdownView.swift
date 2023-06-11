//
//  DropdownView.swift
//  MyBike
//
//  Created by Darius Couti on 10.06.2023.
//

import Foundation
import SwiftUI

struct DropdownView: View {
    @State private var isMenuVisible = false
    @Binding var selectedOption: Pair
    var subTitle: String
    @Binding var borderColor: Color

    let options: [Pair]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(subTitle)*")
                .foregroundColor(.white)
                .font(Fonts.labelText)
            ZStack(alignment: .trailing) {
                Button(action: {
                    isMenuVisible.toggle()
                }) {
                    selectedOptionView()
                }
                .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(borderColor, lineWidth: 1)
                            .background(Color("appCloudBurst"))
                    )
                
                if isMenuVisible {
                    menuView()
                }
            }
        }
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    func selectedOptionView() -> some View {
        HStack {
            Text(selectedOption.name == nil ? "Select an option" : selectedOption.name ?? "")
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
    
    @ViewBuilder
    func menuView() -> some View {
        VStack {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                    isMenuVisible = false
                }) {
                    Text(option.name ?? "")
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
