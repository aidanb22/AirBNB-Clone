//
//  ListingImageCarouselView.swift
//  AirBNB
//
//  Created by aidan b on 7/28/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    
    let listing: Listing

    var body: some View {
        TabView{
            ForEach(listing.imageURLs, id: \.self) { image in
               Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

struct ListingImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
    }
}
