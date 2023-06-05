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
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
        UITabBar.appearance().backgroundColor = UIColor(Color("appCloudBurst"))
        
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab) {
                BikeContentView()
                    .tabItem {
                        if selectedTab == 0 {
                            Image("icon_bikes_active")
                        } else {
                            Image("icon_bikes_inactive")
                        }
                        Text("Bikes")
                            .font(Fonts.tabBar)
                    }
                    .tag(0)
                RideContentView()
                    .tabItem {
                        if selectedTab == 1 {
                            Image("rides_active")
                        } else {
                            Image("rides_inactive")
                        }
                        Text("Rides")
                            .font(Fonts.tabBar)
                    }
                    .tag(1)
                SettingsView()
                    .tabItem {
                        if selectedTab == 2 {
                            Image("settings_active")
                        } else {
                            Image("settings_inactive")
                        }
                        Text("Settings")
                            .font(Fonts.tabBar)
                    }
                    .tag(2)
            }
            .accentColor(.blue)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
        
    }
}
