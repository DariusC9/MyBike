//
//  CustomTabBar.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        
        HStack {
        
            
            Button {
                // goes to BikesVC
            } label: {
                VStack(alignment: .center, spacing: 2) {
                    Image("icon_bikes_inactive")
                    Text("Bikes")
                        .font(.system(size: 11,
                                      weight: .semibold))
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, -20)
            
            Spacer()
            
            Button {
                // goes to BikesVC
            } label: {
                VStack(alignment: .center, spacing: 2) {
                    Image("rides_inactive")
                    Text("Rides")
                        .font(.system(size: 11,
                                      weight: .semibold))
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, -20)
            
            Spacer()
            
            Button {
                // goes to BikesVC
            } label: {
                VStack(alignment: .center, spacing: 2) {
                    Image("settings_inactive")
                    Text("Settings")
                        .font(.system(size: 11,
                                      weight: .semibold))
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, -20)
            

            
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .frame(height: 55)
        .background(Color("appCloudBurst"))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
        
    }
}
