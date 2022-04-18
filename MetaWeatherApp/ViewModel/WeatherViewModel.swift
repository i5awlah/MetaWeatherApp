import Foundation

class WeatherViewModel : ObservableObject {
    
    private var weatherService: WeatherService = WeatherService()
    var allWeathers: [Weather] = []
    var cities = ["1521894", "2459115", "1939753"]
    @Published var isVisible: Bool = false
    
    
    func getWeather() {
        for city in cities {
        weatherService.getWeatherAPI(
            id: city,
            onSuccess: {(response) in
                self.allWeathers.append(response)
                print("response: \(response)")
                if (self.cities.count == self.allWeathers.count) {
                self.isVisible = true
                }
            },
            onFailure: {(message) in
                print("message \(message)")
            })
        }
    }

}

