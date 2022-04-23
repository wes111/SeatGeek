//
//  Event.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import Foundation

struct SeatGeekEvent: Identifiable {
    
    let id = UUID()
    let title: String
    let dateTime: String
    let location: String
    let imageName: String
    
    init(event: Event) {
        self.title = event.title
        self.dateTime = event.datetime_utc
        self.location = event.venue.city
        self.imageName = event.performers[0].image
    }
    
    static let defaultEvent = SeatGeekEvent(event: Event(
        datetime_utc: "Monday",
        venue: Event.Venue(
            state: "MO",
            city: "Columbia"),
        title: "Festival",
        performers: [Event.Performers(image: "bob")]
    ))
    
}


