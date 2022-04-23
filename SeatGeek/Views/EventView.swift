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
            AsyncImageView(imageString: event.imageName)
            
            VStack(alignment: .leading) {
                Text(event.title)
                    .foregroundColor(Color.black)
                    .fontWeight(.heavy)
                    .font(.system(size: 15))
                Text(event.location)
                    .font(.system(size: 10))
                    .foregroundColor(Color.gray)
                Text(event.dateTime)
                    .font(.system(size: 10))
                    .foregroundColor(Color.gray)
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
