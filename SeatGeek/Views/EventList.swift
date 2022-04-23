//
//  EventList.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/22/22.
//

import SwiftUI

struct EventList: View {
    @StateObject var model = EventsViewModel()
    @State private var queryText = ""
    init() {
        setUpSearchBarAppearance()
        setUpNavBarAppearance()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(model.publishedEvents?.events ?? []) { event in
                    EventView(event: event)
                }
                .padding()
            }
            .navigationTitle("Events")
        }
        .searchable(text: $queryText)
        .foregroundColor(.white)
    }
}

// MARK: - Helper Functions

func setUpNavBarAppearance() {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = .dsgMedium
    navBarAppearance.titleTextAttributes =
        [.foregroundColor: UIColor.white]
    navBarAppearance.largeTitleTextAttributes =
        [.foregroundColor: UIColor.white]

    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
}

func setUpSearchBarAppearance() {
    UISearchBar.appearance().tintColor = .white
    UITextField.appearance().backgroundColor = .dsgDark
}

// MARK: - Preview
struct EventList_Previews: PreviewProvider {
    
    static var previews: some View {
        EventList()
    }
}
