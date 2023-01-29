//
//  MentalView.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 23/11/2022.
//

import SwiftUI
import Foundation

struct TimerView: View {
    @State private var prepTime = 0
    @State private var drawAndAnchorTime = 0
    @State private var frequency = 50.0
    @State private var timerIsRunning = false
    @State private var showShootPopup = false
    @State private var showComeDownPopup = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Text("Prep Timer (seconds)").font(.title)
                TextField("Enter time", value: $prepTime, formatter: NumberFormatter())
                    .keyboardType(.numberPad).font(.title).padding().background(Color.purple)
                    .clipShape(Capsule()).frame(width: 150, height: 50).foregroundColor(.white)
            }
            HStack {
                Text("Draw & Anchor Time (seconds)").font(.title)
                TextField("Enter time", value: $drawAndAnchorTime, formatter: NumberFormatter())
                    .keyboardType(.numberPad).font(.title).padding().background(Color.purple)
                    .clipShape(Capsule()).frame(width: 150, height: 50).foregroundColor(.white)
            }
            HStack {
                Text("Frequency (%)").font(.title)
                TextField("Enter percentage", value: $frequency, formatter: NumberFormatter())
                    .keyboardType(.numberPad).font(.title).padding().background(Color.purple)
                    .clipShape(Capsule()).frame(width: 150, height: 50).foregroundColor(.white)
            }
            
            Spacer()
            
            Button(action: {
                self.timerIsRunning.toggle()
                self.startTimer()
            }) {
                Text("Start").font(.title).background(Color.purple)
                    .clipShape(Capsule()).foregroundColor(.white).padding()
            }
            Button(action: {
                self.timerIsRunning = false
            }) {
                Text("Stop").font(.title).background(Color.purple)
                    .clipShape(Capsule()).foregroundColor(.white).padding()
            }
        }
        .alert(isPresented: $showShootPopup) {
            Alert(title: Text("Shoot!"))
        }
        .alert(isPresented: $showComeDownPopup) {
            Alert(title: Text("Come Down!"))
        }
    }
    
    func startTimer() {
        let totalTime = self.prepTime + self.drawAndAnchorTime
        let timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(totalTime), repeats: true) { timer in
            let randomNum = Double.random(in: 0...100)
            if randomNum <= self.frequency {
                self.showShootPopup = true
            } else {
                self.showComeDownPopup = true
            }
            if !self.timerIsRunning {
                timer.invalidate()
            }
        }
        timer.fire()
    }
    
}


struct CountdownPreviews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
