//
//  GetSlotViewModel.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 04/12/23.
//

import Foundation

class GetSlotViewModel {
    
    var getSlotModel: GetSlotModel?
    
    func getSlots(endpoint: String, completion: @escaping Response<GetSlotModel>){
        GetSlotModel.getSlotDetails(endpoint: endpoint) { result in
            switch result {
                
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
