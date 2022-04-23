//
//  EventDetailView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import SwiftUI

struct EventDetailView: View {
    
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(event.title)
                Spacer()
                Image(systemName: "heart")
            }
            HStack {
                Spacer()
                AsyncImageView(imageString: event.performers.first?.image)
                Spacer()
            }
            
            Text(event.datetime_utc)
            Text(event.venue.city)
            Spacer()
        }
        .navigationTitle("Details")
        .foregroundColor(.black)
        .padding()
    }
        
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event(
            datetime_utc: "Monday",
            venue: Event.Venue(
                state: "MO",
                city: "Columbia"),
            title: "Festival",
            performers: [Event.Performers(image: "bob")]
        ))
    }
}
