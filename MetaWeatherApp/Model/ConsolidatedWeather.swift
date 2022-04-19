import Foundation

struct ConsolidatedWeather: Codable {
    let weatherStateName, weatherStateAbbr, created: String
    let applicableDate: String
    var minTemp, maxTemp, theTemp: Double
    let windSpeed: Double
    let airPressure: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case created
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case airPressure = "air_pressure"
        case humidity
    }
}
