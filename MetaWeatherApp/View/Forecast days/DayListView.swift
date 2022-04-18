//
//  DayListView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct DayListView: View {
    @State var weather: Weather
    
    var body: some View {
            ZStack {
                BackgroundView()
                VStack {
                    List {
                        ForEach(0 ..< weather.consolidatedWeather.count) { index in
                            NavigationLink(destination: WeatherView(weather: weather.consolidatedWeather[index], title: weather.title)) {
                                DayCell(weather: weather.consolidatedWeather[index])
                            }
                        }
                        
                    }
                    .navigationBarTitle(Text("Forecast Days"))
                }
            }
    }
}

//struct DayListView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayListView(weather: Weather())
//    }
//}
