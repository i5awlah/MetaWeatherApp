//
//  ContentView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        // test API call
            .onAppear {
                WeatherService().getWeatherAPI(
                    id: "1939753",
                    onSuccess: {(response) in
                        print("response: \(response)")
                    },
                    onFailure: {(message) in
                        print("message \(message)")
                    })
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
