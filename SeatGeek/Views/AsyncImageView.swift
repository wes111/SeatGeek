//
//  AsynImageView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

enum ImageStyle {
    case thumbnail
    case regular
}

struct AsyncImageView: View {
    
    let imageString: String?
    let imageStyle: ImageStyle
    
    var body: some View {
        if let imageString = imageString,
           let imageURL = URL(string: imageString) {
            AsyncImage(
                url: imageURL,
                content: { image in
                    if imageStyle == .thumbnail {
                        image
                            .thumbnailImageModifier()
                    } else {
                        image
                    }
                },
                placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            )
        } else {
            Image(systemName: "photo")
                .frame(width: 50, height: 50)
        }
    }
}

struct AsynImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(imageString: "https://seatgeek.com/images/performers-landscape/phish-c2ff57/1436/24016/huge.jpg", imageStyle: .regular)
    }
}
