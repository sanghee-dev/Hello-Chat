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
    @ObservedObject var viewModel = SelectGroupMembersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, isEditing: .constant(false))
                    .padding()
                
                if !viewModel.selectedUsers.isEmpty {
                    SelectedMembersView(viewModel: viewModel)
                }
                            
                ScrollView {
                    VStack(spacing: 1) {
                        ForEach(viewModel.selectableUsers) { selectableUser in
                            Button(action: {
                                viewModel.selectUser(selectableUser, isSelected: !selectableUser.isSelected)
                            }, label: {
                                SelectableUserCell(viewModel: SelectableUserCellViewModel(selectableUser: selectableUser))
                            })
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
