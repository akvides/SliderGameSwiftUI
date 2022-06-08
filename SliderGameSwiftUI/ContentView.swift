//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Василий Полторак on 08.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 0.0
    
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Подвиньте слайдер как можно ближе к: ")
                Text("\(targetValue)")
            }
            .font(.callout)
            HStack{
                Text("0")
                SliderUI(currentValue: $currentValue, opacity: computeScore())
                Text("100")
            }
            .padding(.horizontal, 16)
            VStack {
                Button("Проверь меня") {
                    showAlert = true
                    targetValue = Int.random(in: 0...100)
                }
                .alert("Ваш результат: \(computeScore())", isPresented: $showAlert) {}
                .padding()
                Button("Начать заново") {
                    targetValue = Int.random(in: 0...100)
                }
                .padding()
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
