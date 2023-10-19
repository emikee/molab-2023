//
//  ItemRow.swift
//

import SwiftUI


struct ItemRow: View {
    var item:ItemModel
    
    @State var uiImage:UIImage?
    
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            ZStack {
                Image(item.urlStr)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100, height: 100)
                if let uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100, height: 100)
                }
            }
            VStack(alignment: .leading, spacing: 8.0) {
                Text(item.title)
                    .fontWeight(.medium)
                Text(item.artist)
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }
        .task {
            uiImage =  await imageFor(string: item.urlStr)
        }
    }
}


