//
//  NeumorphicVM.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

struct NeumorphicVM: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                
                .stroke(LinearGradient.darkBorderGradient,
                        lineWidth: 1)
            )
            .background(Color(.white))
            .cornerRadius(10)
            
            .shadow(
                color: Color(white: 1.0).opacity(0.9),
                radius: 18,
                x: -18,
                y: -18)
            .shadow(
                color: Color.gray.opacity(0.5),
                radius: 14,
                x: 14,
                y: 14)
    }
    
}

// MARK: - Preview
struct NeumorphicVM_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello World")
                .padding()
        }
        .modifier(NeumorphicVM())
        .padding()
    }
}
