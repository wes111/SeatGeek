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
    @State var isShowingDetails = false
    @State var tappedIndex: Int = 0
    
    init() {
        setUpSearchBarAppearance()
        setUpNavBarAppearance()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($model.publishedEvents) { $event in
                    EventView(event: $event)
                        .gesture(TapGesture()
                            .onEnded({ _ in
                                tappedIndex = model.getEventIndex(with: event.id) ?? 0
                                isShowingDetails = true
                            }))
                        .padding(EdgeInsets(top: 10, leading: 15,
                                            bottom: 0, trailing: 10))
                    if !model.publishedEvents.isEmpty {
                        NavigationLink(
                            destination: EventDetailView(event: $model.publishedEvents[tappedIndex]),
                            isActive: $isShowingDetails) { EmptyView() }
                    }
                }
            }
            .onChange(of: queryText, perform: { newText in
                self.model.submitQuery(newText)
            })
            .navigationTitle("Events")
        }
        .accentColor(.white) // <- Makes back button white.
        .searchable(text: $queryText)
        .foregroundColor(.white) // <- Makes search text white.
        .environmentObject(model)
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
