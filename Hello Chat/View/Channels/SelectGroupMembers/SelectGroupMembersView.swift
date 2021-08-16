//
//  CreateGroupView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI

struct SelectGroupMembersView: View {
    @Environment(\.presentationMode) var mode
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, isEditing: .constant(false))
                    .padding()
                
                SelectedMembers()
                            
                ScrollView {
                    VStack(spacing: 1) {
                        ForEach(0...8, id: \.self) { _ in
                            GroupMemberCell(user: MOCK_USER)
                        }
                    }
                }
            }
            .navigationBarItems(leading: CancelButton,
                                trailing: NextButton)
            .navigationBarTitle("New Group")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var NextButton: some View {
        NavigationLink(
            destination: Text("Next"),
            label: { Text("Next").bold() })
    }
    
    var CancelButton: some View {
        Button(action: { mode.wrappedValue.dismiss() },
               label: { Text("Cancel") })
    }
}

struct SelectGroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGroupMembersView()
    }
}
