//
//  WeatherCityView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct WeatherCityView: View {
    @State var weather: ConsolidatedWeather
    @State var title: String
    var body: some View {
        VStack {
            Text(title).font(.title).fontWeight(.light)
            Text(weather.applicableDate).foregroundColor(.gray)
        }
    }
}

//struct WeatherCityView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherCityView(weather: Weather())
//    }
//}
