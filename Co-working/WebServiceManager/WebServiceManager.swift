//
//  WebServiceManager.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import Foundation
import Alamofire

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
    
    
    func getRequestWithHeadersEndpoint(endpoint : String ,headers : HTTPHeaders?,onFinished: @escaping ( _ error:String?,  _ user: Any?) -> ())  {
        print(endpoint)
        
        AF.request(endpoint, method: .get,  parameters: nil, encoding: JSONEncoding.default,headers: headers)
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success:
                    //  print(response)
                    if let result = response.data {
                        onFinished(nil, result)
                    }else{
                        onFinished("Something went wrong", nil)
                    }
                    break
                case .failure(let error):
                    onFinished("Something went wrong", nil)
                    print(error)
                }
            }
    }
}
