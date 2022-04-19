import Foundation

class WeatherViewModel : ObservableObject {
    
    private var weatherService: WeatherService = WeatherService()
    var allWeathers: [Weather] = []
    var cities = ["1521894", "2459115", "1939753"]
    @Published var isVisible: Bool = false
    
    
    func getAllWeather() {
        for city in cities {
            getWeather(for: city)
        }
    }
    
    func getWeather(for city: String) {
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
                self.cities.remove(at: self.cities.count - 1)
                self.isVisible = true
            })
    }
    
    func addNewCity(woeid: String) {
        self.cities.append(woeid)
        isVisible = false
        getWeather(for: woeid)
    }

}

