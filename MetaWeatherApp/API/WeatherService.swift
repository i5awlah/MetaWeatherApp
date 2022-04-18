import Foundation

let baseURLString = "https://www.metaweather.com/api/location/"

class WeatherService {
    
    func getWeatherAPI(id: String,
                       onSuccess successCallback: ((_ response: Weather) -> Void)?,
                       onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        // concatenate base url with woied of city
        let url = baseURLString + id
        
        APICallManager.shared.createRequest(url,
                                            onSuccess: {(responseWeather: Weather) -> Void in
            successCallback?(responseWeather)
        }, onFailure: {(errorMessage: String) -> Void in
            failureCallback?(errorMessage)
        })
    }
    
}
