import Foundation
import Alamofire

class APICallManager {
    static let shared = APICallManager()

    func createRequest(
        _ url: String,
        onSuccess successCallback: ((Weather) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
    ) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let weatherResponse = try JSONDecoder().decode(Weather.self, from: data)
                    successCallback?(weatherResponse)
                } catch {
                    failureCallback?("City not found")
                }
            case .failure(let error):
                if let callback = failureCallback {
                    callback(error.localizedDescription)
                }
            }
        }
    }
    
}
