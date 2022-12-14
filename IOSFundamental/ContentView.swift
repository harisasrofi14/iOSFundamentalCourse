//
//  ContentView.swift
//  IOSFundamental
//
//  Created by Haris Asrofi on 02/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var currentIndex: Int = 0
    @State var data = cardViews
    
    var body: some View {
        VStack(alignment: .leading){
            Text("What's New in Swift UI?") .font(.system(size: 36, weight: .heavy,design: .rounded))
            
            ZStack {
                ForEach((0..<data.endIndex-1), id: \.self){ index in
                    CardItem(data: $data[currentIndex]).onTapGesture {
                        withAnimation(Animation.spring()) {
                            currentIndex = currentIndex == cardViews.endIndex-1 ? 0 : currentIndex+1
                        }
                    }
                }
                
            }
        }.padding(10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardItem : View{
    @Binding var data : CardView
    var body: some View {
        VStack(alignment: .leading){
            Image(data.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .transition(.scaleAndOffset)
            Spacer()
                .frame(maxHeight: 10)
            VStack(alignment: .leading){
                Text(data.category).font(.system(size: 16, weight: .heavy,design: .rounded))
                Text(data.heading).font(.system(size: 24, weight: .heavy,design: .rounded))
                Text(data.author).font(.system(size: 16, weight: .light,design: .rounded))
                HStack(spacing: 2){
                    ForEach(1...data.rating, id: \.self) { item in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }
                Spacer()
                    .frame(maxHeight: 10)
                Text(data.excerpt).font(.system(size: 16, weight: .light,design: .rounded))
            }
        }
    }
}

extension AnyTransition {
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .center), removal: .offset(x: -500, y: 0).combined(with: .scale).combined(with: .opacity))
    }
}
