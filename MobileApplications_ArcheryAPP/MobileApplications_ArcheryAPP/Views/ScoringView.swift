//
//  ScoringView.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 28/10/2022.
//

import SwiftUI

struct ScoringView: View {
    
    @State private var selectedRoundType: String? = ""
    
    var body: some View {
        
        NavigationView{
            VStack {
                Text("Select \nRound Type").foregroundColor(.purple).padding().font(.system(size: 40)).fontWeight(.bold)
                
                Spacer()
                    .frame(height: 50)
                
                NavigationLink(destination: ScoreView(), tag: "Portsmouth", selection: $selectedRoundType) {
                    Picker(selection: $selectedRoundType, label: EmptyView()) {
                        Text("Portsmouth")
                        Text("WA70").tag("WA70")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
}


struct ScoringView_Previews: PreviewProvider {
    static var previews: some View {
        ScoringView()
    }
}
