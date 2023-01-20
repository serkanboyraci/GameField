//
//  NetworkManager.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 19.01.2023.
//

import Foundation

class NetworkManager {
    let shared = NetworkManager()
    
    private init(){}
    
    //MARK: - GET Request
    private class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, URLSessionDataTaskError?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, URLSessionDataTaskError.noData)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                print(error.localizedDescription)
                completion(nil,URLSessionDataTaskError.dataParseError)
            }
        }
        task.resume()
        return task
    }
}

//MARK: - URLSessionDataTaskError
enum URLSessionDataTaskError: Error {
    case noData
    case dataParseError
}

extension NetworkManager {
    func getAllGames(queryItems: [URLQueryItem], completion: @escaping(Result<[Game],Error>) -> Void){
        let url = Endpoint.getAllGames(queryItems: queryItems).url
        NetworkManager.taskForGETRequest(url: url, responseType: GameResponseModel.self) { response, error in
            guard let response = response else {
                completion(.failure(error!))
                print(error!.localizedDescription)
                return
            }
            completion(.success(response.results))
        }
    }
    
    
    func getGameDetails(by id: Int, completion: @escaping(Result<GameDetail,Error>) -> Void){
        let url = Endpoint.getGameDetails(withID: id.toString()).url
        NetworkManager.taskForGETRequest(url: url, responseType: GameDetail.self) { response, error in
            guard let response else {
                completion(.failure(error!))
                return
            }
            completion(.success(response))
        }
    }
    
}


