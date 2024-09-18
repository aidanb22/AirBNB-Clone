//
//  ExploreView.swift
//  AirBNB
//
//  Created by aidan b on 7/27/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack{
            
            
            if showDestinationSearchView {
                DestinationSearchView(viewModel: viewModel, show: $showDestinationSearchView)
            } else {
            ScrollView{
                SearchAndFilterBar()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showDestinationSearchView.toggle()
                        }
                    }
                LazyVStack(spacing: 32){
                    ForEach(viewModel.listings) { listing in
                        NavigationLink(value: listing) {
                            ListingItemView(listing: listing)
                                .frame(height:400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing:listing)
                        .navigationBarBackButtonHidden()
                }
            }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
