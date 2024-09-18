//
//  DeveloperPreview.swift
//  AirBNB
//
//  Created by aidan b on 8/3/24.
//

import Foundation


class DeveloperPreview {
    static let shared = DeveloperPreview()
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: 43.438,
            imageURLs: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn,.superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: 43.438,
            imageURLs: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Beach House",
            rating: 4.86,
            features: [.selfCheckIn,.superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
            ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Steve Johnson",
            ownerImageUl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: 43.438,
            imageURLs: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn,.superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
            ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Harry Styles",
            ownerImageUl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: 43.438,
            imageURLs: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main St",
            city: "Los Angeles",
            state: "California",
            title: "Beautiful LA home in Malibu",
            rating: 4.86,
            features: [.selfCheckIn,.superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
            ),
    
    ]
    
}
