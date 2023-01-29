//
//  PortsmouthView.swift
//  MobileApplications_ArcheryAPP
//
//  Created by Samuel Coate on 17/12/2022.
//

import SwiftUI


struct ScoreView: View {
    
    @State private var score: Int = 0
    @State private var endCounter: Int = 0
    @State private var scores: [Int] = []
    @State var savedScores: [Int] = Array(repeating: 0, count: 60)
    
    @State private var showError = false
    
    var average: Double {
        if !savedScores.isEmpty {
            let sum = savedScores.reduce(0, +)
            let avg = sum / (savedScores.count)
            return Double(avg)
        }
        else {
            return 0.0
        }
    }

    var body: some View {
        
        VStack {
            
            Text("End Total: \(score)")
                .font(.title)
            
            Text(scores.map(String.init).joined(separator: "  "))
                .font(.title)
                .padding()
            
            Spacer()
                .frame(height: 100)
            
            HStack {
                ForEach(1...5, id: \.self) { number in
                    Button(action: {
                        if (scores.count < 6) {
                            self.scores.append(number)
                            self.score += number
                        }
                        
                    }) {
                        Text("\(number)").foregroundColor(.black)
                    }.font(.title).padding().background(Color.white)
                        .clipShape(Capsule())
                }
            }

            HStack {
                ForEach(5...10, id: \.self) { number in
                    Button(action: {
                        if (scores.count < 6) {
                            self.scores.append(number)
                            self.score += number
                            print(scores)
                        }
                        
                    }) {
                        Text("\(number)").foregroundColor(.black)
                    }.font(.title).padding().background(Color.white)
                        .clipShape(Capsule())
                }
            }
    
            Spacer()
                .frame(height: 50)
            
            HStack {
                Button(action: {
                    if let last = self.scores.popLast(){
                        self.score -= last
                    }
                }) {
                    Text("Undo")
                        .font(.title).foregroundColor(.white)
                } .padding().background(Color.purple)
                    .clipShape(Capsule())
                
                Button(action: {
                     if self.scores.count > 0 {
                         self.savedScores.removeLast()
                         self.savedScores.insert(contentsOf: self.scores, at: 0)
                         self.scores.removeAll()
                         self.score = 0
                         self.endCounter += 1
                         
                         if savedScores.count == 60 {
                             self.showError.toggle()
                         }
                                    
                         print(savedScores)
                     }
                }) {
                     Text("Save").font(.title).foregroundColor(.white)
                 }.padding().background(Color.purple)
                    .clipShape(Capsule())
            }
            
            Text("Total Score: \(savedScores.reduce(0, +))")
                .font(.title2).padding()
            
            Text("Average: \(String(format: "%.2f", average))").font(.title2).padding()
            
            Text("Total Ends: \(endCounter)")
                .font(.title2).padding()

        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
