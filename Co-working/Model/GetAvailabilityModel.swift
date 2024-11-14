//
//  GetAvailabilityModel.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 04/12/23.
//

import Foundation

struct GetAvailabilityModel: Codable {
    let availability: [Availability]
}

struct Availability: Codable {
    let workspaceName: String
    let workspaceID: Int
    let workspaceActive: Bool

    enum CodingKeys: String, CodingKey {
        case workspaceName = "workspace_name"
        case workspaceID = "workspace_id"
        case workspaceActive = "workspace_active"
    }
}
