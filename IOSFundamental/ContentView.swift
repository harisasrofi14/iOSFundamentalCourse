//
//  ContentView.swift
//  IOSFundamental
//
//  Created by Haris Asrofi on 02/12/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            DotLoading()
            Spacer().frame(maxHeight: 20 )
            ButtonMic()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DotLoading: View {
    @State var isDotLoading = false
    var body: some View {
        HStack{
            ForEach(0...4, id: \.self){
                item in Circle()
                    .frame(width: 10,height: 10)
                    .foregroundStyle(.green)
                    .scaleEffect(isDotLoading ? 0:1)
                    .animation(.linear(duration: 0.6).repeatForever().delay(0.3 * Double(item)), value: isDotLoading)
            }.onAppear{
                isDotLoading = true
            }
        }
    }
}

struct ButtonMic: View {
    @State var isStop = false
    @State var isPlay = false
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: isStop ? 30 : 5)
                    .frame(width: isStop ? 60 : 250, height:60)
                    .foregroundStyle(isStop ? Color.blue.gradient : Color.purple.gradient)
                    .overlay{
                        Image(systemName: "mic.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .scaleEffect(isPlay ? 0.7 : 1)
                    }
                RoundedRectangle(cornerRadius: isStop ? 35 :10 )
                    .trim(from: 0,to: isStop ? 0.0001 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: isStop ? 70 : 260, height: 70)
                    .foregroundColor(.purple)
                
                
            }.onTapGesture {
                withAnimation(Animation.spring()){
                    isStop.toggle()
                }
                withAnimation(Animation.spring().repeatForever().delay(0.5)){
                    
                    isPlay.toggle()
                }
            }
            Text("Recording...")
                .opacity( isPlay ? 0 : 1)
                .opacity(isStop ? 1 : 0)
                .onAppear{
                    withAnimation(Animation.spring().repeatForever().delay(0.5)){}
                }
        }
    }
}

