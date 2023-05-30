//
//  CustomTabBar.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import SwiftUI

struct CustomTabBar: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("appCloudBurst"))
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
        TabView {
            Text("Bikes")
                .tabItem {
                    Image("icon_bikes_inactive")
                    Text("Bikes")
                        .font(.system(size: 11,
                                      weight: .semibold))
                }
            Text("Rides")
                .tabItem {
                    Image("rides_inactive")
                    Text("Rides")
                        .font(.system(size: 11,
                                      weight: .semibold))
                }
            Text("Settings")
                .tabItem {
                    Image("settings_inactive")
                    Text("Settings")
                        .font(.system(size: 11,
                                      weight: .semibold))
                }
        }
        .offset(y: 50)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
        
    }
}
