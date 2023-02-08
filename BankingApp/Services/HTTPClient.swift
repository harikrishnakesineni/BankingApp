//
//  URL+Service.swift
//  BankingApp
//
//  Created by Hari krishna on 12/01/23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidResponse
    case decodingError
    case invalidServerResponse
    case invalidUrl
}

enum HTTPMethod {
    case get ([URLQueryItem])
    case post (Data?)
    case put (Data?)
    case delete
    var name: String {
        switch self {
            
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var headers: [String: String] = [:]
    var method: HTTPMethod = .get([])
}

class HTTPClient {
    
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)
        request.allHTTPHeaderFields = resource.headers
        request.httpMethod = resource.method.name
        
        switch resource.method {
            
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: true)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                throw NetworkError.badUrl
            }
            request.url = url
            
        case .post(let data):
            request.httpBody = data
        case .put(let data):
            request.httpBody = data
        case .delete:
            break
        }
        
        let configuaration = URLSessionConfiguration.default
        configuaration.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        let session = URLSession(configuration: configuaration)
        let (data, response) = try await session.data(for: request)
        guard(response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return result 
    }
    
}
