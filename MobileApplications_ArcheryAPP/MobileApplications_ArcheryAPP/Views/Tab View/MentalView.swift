//
//  MentalView.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 23/11/2022.
//

import SwiftUI

struct TimerView: View {
    @State private var prepTime = 0
    @State private var drawAndAnchorTime = 0
    @State private var timer: Timer?
    @State private var timeRemaining = 0
    @State private var showShoot = false

    var body: some View {
        VStack {
            
            Text("Enter Details Below For Consistent Shooting!").font(.title).padding()
            
            Spacer()
                .frame(height: 50)
            
            HStack {
                Text("Prep Timer (secs)").font(.title).padding()
                TextField("Enter Prep Time", value: $prepTime, formatter: NumberFormatter())
                    .keyboardType(.numberPad).font(.title).padding()
            }
            
            Spacer()
                .frame(height: 10)
            
            HStack {
                Text("Draw & Anchor (secs)").font(.title).padding()
                TextField("Enter Draw & Anchor Time", value: $drawAndAnchorTime, formatter: NumberFormatter())
                    .keyboardType(.numberPad).font(.title).padding()
            }
            
            Spacer()
                .frame(height: 50)
            
            HStack {
                Button(action: {
                    self.startTimer()
                }) {
                    Text("Start").font(.title).padding().background(.purple).foregroundColor(.white)
                }
                Button(action: {
                    self.stopTimer()
                }) {
                    Text("Stop").font(.title).padding().background(.purple).foregroundColor(.white)
                }
            }
            
            Spacer()
                .frame(height: 50)
            
            Text("Time remaining: \(timeRemaining)")
                .font(.largeTitle)
                .padding()
            if showShoot {
                Text("Shoot!")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.red)
                    .fontWeight(.bold)
            }
        }
    }

    func startTimer() {
        timer?.invalidate()
        timeRemaining = prepTime + drawAndAnchorTime
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.showShoot = true
                timer.invalidate()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        showShoot = false
    }
}


struct CountdownPreviews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
