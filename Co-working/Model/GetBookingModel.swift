//
//  GetBookingModel.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 04/12/23.
//

import Foundation

struct GetBookingModel: Codable {
    let bookings: [Booking]?
}

struct Booking: Codable {
    let workspaceName: String?
    let workspaceID: Int?
    let bookingDate: String?

    enum CodingKeys: String, CodingKey {
        case workspaceName = "workspace_name"
        case workspaceID = "workspace_id"
        case bookingDate = "booking_date"
    }
}


extension GetBookingModel {
    static func getBookingDetails(endpoint: String, completion: @escaping Response<Booking>){
        WebServiceManager.shared.getRequestWithHeadersEndpoint(endpoint: endpoint, headers: nil, onFinished: completion)
    }
}
