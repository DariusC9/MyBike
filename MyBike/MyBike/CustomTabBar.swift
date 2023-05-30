//
//  CustomTabBar.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import SwiftUI

struct CustomTabBar: View {
    
    @State private var selectedTab = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("appCloudBurst"))
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Bikes")
                .tabItem {
                    if selectedTab == 0 {
                        Image("icon_bikes_active")
                    } else {
                        Image("icon_bikes_inactive")
                    }
                    Text("Bikes")
                        .font(.system(size: 11,
                                      weight: .semibold))
                }
                .tag(0)
            Text("Rides")
                .tabItem {
                    if selectedTab == 1 {
                        Image("rides_active")
                    } else {
                        Image("rides_inactive")
                    }
                    Text("Rides")
                        .font(.system(size: 11,
                                      weight: .semibold))
                }
                .tag(1)
            Text("Settings")
                .tabItem {
                    if selectedTab == 2 {
                        Image("settings_active")
                    } else {
                        Image("settings_inactive")
                    }
                    Text("Settings")
                        .font(.system(size: 11,
                                      weight: .semibold))
                }
                .tag(2)
        }
        .offset(y: 50)
        .accentColor(Color("appBlueRibbon"))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
        
    }
}
