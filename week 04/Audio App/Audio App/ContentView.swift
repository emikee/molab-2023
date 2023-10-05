//
//  ContentView.swift
//  Audio App
//
//  Created by Emily Shen on 10/4/23.
//

import SwiftUI


struct ContentView: View {
    @State private var navPath = NavigationPath()
    let selections: [String: Any] = ["My Favorite Song": PlayFavSong(), "Study Break": PlayCoffeeShop()]
    var body: some View {
        ZStack {
            Color("DarkBG")
                .ignoresSafeArea()
                .overlay(
                    NavigationStack(path: $navPath) {
                        VStack(alignment: .center) {
                            NavigationLink (destination: PlayFavSong()) {
                                Text("My Favorite Song")
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.631, saturation: 0.678, brightness: 0.599)/*@END_MENU_TOKEN@*/)
                            .hoverEffect(/*@START_MENU_TOKEN@*/.lift/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity)
                            NavigationLink (destination: PlayCoffeeShop()) {
                                Text("Study Break")
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.631, saturation: 0.678, brightness: 0.599)/*@END_MENU_TOKEN@*/)
                            .hoverEffect(/*@START_MENU_TOKEN@*/.lift/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity)
                            
                        }
                        .navigationTitle("Emily's Space")
                        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.631, saturation: 0.138, brightness: 0.927)/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        }
                )
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
