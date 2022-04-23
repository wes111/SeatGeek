//
//  EventView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

struct EventView: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.up")
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(event.title)
                    .fontWeight(.heavy)
                    .font(.system(size: 15))
                Text(event.venue.city)
                    .font(.system(size: 10))
                    .foregroundColor(Color.gray)
                Text(event.datetime_utc)
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
        EventView(event: Event(
            datetime_utc: "Monday",
            venue: Event.Venue(
                state: "MO",
                city: "Columbia"),
            title: "Festival",
            performers: [Event.Performers(image: "bob")]
        )
        )
        .padding()
    }
}