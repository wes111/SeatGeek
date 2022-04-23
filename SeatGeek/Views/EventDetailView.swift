//
//  EventDetailView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import SwiftUI

struct EventDetailView: View {
    
    let event: SeatGeekEvent
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(event.title)
                Spacer()
                Image(systemName: "heart")
            }
            HStack {
                Spacer()
                AsyncImageView(imageString: event.imageName)
                Spacer()
            }
            
            Text(event.dateTime)
            Text(event.location)
            Spacer()
        }
        .navigationTitle("Details")
        .foregroundColor(.black)
        .padding()
    }
        
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: SeatGeekEvent.defaultEvent)
    }
}
