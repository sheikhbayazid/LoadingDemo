//
//  ContentView.swift
//  LoadingDemo
//
//  Created by Sheikh Bayazid on 3/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                //Color.yellow.ignoresSafeArea()
                
                VStack {
                    Text("Content")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .shadow(radius: 10)
                }.frame(width: 350, height: 500)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                .shadow(radius: 10)
                
                
                if isLoading {
                    ZStack {
                        Color.white.opacity(0.5).ignoresSafeArea()
                        
                        VStack(spacing: 5) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            Text("Loading...")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                    }//.frame(width: 100, height: 55)
                    //.clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
            }.onAppear(perform: starFakeNNetworkCall)
            .navigationTitle("Loading Test")
        }
    }
    
    func starFakeNNetworkCall() {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.25)) {
                self.isLoading = false
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
