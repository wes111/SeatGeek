//
//  EventsViewModel.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import Combine
import Foundation

class EventsViewModel: ObservableObject {
    @Published var publishedEvents: EventsResponseModel?
    let eventFetcher = EventFetcher()
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        receiveModelUpdates()
    }
    
    func receiveModelUpdates() {
        eventFetcher.getEvents()
            .sink { model in
                self.publishedEvents = model
            }
            .store(in: &subscriptions)
    }
    
    
    
}
