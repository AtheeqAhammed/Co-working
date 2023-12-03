//
//  ViewModel.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import Foundation
import Alamofire

class CreateAccountViewModel {
    
    private var createAccountModel: AccountCreateModel?
    
    func accountCreate(userDetails: AccountCreateModel, completion: @escaping ViewModelCallback){
        
        var parameters = ["fullName" : userDetails.name, "mobileNumber": userDetails.mobileNumber, "email": userDetails.email]
        
        WebServiceManager.shared.postRequestWithEndpoint(endpoint: Constants.createAccountAPI, parameters: parameters as Parameters, headers: nil) { error, user in
            if let loadError =  error{
                completion (false,loadError)
                print(loadError)
            }else if let userData = user{
                let decoder = JSONDecoder()
                do {
                    let loginData  = try decoder.decode(AccountCreateModel.self, from: userData as! Data)
                    self.createAccountModel = loginData
                    completion (true,nil)
                }
                catch {
                    completion (false,"Error while parsing")
                }
            }
        }
    }
    
    
    
    func getUserDetails() -> AccountCreateModel {
        return self.createAccountModel!
    }
     
}
