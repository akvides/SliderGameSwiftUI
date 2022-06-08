//
//  SliderUI.swift
//  SliderGameSwiftUI
//
//  Created by Василий Полторак on 08.06.2022.
//

import SwiftUI

struct SliderUI: UIViewRepresentable {
    
    @Binding var currentValue: Double
    let opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.value = Float(currentValue)
        view.thumbTintColor = .red.withAlphaComponent(CGFloat(opacity) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension SliderUI {
    
    class Coordinator: NSObject {
        
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
    
}
struct UISlider_Previews: PreviewProvider {
    static var previews: some View {
        SliderUI(currentValue: .constant(50.0), opacity: 100)
    }
}
