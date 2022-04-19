//
//  TemperatureView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct TemperatureView: View {
    @State var weather: ConsolidatedWeather
    var degrees = ["°C", "°F"]
    @State var cuurentDegree = 0
    
    var body: some View {
        VStack {
            HStack {
                Image(weather.weatherStateAbbr)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                
                Text(weather.weatherStateName)
                    .font(.title)
                    .fontWeight(.light)
            }
            
            VStack {
                Text("\(String( Int(weather.theTemp) ))\(degrees[cuurentDegree])")
                    .font(.system(size: 70))
                .fontWeight(.ultraLight)
                
                HStack(spacing: 30.0) {
                    Text("Min temp: \(String( Int(weather.minTemp) ))\(degrees[cuurentDegree])")
                        .font(.caption)
                        .fontWeight(.light)
                    Text("Max temp: \(String( Int(weather.maxTemp) ))\(degrees[cuurentDegree])")
                        .font(.caption)
                        .fontWeight(.light)
                    
                }
            }
        }.padding().background(Color(UIColor.gray).opacity(0.1))
            .onTapGesture {
                print("tapped")
                if (cuurentDegree == 0) {
                    self.cuurentDegree = 1
                    weather.minTemp = TemperatureConverter.toFahrenheit(celsius: weather.minTemp)
                    weather.maxTemp = TemperatureConverter.toFahrenheit(celsius: weather.maxTemp)
                    weather.theTemp = TemperatureConverter.toFahrenheit(celsius: weather.theTemp)
                } else {
                    self.cuurentDegree = 0
                    weather.minTemp = TemperatureConverter.toCelsius(fahrenheit: weather.minTemp)
                    weather.maxTemp = TemperatureConverter.toCelsius(fahrenheit: weather.maxTemp)
                    weather.theTemp = TemperatureConverter.toCelsius(fahrenheit: weather.theTemp)
                }
            }
    }
}

//struct TemperatureView_Previews: PreviewProvider {
//    static var previews: some View {
//        TemperatureView(weather: Weather())
//    }
//}
