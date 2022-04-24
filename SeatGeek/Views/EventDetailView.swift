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
                    .fontWeight(.semibold)
                    .font(.title)
                Spacer()
                Image(systemName: "heart")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 30, height: 25)
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

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: SeatGeekEvent.defaultEvent)
    }
}
