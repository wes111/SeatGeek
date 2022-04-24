//
//  ImageExtensions.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import SwiftUI

extension Image {
    func thumbnailImageModifier() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipped()
            .cornerRadius(5)
    }
}

