//
//  NetworkManager.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 20/04/2022.
//

import Foundation
import Network

class NetworkManager {
    
    static let monitor = NWPathMonitor()
    
    static func checkConnection(completion: @escaping (Bool) -> ()){
        let queue = DispatchQueue(label: "")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            completion(path.status == .satisfied)
        }
    }
    
}
