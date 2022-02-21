//
//  DataRequest.swift
//  WeatherEverywhere
//
//  Created by Adam Rafiandri on 02/21/22.
//

import Foundation
import CoreLocation

enum GetDataRequest<Type> {
    case success([Type])
    case failure
}

struct DataRequest<Type> where Type: Decodable {
    let baseURL = "https://explorecalifornia.org/api/weather/city/"
    let dataURL: URL
    
    init(city: String) {
        let dataPathString = (baseURL + city).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        guard let dataURL = URL(string: dataPathString) else {
            fatalError()
        }
        
        self.dataURL = dataURL
    }
    
    func getData(completion: @escaping (GetDataRequest<Type>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: dataURL) { data, response, error in
            guard let jsonData = data else {
                completion(.failure)
                return
            }
            
            do {
                let resources = try JSONDecoder().decode([Type].self, from: jsonData)
                completion(.success(resources))
            } catch {
                completion(.failure)
            }
        }
        
        dataTask.resume()
    }
}
