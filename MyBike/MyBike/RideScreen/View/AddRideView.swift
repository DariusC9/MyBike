//
//  AddRideView.swift
//  MyBike
//
//  Created by Darius Couti on 31.05.2023.
//

import SwiftUI

struct AddRideView: View {
    
    @State var textFieldTitle: String = ""
    @State var textFieldBike: String = ""
    @State var textFieldDistance: String = ""
    @State var textFieldDuration: String = ""
    @State var textFieldDate: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State var borderColor: Color = .white
    
    var body: some View {

            VStack(spacing: 20) {
                AddBikeCell(subTitle: "Ride Title", textFieldBind: $textFieldTitle, borderColor: $borderColor)
                AddBikeCell(subTitle: "Bike", textFieldBind: $textFieldBike, borderColor: $borderColor)
                AddBikeCell(subTitle: "Distance", textFieldBind: $textFieldDistance, borderColor: $borderColor)
                AddBikeCell(subTitle: "Duration", textFieldBind: $textFieldDuration, borderColor: $borderColor)
                AddBikeCell(subTitle: "Date", textFieldBind: $textFieldDate, borderColor: $borderColor)
                Button(action: {
                    
                }) {
                    Text("Add Ride")
                        .foregroundColor(.white)
                        .font(Fonts.buttonText)
                        .frame(maxWidth: .infinity, minHeight: 35)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding(.top, 20)
                Spacer()
                
                }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("appMirage"))
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
    
    struct AddRideView_Previews: PreviewProvider {
        static var previews: some View {
            AddRideView()
        }
    }



struct AddBikeCell: View {
    
    var subTitle: String
    @Binding var textFieldBind: String
    @Binding var borderColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(subTitle)*")
                .foregroundColor(.white)
                .font(Fonts.labelText)
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $textFieldBind, onEditingChanged: { _ in
                borderColor = .white
            })
                .textFieldStyle(.plain)
                .padding(10)
                .foregroundColor(.white)
                .font(Fonts.textField)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(borderColor, lineWidth: 1)
                        .background(Color("appCloudBurst"))
                )
        }
    }
}
