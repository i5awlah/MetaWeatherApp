//
//  CityCell.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct CityCell: View {
    @State var weather: Weather
    var body: some View {
        HStack {
            Text(weather.title)
                .font(.title)
            
            Spacer()
            
            Text("\(String( Int(weather.consolidatedWeather[0].theTemp) ))°C")
                .font(.largeTitle)
        }
    }
}

//struct CityCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CityCell()
//    }
//}
