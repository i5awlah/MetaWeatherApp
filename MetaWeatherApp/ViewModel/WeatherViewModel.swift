import Foundation

class WeatherViewModel : ObservableObject {
    
    private var weatherService: WeatherService = WeatherService()
    var weather: Weather = Weather()
    @Published var isVisible: Bool = false
    
    
    func getWeather(for id: String) {
        weatherService.getWeatherAPI(
            id: id,
            onSuccess: {(response) in
                self.weather = response
                print("response: \(response)")
                self.isVisible = true
            },
            onFailure: {(message) in
                print("message \(message)")
            })
    }

}

