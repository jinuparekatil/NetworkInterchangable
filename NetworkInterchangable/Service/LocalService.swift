//
//  LocalService.swift
//  NetworkInterchangable
//
//  Created by Jinu on 17/11/2023.
//

import Foundation

class LocalService : NetworkService{
    var type : String = "localservice"

    
    func download(_ resource : String) async throws-> [User]{
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else{
            fatalError("Resource not found")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
        }
}
