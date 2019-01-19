//
//  BaseService.swift
//  locited
//
//  Created by Innocent Magagula on 1/19/19.
//  Copyright © 2019 Innocent. All rights reserved.
//

import Foundation

class BaseService {
    
    static let baseUrlString = "http://localhost/locited/"
    static let token         = "89642begwe6432"
    static let sessionId     = "**&rehjh&^%$"
    
    class func get<T: Decodable>(pathString: String, completion: @escaping (T) -> ()) {
       
        let urlString = baseUrlString.appending(pathString)
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result)
            }catch let responseError{
                print(responseError)
            }
            
        }.resume()
        
    }
    
    class func post<T: Decodable, U:Encodable>(path: String, data: U, completion: @escaping (T) -> ()){
    }
}
