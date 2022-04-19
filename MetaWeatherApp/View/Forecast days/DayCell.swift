//
//  DayCell.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct DayCell: View {
    @State var weather: ConsolidatedWeather
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(DateFormat.format(weather.applicableDate))
                    .font(.title2)
                Text(weather.applicableDate)
                    .font(.title3)
            }
            
            Spacer()
            
            Text("\(String( Int(weather.theTemp) ))°C")
                .font(.title2)
        }
    }
}

//struct DayCell_Previews: PreviewProvider {
//    static var previews: some View {
//        DayCell()
//    }
//}
