//
//  WeatherDetailStack.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct WeatherDetailStack: View {
    @State var weather: ConsolidatedWeather
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 6.0) {
                Text("Wind Speed")
                Text(String(format: "%.3f", weather.windSpeed))
            }.frame(width: 85, height: 70)
                .background(Color(UIColor.gray).opacity(0.1))
            
            VStack(alignment: .center, spacing: 6.0) {
                Text("Humidity")
                Text(String(weather.humidity))
            }.frame(width: 85, height: 70)
                .background(Color(UIColor.gray).opacity(0.1))
            
            VStack(alignment: .center, spacing: 6.0) {
                Text("Pressure").padding(.bottom, 1)
                Text(String(weather.airPressure))
            }.frame(width: 85, height: 70)
                .background(Color(UIColor.gray).opacity(0.1))
        }.font(.caption)
    }
}

//struct WeatherDetailStack_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailStack(weather: Weather())
//    }
//}
