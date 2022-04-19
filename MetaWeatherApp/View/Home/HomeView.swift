//
//  ContentView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            if $weatherVM.isVisible.wrappedValue {
                ZStack {
                    NavigationView {
                        ZStack {
                            BackgroundView()
                    CityListView(allWeathers: weatherVM.allWeathers)
                    // FAB for adding new city
                    FloatingActionButton(action: {
                        print("tap")
                        // show alert
                        self.text = ""
                        self.isPresented = true
                    }, imageName: "plus", color: Color.purple)
                        }
                    }.accentColor(Color(.label))
                        .onAppear { UITableView.appearance().backgroundColor = UIColor.clear}
                    CustomAlert(title: "Enter WOEID City", isShown: $isPresented, text: $text) { woeid in
                        print("New woeid: \(woeid)")
                        weatherVM.addNewCity(woeid: woeid)
                    }
                }
            } else {
                ProgressView() //Loading fetch data
            }
        }.onAppear(perform: fetchWeather)
    }
    func fetchWeather() {
        weatherVM.getAllWeather()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weatherVM: WeatherViewModel())
    }
}
