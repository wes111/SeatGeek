//
//  EventView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

struct EventView: View {
    let event: SeatGeekEvent
    
    var body: some View {
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
        .modifier(NeumorphicVM())
        
        
    }
}

// MARK: - Preview
struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: SeatGeekEvent.defaultEvent)
            .padding()
    }
}
