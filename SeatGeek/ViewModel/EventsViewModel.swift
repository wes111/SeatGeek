//
//  EventsViewModel.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import Combine
import Foundation

class EventsViewModel: ObservableObject {
    @Published var publishedEvents: [SeatGeekEvent]?
    let eventFetcher = EventFetcher()
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        receiveModelUpdates()
    }
    
    func receiveModelUpdates() {
        eventFetcher.getEvents()
            .sink { model in
                self.createSeatGeekEvents(using: model)
            }
            .store(in: &subscriptions)
    }
    
    func submitQuery(_ query: String) {
        //eventFetcher.
    }
    
    func createSeatGeekEvents(using model: EventsResponseModel?) {
        var seatGeekEvents: [SeatGeekEvent] = []
        if let events = model?.events {
            for event in events {
                seatGeekEvents.append(SeatGeekEvent(event: event))
            }
        }
        publishedEvents = seatGeekEvents
    }
    
    
    
}
