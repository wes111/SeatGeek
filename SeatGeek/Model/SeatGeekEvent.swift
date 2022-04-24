//
//  Event.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import SwiftUI

struct SeatGeekEvent: Identifiable {
    
    let id = UUID()
    let title: String
    let dateTime: String
    let location: String
    let imageName: String?
    
    init(event: Event) {
        self.title = event.title
        self.dateTime = event.datetime_utc.formatAsDateTime() ?? "Date Unavailable"
        self.location = "\(event.venue.city), \(event.venue.state)"
        if !event.performers.isEmpty {
            self.imageName =  event.performers[0].image
        } else {
            self.imageName = nil
        }
    }
    
    
    
    static let defaultEvent = SeatGeekEvent(event: Event(
        datetime_utc: "Monday",
        venue: Event.Venue(
            state: "MO",
            city: "Columbia"),
        title: "Festival",
        performers: [Event.Performers(image: "https://seatgeek.com/images/performers-landscape/spafford-fbc1a6/102962/huge.jpg")]
    ))
    
}


