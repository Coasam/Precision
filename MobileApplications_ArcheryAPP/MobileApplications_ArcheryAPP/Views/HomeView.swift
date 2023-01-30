//
//  HomeView.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 23/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var pulse = false
    
    var body: some View {
        
        ZStack {
            
          Color.black
            .edgesIgnoringSafeArea(.all)
            
            Image(systemName: "target")
                   .font(.system(size: 100))
                   .foregroundColor(.white)
                   .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 200)

            Text("Precision")
              .font(.system(size: 62))
              .foregroundColor(.white)
              .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 50)
              .scaleEffect(pulse ? 1.3 : 1)
              .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
              .onAppear { self.pulse.toggle() }
            
            Image(systemName: "figure.archery")
                   .font(.system(size: 100))
                   .foregroundColor(.white)
                   .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY + 100)

        }
      }
    }

// Popup View - https://www.youtube.com/watch?v=VAbNRnBhZlw

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
