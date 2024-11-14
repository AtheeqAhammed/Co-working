//
//  WebServiceManager.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import Foundation
import Alamofire

typealias Response<T: Codable> = (Result<T, Error>) -> Void
typealias ViewModelCallback = (_ success:Bool,_ error:String?) -> Void

class WebServiceManager {
    static let shared = WebServiceManager()
    private init(){}
    
    func postRequestWithEndpoint(endpoint : String, parameters : Parameters? ,headers : HTTPHeaders?, onFinished: @escaping ( _ error:String?,  _ user: Any?) -> ())  {

        if  endpoint == Constants.createAccountAPI {
            print("POST REQUEST:\(String(describing: parameters))")
        }
                AF.request(endpoint, method: .post,  parameters: parameters, encoding: JSONEncoding.default,headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    // print(response)
                    if let result = response.data {
                        onFinished(nil, result)
                    }else{
                        onFinished("Something went wrong", nil )
                    }
                    break
                case .failure(let error):
                    onFinished(error.localizedDescription, nil)
                    print(error)
                }
                
            }
    }
    
    
    func getRequestWithHeadersEndpoint<T: Codable>(endpoint: String, headers: HTTPHeaders?,
        onFinished: @escaping Response<T>)  {
        let url = endpoint
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .get,  parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success:
                    if let result = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let data = try decoder.decode(T.self, from: result)
                            onFinished(.success(data))
                        }
                        catch {
                            onFinished(.failure(error))
                            debugPrint("Failed to decode")
                        }
                    } else {
                        if let error = response.error {
                            onFinished(.failure(error))
                        } else {
                            let error = NSError(domain: "", code: 500, userInfo: [ NSLocalizedDescriptionKey: "Something went wrong"])
                            onFinished(.failure(error))
                            debugPrint(error)
                        }
                    }
                    break
                case .failure(let error):
                    onFinished(.failure(error))
                    debugPrint(error)
                }
            }
        }
}

