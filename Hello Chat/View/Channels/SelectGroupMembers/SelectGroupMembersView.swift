//
//  CreateGroupView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI

struct SelectGroupMembersView: View {
    @ObservedObject var viewModel = SelectGroupMembersViewModel()
    @Environment(\.presentationMode) var mode
    @Binding var show: Bool
    @State private var searchText = ""
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .onTapGesture { isEditing.toggle() }
                    .padding()
                
                if !viewModel.selectedUsers.isEmpty {
                    SelectedMembersView(viewModel: viewModel)
                }
                            
                ScrollView {
                    VStack(spacing: 1) {
                        ForEach(
                            searchText.isEmpty ? viewModel.selectableUsers :
                                viewModel.filteredUsers(searchText)) { selectableUser in
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
            destination: CreateChannelView(viewModel.selectedUsers, show: $show),
            label: { Text("Next").bold() })
    }
    
    var CancelButton: some View {
        Button(action: { mode.wrappedValue.dismiss() },
               label: { Text("Cancel") })
    }
}
