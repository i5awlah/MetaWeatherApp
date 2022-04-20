//
//  MetaWeatherAppApp.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

@main
struct MetaWeatherAppApp: App {
    @State private var persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            HomeView(weatherVM: WeatherViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
