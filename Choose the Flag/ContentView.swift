//
//  ContentView.swift
//  Choose the Flag
//
//  Created by Jack Farray on 2022-06-21.
//

import SwiftUI

struct ContentView: View {
//    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scorerTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
        @State private var score: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.7, blue: 0.25), location: 0.3),
                .init(color: Color(red: 0.86, green: 0.8, blue: 0.16), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
                VStack {
                    Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                     
                    Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Guess the flag")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                    
                Text("Score:\(score)")
                    .foregroundColor(.black)
                    .font(.title.bold())
                    
                    Spacer()
               
            }
                .padding()
        }
        
        
        .alert(scorerTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        }  message: {
            Text("Your score is \(score)")
        }
        
    }
    
         func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scorerTitle = "Correct"
                self.score += 1
                if score >= 9 {
                    return score = 0
                }
            } else {
                scorerTitle = "Wrong!"
                self.score -= 1
            }
            
            showingScore = true
        }

        
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        }
    }

// Cool Rainbow Gradiant 
//        ZStack  {
//
//            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .orange,  .red]), center: .center)
//


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

