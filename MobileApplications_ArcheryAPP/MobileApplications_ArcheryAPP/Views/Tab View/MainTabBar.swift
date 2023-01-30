//
//  MainTabBar.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 28/10/2022.
//

import SwiftUI

struct MainTabBar: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
        }
    }
}
struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
