//
//  ExploreService.swift
//  AirBNB
//
//  Created by aidan b on 8/3/24.
//

import Foundation


class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
