//
//  EventList.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

struct EventList: View {
    //let eventFetcher = EventFetcher()
    
    @StateObject var eventsModel = EventsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(eventsModel.eventsModel?.events ?? []) { event in
                    EventView(event: event)
                }
            }
        }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
