//
//  GetSlotModel.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 04/12/23.
//

import Foundation

struct GetSlotModel: Codable {
    let slots: [Slot]
}

struct Slot: Codable {
    let slotName: String
    let slotID: Int
    let slotActive: Bool
    
    enum CodingKeys: String, CodingKey {
        case slotName = "slot_name"
        case slotID = "slot_id"
        case slotActive = "slot_active"
    }
}


extension GetSlotModel {
    static func getSlotDetails(endpoint: String, completion: @escaping Response<GetSlotModel>) {
        WebServiceManager.shared.getRequestWithHeadersEndpoint(endpoint: endpoint, headers: nil, onFinished: completion)
    }
}
