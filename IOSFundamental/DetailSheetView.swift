//
//  DetailSheetView.swift
//  IOSFundamental
//
//  Created by Haris Asrofi on 02/12/22.
//

import SwiftUI

struct DetailSheetView: View {
    @State private var showWebView: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading){
                HStack() {
                    Text("Pink Beach, Flores")
                        .font(.system(size: 22, design: .rounded))
                        .fontWeight(.bold)
                    Spacer()
                    HStack{
                        Image(systemName : "star.fill")
                            .resizable()
                            .frame(width: 30,height: 25)
                            .scaledToFill()
                            .foregroundColor(.yellow)
                        Text("4,8") .font(.system(size: 22, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
                Spacer()
                    .frame(height: 20)
                HStack(){
                    CategoryItemView(title: "Walk", icon: "figure.walk.motion", color: .green)
                    CategoryItemView(title: "Food", icon: "fork.knife.circle.fill", color: .orange)
                    CategoryItemView(title: "Stays", icon: "house.fill", color: .blue)
                    CategoryItemView(title: "Ride", icon: "sailboat.fill", color: .purple)
                }
                Text("About Destination")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.semibold)
                Spacer()
                    .frame(height: 10)
                Text("Pink Beach, or Pantai Merah, as it aptly named, is one of seven pink beaches on the planet.")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.medium)
                Spacer()
                    .frame(height: 20)
                HStack(){
                    Text("$81,39")
                        .font(.system(size: 22, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Spacer()
                    
                    
                    Button{
                        showWebView = true
                    }label: {
                        HStack {
                            Image(systemName: "bag")
                            Text("Join Tour")
                        }
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.indigo, .purple]), startPoint: .trailing, endPoint: .leading)
                        ).cornerRadius(10)
                    }.fullScreenCover(isPresented: $showWebView) {
                        WebView(url: URL(string: "https://github.com/harisasrofi14/iOSCourse")!)
                    }
                }
            }.padding(20)
        }
    }
}

struct DetailSheetView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSheetView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct CategoryItemView: View {
    var title: String
    var icon: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .center, spacing: 8) {
                Image(systemName: icon)
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 24))
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundColor(.black)
            }
            
        } //: HSTACK
        .frame(width: 50, height: 50)
        .padding()
        .cornerRadius(60)
    }
}
