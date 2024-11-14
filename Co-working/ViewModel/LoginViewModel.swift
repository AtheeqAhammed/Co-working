//
//  LoginViewModel.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import Foundation

class LoginViewModel {
    
    var loginModel: LoginModel?
    
    func loginUser(loginDetails: LoginModel, completion: @escaping ViewModelCallback){
        
//        WebServiceManager.shared.getRequestWithHeadersEndpoint(endpoint: Constants.loginAPI, headers: nil) { error, user in
//            if let loadError =  error{
//                completion (false,loadError)
//                print(loadError)
//            }else if let userData = user{
//                let decoder = JSONDecoder()
//                do {
//                    let loginData  = try decoder.decode(LoginModel.self, from: userData as! Data)
//                    self.loginModel = loginData
//                    completion (true,nil)
//                }
//                catch {
//                    completion (false,"Error while parsing")
//                }
//            }
//        }
//    }
//    
//    
//    func getUserDetails() -> LoginModel {
//        return self.loginModel!
    }
}
