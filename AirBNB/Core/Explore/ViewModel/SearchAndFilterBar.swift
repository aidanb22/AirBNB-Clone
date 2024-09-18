//
//  SearchAndFilterBar.swift
//  AirBNB
//
//  Created by aidan b on 7/28/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack(){
            Image(systemName:"magnifyingglass")
            
            VStack(alignment: .leading){
                Text("Where to?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Anywhere - Any Week - Add Guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Button(action:{}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10) //gives the capsule nice spacing
        .overlay {
            Capsule()
                .stroke(lineWidth:0.5)
                .foregroundStyle(.gray)
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()

    }
}

struct SearchAndFilterBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFilterBar()
    }
}
