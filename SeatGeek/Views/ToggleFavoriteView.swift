//
//  ToggleHeartView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/24/22.
//

import SwiftUI

struct ToggleFavoriteView: View {
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
                        model.favoritesPersistor.save(id)
                    } else {
                        model.favoritesPersistor.delete(id)
                    }
                }))
    }
}

// MARK: - Preview
struct ToggleFavoriteView_Previews: PreviewProvider {
    struct ToggleFavoriteViewPreview: View {
        
        @State private var isSelected = true
        
        var body: some View {
            ToggleFavoriteView(
                isSelected: $isSelected,
                imageName: "heart",
                id: "bob")
        }
    }

    static var previews: some View {
        ToggleFavoriteViewPreview()
    }
}
