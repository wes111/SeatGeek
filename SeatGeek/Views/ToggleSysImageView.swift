//
//  ToggleHeartView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/24/22.
//

import SwiftUI

struct ToggleSysImageView: View {
    @EnvironmentObject var model: EventsViewModel
    @Binding var isSelected: Bool
    let imageName: String
    let id: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .foregroundColor(.red)
            .frame(width: 30, height: 25)
            .gesture(TapGesture()
                .onEnded({ _ in
                    isSelected.toggle()
                    if isSelected {
                        model.save(id)
                    } else {
                        model.delete(id)
                    }
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
                imageName: imageName,
                id: "bob")
        }
    }

    static var previews: some View {
        ToggleSysImageViewPreview()
    }
}
