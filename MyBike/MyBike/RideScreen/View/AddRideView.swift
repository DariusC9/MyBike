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
    
    var body: some View {
        ZStack {
            Color("appCloudBurst")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                AddBikeCell(subTitle: "Ride Title", textFieldBind: $textFieldTitle)
                AddBikeCell(subTitle: "Bike", textFieldBind: $textFieldBike)
                AddBikeCell(subTitle: "Distance", textFieldBind: $textFieldDistance)
                AddBikeCell(subTitle: "Duration", textFieldBind: $textFieldDuration)
                AddBikeCell(subTitle: "Date", textFieldBind: $textFieldDate)
                Button(action: {
                    
                }) {
                    Text("Add Ride")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 35)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding(.top, 20)
                Spacer()
                
                }
            .padding(.horizontal, 10)
            
            }
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
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            Text("\(subTitle)*")
                .foregroundColor(.white)
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $textFieldBind)
                .background(Color("appWaikawaGray")
                    .cornerRadius(5))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .font(.system(size: 25))
//              .font()
        }
    }
    
    
}
