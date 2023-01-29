//
//  HomeView.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 23/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            
            Text("Welcome To... \n Precision")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
                .frame(height: 40)
            
            
            Text("Select Scoring To Begin A Portsmouth Score!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
                .frame(height: 40)
            
            Text("Select Mental To Begin reaction Training!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding()
            
        }.padding()
            
    }
}

// Popup View - https://www.youtube.com/watch?v=VAbNRnBhZlw

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
