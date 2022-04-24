//
//  EventsViewModel.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import Combine
import Foundation

// The app's viewModel.
class EventsViewModel: ObservableObject {
    @Published var publishedEvents: [SeatGeekEvent] = []
    private let eventFetcher = EventFetcher()
    private var subscriptions = Set<AnyCancellable>()
    
    let userDefaults = UserDefaults.standard
    let favoritesKey = "favorites"
    var storedFavorites: [String]
    
    init() {
        storedFavorites = userDefaults.object(forKey: favoritesKey) as? [String] ?? []
        receiveEvents()
    }
    
    func getEventIndex(with id: String) -> Int? {
        for (index, event) in publishedEvents.enumerated() {
            if event.id == id {
                return index
            }
        }
        return nil
    }
    
    // Saves the event to userDefaults.
    func save(_ id: String) {
        storedFavorites.append(id)
        userDefaults.set(storedFavorites, forKey: favoritesKey)
    }
    
    // Removes the event from userDefaults.
    func delete(_ id: String) {
        storedFavorites = storedFavorites.filter { $0 != id }
        userDefaults.set(storedFavorites, forKey: favoritesKey)
    }
    
    // Subscribe to events from the eventFetcher.
    func receiveEvents() {
        eventFetcher.getEvents()
            .sink { model in
                self.createSeatGeekEvents(from: model)
            }
            .store(in: &subscriptions)
    }
    
    // Have the eventFetcher process a new query.
    func submitQuery(_ query: String) {
        eventFetcher.requestEvents(using: query)
    }
    
    // Create the published model from the responseModel.
    func createSeatGeekEvents(from model: EventsResponseModel?) {
        var seatGeekEvents: [SeatGeekEvent] = []
        if let events = model?.events {
            for event in events {
                let seatGeekEvent = SeatGeekEvent(apiEvent: event)
                let updatedEvent = updateFavoriteStatus(for: seatGeekEvent)
                seatGeekEvents.append(updatedEvent)
            }
        }
        DispatchQueue.main.async {
            self.publishedEvents = seatGeekEvents
        }
    }
    
    // If an event is favorited in userDefaults, update its status in the app.
    func updateFavoriteStatus(for event: SeatGeekEvent) -> SeatGeekEvent {
        var newEvent = event
        if storedFavorites.contains(event.id) {
            newEvent.update(isFavorite: true)
        }
        return newEvent
    }
}
