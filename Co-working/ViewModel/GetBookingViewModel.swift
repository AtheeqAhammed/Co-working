//
//  GetBookingViewModel.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 04/12/23.
//

import Foundation

class GetBookingViewModel {
    
    func getBookingDetails(endpoint: String, completion: @escaping Response<Booking>){
        GetBookingModel.getBookingDetails(endpoint: endpoint) { result in
            switch result {
                
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
