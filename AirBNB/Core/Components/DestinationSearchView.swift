//
//  DestinationSearchView.swift
//  AirBNB
//
//  Created by aidan b on 7/31/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0

    
    
    
    var body: some View {
        VStack{
            HStack {
                Button {
                    withAnimation(.easeInOut) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName:"xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
            }
                Spacer()
                
                //only shows clear button if there is text.
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            
            VStack(alignment: .leading){
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation(destination)
                                show.toggle()
                            }
                        
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth:1.0)
                            .foregroundStyle(Color(.systemGray))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                }
            
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.easeInOut){selectedOption = .location}
            }
            
            
            // DATE SELECTION VIEW
            
            VStack(alignment: .leading){
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From",selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To",selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {selectedOption = .dates}
            }
            
            
            
            // NUM GUESTS VIEW
            VStack(alignment: .leading){
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
        
                    } onIncrement: {
                        numGuests += 1
                        
                    } onDecrement: {
                        guard numGuests > 0 else { return}
                        numGuests -= 1
                    }
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {selectedOption = .guests}
            }
            
            Spacer()
        }
    }
}


struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(viewModel: ExploreViewModel(service: ExploreService()), show: .constant(false))
    }
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
