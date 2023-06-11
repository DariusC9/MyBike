//
//  AddCell.swift
//  MyBike
//
//  Created by Darius Couti on 11.06.2023.
//

import Foundation
import SwiftUI

struct AddCell: View {
    
    var subTitle: String
    @Binding var textFieldBind: String
    @Binding var borderColor: Color
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(subTitle)*")
                .foregroundColor(.white)
                .font(Fonts.labelText)
            ZStack(alignment: .leading) {
                    if textFieldBind.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.white)
                            .font(Fonts.textField)
                            .opacity(0.7)
                            .padding(.leading, 10)
                    }
                    TextField("", text: $textFieldBind, onEditingChanged: { isEditing in
                        if isEditing {
                            borderColor = .white
                        }
                    })
                    .foregroundColor(.white)
                    .font(Fonts.textField)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                }
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(borderColor, lineWidth: 1)
                        .background(Color("appCloudBurst"))
                )
        }
    }
}
