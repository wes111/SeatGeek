//
//  SeatGeekEventPreviewData.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/24/22.
//

import Foundation

extension SeatGeekEvent {
    static let defaultEvent = SeatGeekEvent(apiEvent: Event(
        datetime_utc: "Monday",
        venue: Event.Venue(
            state: "MO",
            city: "Columbia"),
        title: "Festival",
        performers: [Event.Performers(image: "https://seatgeek.com/images/performers-landscape/spafford-fbc1a6/102962/huge.jpg")]
    ))
}
