//
//  CoffeeShopListView.swift
//  IOSFundamental
//
//  Created by Haris Asrofi on 02/12/22.
//

import SwiftUI
import ActivityView


struct CoffeeShopListView: View {
    
    @State var coffeeshop = dummyCoffeeshop
    
    var body: some View {
        NavigationStack {
            List(){
                ForEach(coffeeshop){
                    result in
                    ZStack(alignment: .leading){
                        NavigationLink(destination: {
                            CoffeeShopDetailView(coffeeShopDetail: result)
                        }){
                            EmptyView()
                        }.opacity(0)
                        CoffeeshopRow(data: result)
                    } //: ZStack
                }.onDelete(){
                    indexSet in
                    coffeeshop.remove(atOffsets: indexSet)
                }
            }
        }
    }
    
    struct CoffeeshopRow: View {
        @State var data : Coffeeshop
        @State private var item : ActivityItem?
        @State private var showingAlert: Bool = false
        
        var body: some View {
            HStack{
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
                    
                    Image(systemName: data.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15,height: 15)
                    
                }
                
            } //:HSTACK
            .swipeActions(edge: .leading, allowsFullSwipe: false){
                Button{
                    data.isFavorite.toggle()
                } label: {
                    Image(systemName: "heart")
                }.tint(.green)
                
                Button{
                    item = ActivityItem(items: data.name)
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }.tint(.indigo)
            }.contextMenu{
                Button{
                    showingAlert = true
                } label: {
                    HStack{
                        Text("Pin this location")
                        Image(systemName: "pin")
                    }
                }
                Button{
                    item = ActivityItem(items: data.name)
                } label: {
                    HStack{
                        Text("Share")
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                Button{
                    data.isFavorite.toggle()
                } label: {
                    HStack{
                        Text( data.isFavorite ? "Remove from favorite" : "Mark as favorite")
                        Image(systemName: "heart")
                    }
                }
            }.activitySheet($item)
                .alert("Not Yet Available",
                       isPresented: $showingAlert) {
                    Button {} label: {
                        Text("Ok".uppercased())
                    }
                } message: {
                    Text("Currently on active development")
                }
        }
    }
}

struct CoffeeShopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopListView()
    }
}
