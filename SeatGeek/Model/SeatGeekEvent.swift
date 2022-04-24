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
    
    var isFavorite: Bool
    
    init(apiEvent: Event) {
        self.title = apiEvent.title ?? "Title Unavailable"
        self.dateTime = apiEvent.datetime_utc?.formatAsDateTime() ?? "Date Unavailable"
        self.location =
        """
        \(apiEvent.venue?.city ?? "City Unavailable"), \
        \(apiEvent.venue?.state ?? "State Unavailable")
        """
        if let imageName = apiEvent.performers?.first?.image {
            self.imageName = imageName
        } else {
            self.imageName = nil
        }
        self.isFavorite = false
    }

    static let defaultEvent = SeatGeekEvent(apiEvent: Event(
        datetime_utc: "Monday",
        venue: Event.Venue(
            state: "MO",
            city: "Columbia"),
        title: "Festival",
        performers: [Event.Performers(image: "https://seatgeek.com/images/performers-landscape/spafford-fbc1a6/102962/huge.jpg")]
    ))
    
}


