//
//  SearchBar.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 32)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(8)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(.systemGray2))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                )
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                })
                .padding(.trailing, 8)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(false))
    }
}
