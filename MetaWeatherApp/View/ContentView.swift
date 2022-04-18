//
//  ContentView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: fetchWeather)
    }
    func fetchWeather() {
        weatherVM.getWeather(for: "1939753")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weatherVM: WeatherViewModel())
    }
}
