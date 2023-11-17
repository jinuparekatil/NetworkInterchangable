//
//  Webservice.swift
//  NetworkInterchangable
//
//  Created by Jinu on 17/11/2023.
//

import Foundation

class Webservice : NetworkService{
    var type : String = "webservice"
    
    enum NetworkError: Error{
        case invalidUrl
        case invalidServiceResponse
        
    }
    
    func download(_ resource : String) async throws-> [User]{
        guard let url = URL(string: resource) else{
            throw NetworkError.invalidUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else{
                throw NetworkError.invalidServiceResponse
            }
        return try JSONDecoder().decode([User].self, from: data)
        }
        
    }

