//
//  ListingItemView.swift
//  AirBNB
//
//  Created by aidan b on 7/27/24.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing:8) {
            //images
            
            ListingImageCarouselView(listing: listing)
                .frame(height:320)
                .clipShape(RoundedRectangle(cornerRadius: 25))
           
            
            
            // listing details
            
            HStack(alignment:.top){
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                     
                
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3-10")
                        .foregroundStyle(.gray)
                    
                    //using the HStack to bold only the 567.
                    HStack(spacing:4){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundColor(.black)

                    
                }
                
                Spacer()
                
                //rating
                HStack(spacing:2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
                
            }
            .background()
            .font(.footnote)
        }
        .padding()
    }
}

struct ListingItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListingItemView(listing: DeveloperPreview.shared.listings[0])
    }
}
