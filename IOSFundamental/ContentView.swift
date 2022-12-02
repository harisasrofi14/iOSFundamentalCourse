//
//  ContentView.swift
//  IOSFundamental
//
//  Created by Haris Asrofi on 02/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var ShowingDetailSheet: Bool = false
    @State private var showingAlert: Bool = false
    
    var body: some View {
        ZStack(){
            Color.clear
                .background(
                    Image("Background")
                        .resizable()
                        .overlay {
                            Color.black
                                .opacity(0.3)
                        }
                        .scaledToFill()
                        .ignoresSafeArea()
                )
            VStack(alignment: .leading){
                HStack(){
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName : "cloud.sun.fill")
                            .renderingMode(.original)
                            .frame(width: 35,height: 25)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.2))
                    } .cornerRadius(100)
                        .alert("Not Yet Available",
                               isPresented: $showingAlert) {
                            Button {} label: {
                                Text("Ok".uppercased())
                            }
                        } message: {
                            Text("Currently on active development")
                        }
                    Spacer()
                    Text("Travel")
                        .foregroundColor(.white).font(.title3)
                    Spacer()
                    Button{
                        ShowingDetailSheet = true
                    }label: {
                        Image(systemName : "cart.badge.plus").renderingMode(.original)
                            .resizable()
                            .frame(width: 25,height: 20)
                            .padding(10)
                            .background(Color.black.opacity(0.2))
                            .foregroundColor(.white)
                    }.cornerRadius(100).sheet(isPresented: $ShowingDetailSheet) {
                        DetailSheetView()
                            .presentationDetents([.fraction(0.50), .fraction(0.60)])
                            .presentationDragIndicator(.visible)
                    }
                    
                }
                Spacer()
                    .frame(maxHeight: 40)
                
                Text("Start your Adventure and Go Travel Now")
                    .font(.system(size: 56, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                    .frame(maxHeight: 20)
                
                Text("Discover local destinations beauty with Bluesky and travel with pride")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
            }.padding(30)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
