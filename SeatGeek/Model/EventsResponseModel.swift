//
//  EventResponseModel.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import Foundation


struct EventsResponseModel: Decodable {
    //let id = UUID()
    let events: [Event]
    
}

struct Event: Decodable, Identifiable {
    let id = UUID()
    let datetime_utc: String
    let venue: Venue
    let title: String
    let performers: [Performers]
    
    struct Venue: Decodable {
        let state: String
        let city: String
    }
    
    struct Performers: Decodable {
        let image: String
    }
}
