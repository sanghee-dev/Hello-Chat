//
//  CreateChannelView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/18.
//

import SwiftUI

struct CreateChannelView: View {
    @ObservedObject var viewModel: CreateChannelViewModel
    @Binding var show: Bool
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var channelImage: Image?
    @State private var channelName = ""
    
    init(_ selectableUsers: [SelectableUser], show: Binding<Bool>) {
        self.viewModel = CreateChannelViewModel(selectableUsers)
        self._show = show
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 24) {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    let image = channelImage == nil ? Image(systemName: "plus.circle") : channelImage ?? Image(systemName: "plus.circle")
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .foregroundColor(Color(.systemGray3))
                })
                .sheet(isPresented: $imagePickerPresented,
                       onDismiss: loadImage,
                       content: { ImagePicker(image: $selectedImage) })
                .padding(.leading, 24)
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Enter a name for your channel", text: $channelName)
                        .font(.system(size: 16))
                    
                    Divider()
                    
                    Text("Please provide a channel name and icon")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemGray2))
                }
            }.padding(.top)
            
            Spacer()
        }
        .onReceive(viewModel.$didCreateChannel, perform: { completed in
            if completed {
                show.toggle()
            }
        })
        .navigationBarItems(trailing: CreateChannelButton)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        channelImage = Image(uiImage: selectedImage)
    }
    
    var CreateChannelButton: some View {
        Button(action: {
            viewModel.createChannel(name: channelName, image: selectedImage)
        }, label: {
            Text("Create")
                .bold()
                .disabled(channelName.isEmpty)
        })
    }
}

