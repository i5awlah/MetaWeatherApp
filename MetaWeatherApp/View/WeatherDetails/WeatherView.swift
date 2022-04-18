//
//  WeatherView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct WeatherView: View {
    @State var weather: ConsolidatedWeather
    @State var title: String
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                WeatherCityView(weather: weather, title: title)
                Spacer()
                TemperatureView(weather: weather)
                Spacer()
                WeatherDetailStack(weather: weather)
            }
        }
    }
}

//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView(consolidatedWeather: ConsolidatedWeather())
//    }
//}
