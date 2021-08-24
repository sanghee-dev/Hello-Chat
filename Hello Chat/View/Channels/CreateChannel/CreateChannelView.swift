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
            VStack {

                ChannelImageButton
                
                HStack(alignment: .top) {
                    Text("Name:")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.blue)
                    
                    VStack {
                        TextField("Write a channel name", text: $channelName)
                            .font(.system(size: 18))

                        Divider().background(Color(.systemGray4))
                    }
                }
                .frame(width: 240)

            }.padding(.top)
            
            Spacer()
        }
        .onReceive(viewModel.$didCreateChannel, perform: { completed in
            if completed { show.toggle() }
        })
        .navigationBarItems(trailing: CreateChannelButton)
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        channelImage = Image(uiImage: selectedImage)
    }
    
    var ChannelImageButton: some View {
        Button(action: { imagePickerPresented.toggle() }, label: {
            if let channelImage = channelImage {
                channelImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 240)
                    .clipShape(Circle())
            } else {
                Text("Click here!")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: 240, height: 240)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(style: StrokeStyle(lineWidth: 2, dash: [5])))
            }
        })
        .padding(.top, 56)
        .padding(.bottom)
        .sheet(isPresented: $imagePickerPresented,
               onDismiss: loadImage,
               content: { ImagePicker(image: $selectedImage) })
    }
    
    var CreateChannelButton: some View {
        Button(action: { viewModel.createChannel(name: channelName, image: selectedImage) },
               label: { Text("Create").bold() })
        .disabled(channelName.isEmpty)
    }
}

