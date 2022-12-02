//
//  CoffeeShopDetailView.swift
//  IOSFundamental
//
//  Created by Haris Asrofi on 02/12/22.
//

import SwiftUI

struct CoffeeShopDetailView: View {
    
    let coffeeShopDetail : Coffeeshop
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow, .orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(){
                Image(coffeeShopDetail.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(Circle())
                    .overlay {
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .renderingMode(.original)
                            .foregroundColor(.blue)
                    }
                Text(coffeeShopDetail.name)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(8)
                HStack{
                    Image(systemName: "location.circle")
                        .foregroundColor(.black)
                    Text(coffeeShopDetail.location).padding(8)
                }
                
                Text(coffeeShopDetail.review).padding(8)
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct CoffeeShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopDetailView(coffeeShopDetail:   Coffeeshop(image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class")
        )
    }
}
