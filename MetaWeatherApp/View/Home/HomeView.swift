//
//  ContentView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            if $weatherVM.isVisible.wrappedValue {
                CityListView(allWeathers: weatherVM.allWeathers)
            } else {
                ProgressView() //Loading fetch data
            }
        }.onAppear(perform: fetchWeather)
    }
    func fetchWeather() {
        weatherVM.getWeather()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weatherVM: WeatherViewModel())
    }
}
