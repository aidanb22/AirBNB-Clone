//
//  ListingDetailView.swift
//  AirBNB
//
//  Created by aidan b on 7/28/24.
//

import SwiftUI
import MapKit


struct ListingDetailView: View {
    
    let listing: Listing
   
    
    
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView{
            // IN ZStacks, the first thing will be placed first and everything else will be put on top of it.
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height:320)
                
                Button {
                    dismiss()
                    
                } label: {
                    Image(systemName:"chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width:32, height: 32)
                        }
                        .padding(32)
                }
                
            }
            
            // LOCATION INFO VIEW
            VStack(alignment:.leading, spacing:8){
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing:2) {
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating)")
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city),\(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // HOST INFO VIEW
            HStack{
                VStack(alignment:.leading, spacing:4){
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width:250, alignment: .leading) //width is because we don't want the text too close to the picture
                    
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) bedrooms -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width:300,alignment: .leading)
                Spacer()
                
                Image("\(listing.ownerImageUl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width:64, height:64)
                    .clipShape(Circle())
                    
            }
            .padding()
            
            Divider()
            
            //LISTING FEATURES
            VStack(alignment: .leading, spacing: 16){
                ForEach(listing.features) { feature in
                    HStack(spacing:12) {
                        Image(systemName:feature.imageName)
                        
                        VStack(alignment:.leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
                
            }
            .padding()
            
            
            Divider()
            
            //BEDROOMS VIEW
            VStack(alignment:.leading, spacing:16){
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){ //horizontal scrolling to view bedrms
                    HStack(spacing:16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack{
                                Image(systemName:"bed.double")
                                
                                Text("Bedroom \(bedroom)") //bedroom is an index, it will start at 1 etc.
                            }
                            .frame(width:132, height:100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth:1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                
                    
            }
            .padding()
            
            Divider()
            
            //LISTING AMENITIES
            VStack(alignment:.leading,spacing:16){
                Text("What this place offers")
                    .font(.headline)

                ForEach(listing.amenities) { amenity in
                    HStack{
                        Image(systemName:amenity.imageName)
                            .frame(width:32)

                        Text(amenity.title)
                            .font(.footnote)

                        Spacer()
                    }
                }
                
            }
            .padding()
            
            
            Divider()
            VStack(alignment: .leading){
                Text("Where you'll be")
                    .font(.headline)

                if #available(iOS 17.0, *) {
                    Map()
                        .frame(height:200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    // Fallback on earlier versions
                }
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom,64)
        .overlay(alignment: .bottom) {
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15-20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label : {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width:140, height:40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView(listing: DeveloperPreview.shared.listings[3])
    }
}
