//
//  FavoriteEventsPersistor.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/24/22.
//

import Foundation

class FavoriteEventsPersistor {
    
    let userDefaults = UserDefaults.standard
    let favoritesKey = "favorites"
    var storedFavorites: [String]
    
    init() {
        storedFavorites = userDefaults.object(forKey: favoritesKey) as? [String] ?? []
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
    
    // If an event is favorited in userDefaults, update its status in the app.
    func updateFavoriteStatus(for event: SeatGeekEvent) -> SeatGeekEvent {
        var newEvent = event
        if storedFavorites.contains(event.id) {
            newEvent.update(isFavorite: true)
        }
        return newEvent
    }
}
