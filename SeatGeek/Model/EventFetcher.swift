//
//  EventFetcher.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import Combine
import Foundation

struct EventFetcher {
    
    private let baseURL = "https://api.seatgeek.com/2/events?"
    private let clientID = "MjY2Nzk4MDJ8MTY1MDY2NDI0OC4wNTU0NzM2"
    private let decoder = JSONDecoder()
    private let eventsSubject = CurrentValueSubject<EventsResponseModel?, Never>(nil)
    
    init() {
        requestEvents(using: "")
    }
    
    func getEvents() -> AnyPublisher<EventsResponseModel?, Never> {
        return eventsSubject.eraseToAnyPublisher()
    }
    
    func requestEvents(using query: String) {
        let urlWithQuery = "\(baseURL)client_id=\(clientID)&q=\(query)"
        if let url = URL(string: urlWithQuery) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    do {
                        let eventsData = try self.decoder.decode(EventsResponseModel.self, from: safeData)
                        self.eventsSubject.send(eventsData)
                    } catch {
                        print(error)
                    }
                } else {
                    print("Error receiving data from URL.")
                }
            }
            task.resume()
        }
    }
}
