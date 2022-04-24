//
//  ToggleHeartView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/24/22.
//

import SwiftUI

struct ToggleSysImageView: View {
    @Binding var isSelected: Bool
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .foregroundColor(.red)
            .frame(width: 30, height: 25)
            .gesture(TapGesture()
                .onEnded({ _ in
                    isSelected.toggle()
                }))
    }
}

// MARK: - Preview
struct ToggleSysImageView_Previews: PreviewProvider {
    struct ToggleSysImageViewPreview: View {
        @State private var isSelected = true
        let imageName = "heart"
        
        var body: some View {
            ToggleSysImageView(
                isSelected: $isSelected,
                imageName: imageName)
        }
    }

    static var previews: some View {
        ToggleSysImageViewPreview()
    }
}
