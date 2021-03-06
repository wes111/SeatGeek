//
//  EventDetailView.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import SwiftUI

// The detail view displayed to the user when a SeatGeekEvent
// is selected in EventList.
struct EventDetailView: View {
    
    @Binding var event: SeatGeekEvent

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(event.title)
                    .fontWeight(.semibold)
                    .font(.title)
                Spacer()
                if event.isFavorite {
                    ToggleFavoriteView(isSelected: $event.isFavorite,
                        imageName: "heart.fill", id: event.id)
                } else {
                    ToggleFavoriteView(isSelected: $event.isFavorite,
                        imageName: "heart", id: event.id)
                }
            }
            HStack {
                Spacer()
                AsyncImageView(imageString: event.imageName,
                               imageStyle: .regular)
                Spacer()
            }
            .padding(.bottom, 10)
            
            Text(event.dateTime)
                .fontWeight(.semibold)
                .font(.title)
                .padding(.bottom, 3)
            Text(event.location)
                .fontWeight(.semibold)
                .foregroundColor(Color(.dsgMedium))
                .font(.system(size: 18))
            Spacer()
        }
        .navigationBarTitle("Details", displayMode: .inline)
        .foregroundColor(.black)
        .padding()
    }
}

// MARK: - Preview
struct EventDetailView_Previews: PreviewProvider {
    
    struct EventDetailViewPreview: View {
        @State private var event = SeatGeekEvent.defaultEvent
        
        var body: some View {
            EventDetailView(event: $event)
        }
    }
    
    static var previews: some View {
        EventDetailViewPreview()
    }
}
