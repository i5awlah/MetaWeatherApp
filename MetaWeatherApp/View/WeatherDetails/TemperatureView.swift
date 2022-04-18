//
//  TemperatureView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct TemperatureView: View {
    @State var weather: ConsolidatedWeather
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
                Text("\(String( Int(weather.theTemp) ))°C")
                    .font(.system(size: 70))
                .fontWeight(.ultraLight)
                
                HStack(spacing: 30.0) {
                    Text("Min temp: \(String( Int(weather.minTemp) ))°C")
                        .font(.caption)
                        .fontWeight(.light)
                    Text("Max temp: \(String( Int(weather.maxTemp) ))°C")
                        .font(.caption)
                        .fontWeight(.light)
                    
                }
            }
        }.padding().background(Color(UIColor.gray).opacity(0.1))
    }
}

//struct TemperatureView_Previews: PreviewProvider {
//    static var previews: some View {
//        TemperatureView(weather: Weather())
//    }
//}
