//
//  DateFormat.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 19/04/2022.
//

import Foundation
class DateFormat {
    static func format(_ inputDate: String) -> String {
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd"
        
        let oldDate = olDateFormatter.date(from: inputDate)
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "EEEE"
        
        if let oldDate = oldDate {
            let calendar = Calendar.current
            if (calendar.isDateInToday(oldDate)) {
                return "Today"
            } else {
                return convertDateFormatter.string(from: oldDate)
            }
        } else {
            return inputDate
        }
    }
}
