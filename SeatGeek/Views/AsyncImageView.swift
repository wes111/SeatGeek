//
//  AsynImageView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

struct AsyncImageView: View {
    
    let imageString: String?
    
    var body: some View {
        if let imageString = imageString,
        let imageURL = URL(string: imageString) {
            AsyncImage(
                url: imageURL,
                content: { image in
                    image.resizable()
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(5)
                },
                placeholder: {
                    Image(systemName: "photo")
                        .frame(width: 50, height: 50)
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
        AsyncImageView(imageString: "https://seatgeek.com/images/performers-landscape/phish-c2ff57/1436/24016/huge.jpg")
    }
}
