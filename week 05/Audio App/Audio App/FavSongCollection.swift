//
//  FavSongCollection.swift
//  Audio App
//
//  Created by Emily Shen on 10/18/23.
//

import SwiftUI

struct FavSongCollection: View {
    @EnvironmentObject var document:Document
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("DarkBG").ignoresSafeArea()
                List {
                    ForEach(document.items.reversed()) { item in
                        NavigationLink(
                            destination:
                            UpdateImageView(action: "Update",
                                            id: item.id,
                                            urlStr: item.urlStr,
                                            title: item.title,
                                            artist: item.artist,
                                            songUrl: item.songUrl)
                        )
                        {
                            ItemRow(item: item)
                        }
                    }
                }
                .navigationTitle("My Songs")
                .navigationBarItems(
                    trailing:
                        NavigationLink(
                            destination:
                                AddImageView()
                        )
                    {
                        Text("Add Song")
                    }
                )
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("DarkBG")/*@END_MENU_TOKEN@*/)
            }
            }
    }
}

struct FavSongCollection_Previews: PreviewProvider {
    static var previews: some View {
        let model = Document()
        FavSongCollection()
            .environmentObject(model)
    }
}
