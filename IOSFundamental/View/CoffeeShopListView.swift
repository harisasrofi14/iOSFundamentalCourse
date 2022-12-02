//
//  CoffeeShopListView.swift
//  IOSFundamental
//
//  Created by Haris Asrofi on 02/12/22.
//

import SwiftUI

struct CoffeeShopListView: View {
    
    
    @State private var searchText: String = ""
    
    private var searchResult:[Coffeeshop]{
        let result = Coffeeshop.CoffeeshopProvider.all()
        return searchText.isEmpty ? result : result.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    private var suggestionResult: [Coffeeshop] {
        return searchText.isEmpty ? [] : searchResult
    }
    
    var body: some View {
        NavigationStack {
            List(searchResult){ data in
                NavigationLink(destination: {
                    CoffeeShopDetailView(coffeeShopDetail: data)
                }){
                    HStack {
                        Image(data.image)
                            .resizable()
                            .frame(width: 80,height: 80)
                            .scaledToFit()
                            .cornerRadius(10)
                        VStack(alignment: .leading,spacing: 8) {
                            Text(data.name)
                                .font(.title3)
                                .lineLimit(2)
                            Text(data.location)
                                .font(.caption)
                            Text("Rating: 4/5")
                                .font(.caption2)
                        }
                        
                    }
                }
            }
            .navigationTitle("CoffeeShop Finder")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "What are you looking for"
            ){
                ForEach(suggestionResult) { result in
                    Text("Looking for \(result.name)").searchCompletion(result.name)
                }
            }
        }
    }
}

struct CoffeeShopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopListView()
    }
}
