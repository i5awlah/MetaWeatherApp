import Foundation

struct Weather: Codable {
    var consolidatedWeather: [ConsolidatedWeather]
    var title: String
    var woeid: Int

    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case title
        case woeid
    }
}
