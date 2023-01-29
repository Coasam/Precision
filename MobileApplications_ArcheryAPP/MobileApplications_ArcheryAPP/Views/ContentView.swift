//
//  ContentView.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 28/10/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            ScoringView()
                .tabItem {
                    Image(systemName: "target")
                    Text("Scoring")
                }
                .tag(1)
        
            TimerView()
                .tabItem {
                    Image(systemName: "brain")
                    Text("Mental")
                }
                .tag(0)
            
        }
        .accentColor(.purple)
        .environment(\.colorScheme, .dark)
        .background(Color.gray)
            
        }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
