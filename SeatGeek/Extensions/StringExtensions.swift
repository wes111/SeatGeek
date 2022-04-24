//
//  StringExtensions.swift
//  SeatGeek
//
//  Created by Wesley Luntsford on 4/23/22.
//

import Foundation

extension String {
    
    // Returns an optional date String in the format 'Fri, 09 Aug 2019 9:15 PM'
    // from a String in the format "yyyy'-'MM'-'dd'T'HH':'mm':'ss".
    func formatAsDateTime() -> String? {
        let formatter = DateFormatter()
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
        let date = formatter.date(from: self)
        formatter.dateFormat = "E',' dd MMM yyyy h':'mm a"
        if let date = date {
            let stringDate = formatter.string(from: date)
            return stringDate.capitalizeLettersFirst(3)
        } else {
            return nil
        }
    }
    
    // Returns an optional String with the first n letters capitalized.
    // String length must be at least n.
    func capitalizeLettersFirst(_ count: Int) -> String? {
        guard self.count >= count else { return nil }
        return prefix(count).uppercased() + self.dropFirst(count)
    }
}
