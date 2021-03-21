//
//  GenericBasicService.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import Foundation
import Alamofire

class GenericBasicService {
    
    public let basicURL = "https://restcountries-v1.p.rapidapi.com/"
    
    private let headers = HTTPHeaders(["x-rapidapi-key" : "c220045095msh0e500381f036195p1a352djsnb2b4a91b96e3",
                                       "x-rapidapi-host": "restcountries-v1.p.rapidapi.com"])
    
    
    ///Generic func to consume service with metod GET and  codable
    func get < T : Codable >(url: String, expectedResponse: T.Type, completionHandler: @escaping (Result< T, GenericErrorService >) -> Void) {
        AF.request(url, method: .get,headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(_ ):
                guard let responseData = response.data else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.parseJSONError))
                    }
                    return
                }
                
                do {
                    let object = try JSONDecoder().decode(expectedResponse, from: responseData)
                    DispatchQueue.main.async {
                        completionHandler(.success(object))
                    }
                }catch (let error){
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        completionHandler(.failure(.parseJSONError))
                    }
                    
                }
               
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    completionHandler(.failure(.serviceError))
                }
            }
        }
    }
    
    ///Generic func to download image from url
    func getImage(url: String, completionHandler: @escaping (Result<UIImage,GenericErrorService>) -> Void) {
        AF.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                let image = UIImage(data: data) ?? UIImage()
                DispatchQueue.main.async {
                    completionHandler(.success(image))
                }
            case .failure(_):
                DispatchQueue.main.async {
                    completionHandler(.failure(.serviceError))
                }
            }
        }
    }
}

/// Enum to service management  errors
enum GenericErrorService: Error {
    case parseJSONError
    case serviceError
    
    
    var errorDescription: String {
        get{
            switch self {
            case .parseJSONError:
                return "We could not parse the response."
            case .serviceError:
                return "We could not connect with the server."
            }
        }
    }
}
