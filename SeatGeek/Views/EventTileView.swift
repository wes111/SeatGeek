//
//  EventView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

struct EventTileView: View {
    @Binding var event: SeatGeekEvent
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            HStack {
                AsyncImageView(imageString: event.imageName,
                               imageStyle: .thumbnail)
                
                VStack(alignment: .leading) {
                    Text(event.title)
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                    Text(event.location)
                        .font(.system(size: 12))
                        .foregroundColor(Color(.dsgMedium))
                    Text(event.dateTime)
                        .font(.system(size: 12))
                        .foregroundColor(Color(.dsgMedium))
                }
                Spacer()
            }
            .padding()
            if event.isFavorite {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 18, height: 15)
                    .padding(EdgeInsets(top: 10, leading: 7,
                                        bottom: 0, trailing: 10))
            }
        }
        .modifier(NeumorphicVM())
    }
}

// MARK: - Preview
struct EventTileView_Previews: PreviewProvider {
    struct EventTileViewPreview: View {
        
        @State private var event = SeatGeekEvent.defaultEvent
        
        var body: some View {
            EventTileView(event: $event)
        }
    }
    
    static var previews: some View {
        EventTileViewPreview()
            .padding()
    }
}
