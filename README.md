# Hello Chat 💬

Hello Chat is a real time chat service!


# Skills

- Swift
- SwiftUI
- MVVM Pattern
- Firestore


# Features

## 0. View

- If an error occurs while fetching data, alert is shown.
- View extension that detects an error in the view model and show it with alert.
- Applied to all views that may cause errors.


## 1. Authentication

### Login, create an account

- User can login with email or create an account.
- When the text field is valid, The button is activated.
- Show activity indicator in a button when fetching data.

<img src="https://user-images.githubusercontent.com/61302874/130648708-130659c0-804f-4ed4-8a49-bfb45ff4f13d.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130648785-f4c59189-edc4-43ab-956c-557eed352228.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130648821-9cf4ce75-2311-4930-bc19-a26d63b1d31a.png" width="300" >

<img src="https://user-images.githubusercontent.com/61302874/130648908-7150f201-8f6e-44ca-94db-70c7d3eb15f0.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130648949-37f67d81-7d4f-409e-bd96-a48dc0255c54.png" width="300" >


### Reset password

- If user forgot password, user can reset password with email.

<img src="https://user-images.githubusercontent.com/61302874/130649142-85a27b63-f47c-4056-b229-f53ebf230596.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130649178-e2fa12b3-0e89-4e66-ab2e-9e35532b7b4f.png" width="300" >


## Profile picture

- Set a profile picture when creating an account.
- Add username to the guide text on the screen.
- Photos in the device are displayed on image picker.
- When user select photo, the photo is displayed and continue button is activated.

<img src="https://user-images.githubusercontent.com/61302874/130649273-d30e25fd-a239-4bdc-958d-265f7eab8f31.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130649318-c3828816-880e-4aa7-857d-72a96f8dd216.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130649361-ea5e1c22-46d1-446f-bd5c-96e6b08507fb.png" width="300" >


## 2. Chats

- Display the latest message next to the chat user.
- Select a user and move to that user's chat room.
- If chat partner is not in the chats screen, you can select it from the user list
- You can find users by searching their names in the user list.
- You can chat in real time in the chat screen.

<img src="https://user-images.githubusercontent.com/61302874/130649644-264807b2-9135-448d-a1cc-8691dc4a58eb.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130649660-6f438fa8-3bb3-4ac7-98c8-dc6b65dd4a71.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130649665-6f3401b1-b51f-4731-9f05-ef34e5135ccf.png" width="300" >

<img src="https://user-images.githubusercontent.com/61302874/130649675-9517b044-51c5-4b73-b6df-be0aab1f45bd.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130649688-91b2f9d5-ef9e-4653-ae96-b925f82109a2.png" width="300" >


## 3. Channels

### Create Channel

- You can select channel users.
- You can set channel image and name and create a channel.
- In channels, names are displayed to distinguish chat users.

<img src="https://user-images.githubusercontent.com/61302874/130650176-21886a1c-5af4-45f9-a1a9-297a394694c0.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650194-0f25e637-6d44-4eee-a038-83ab4bb526f8.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650204-8cce14c0-a3c2-4854-b7f4-04e3b9ea8795.png" width="300" >

<img src="https://user-images.githubusercontent.com/61302874/130650216-b97715db-b1d6-48d7-8f0e-e17717d5dd1f.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650224-62b5c091-4280-4ba5-ad2f-90e6a2ad5725.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650235-7e91ceec-c01f-4553-90fa-90687cfe66db.png" width="300" >


### Channel List

- The total number of users is displayed next to the channel name.
- Displays the latest message with the sender's name from the channel list.
- You can leave the channel by pressing the exit button.

<img src="https://user-images.githubusercontent.com/61302874/130650301-efa8f8e7-7ebb-4ce8-a741-6b2e44987c2f.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650318-3208a840-add5-40c6-b597-364b9cebd4b3.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650327-ee5f2e23-d8fd-4ed2-8792-c7aa59d5c5e3.png" width="300" >


## 4. Chat room

### Chat room

- Chat is updated in a real time.

### Chat bubble

- Current user's chat bubble is displayed as a blue speech bubble on the right.
- Display profile picture when user is not current user.
- In channels, username is displayed.
- If you start chatting, the chat bubble will have a tail.
- There is no bubble tail when chat continues.
- If the text of the message is one emoji, the message is displayed in a large size.

### Chat screen

- At the top of the chat screen there is a button that scrolls to the bottom.
- When there is a message, send button is activated.
- When start writing a message in the input field or send a message, view scrolls down. It does not scroll while writing a message.

<img src="https://user-images.githubusercontent.com/61302874/130650793-c9c3a585-96ef-46c8-ae1d-97f560eb9ecc.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650811-2e509a41-1b13-4bd8-8173-6ade865eb942.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650820-074ee911-bd03-48b6-9296-93fb67f9deee.png" width="300" >

<img src="https://user-images.githubusercontent.com/61302874/130650826-b16327ee-e4c9-4d8f-a987-1c692bc98b23.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650835-cf296c1a-a012-48d7-a4cd-5abab150c12d.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650847-364b006c-264b-4299-b20d-299dcaf7a9b7.png" width="300" >


## 5. Settings

### Settings

- Edit profile image, name, and status by clicking profile.
- Click on the image or Write a new name.
- A check mark is displayed to the right of the selected status in the list.
- When profile is changed, Done button is created on the navigation bar.
- Click the Done button to complete editing.

<img src="https://user-images.githubusercontent.com/61302874/130650974-3773d1c3-46ae-44c0-a83f-53029a657c72.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650987-93161ea3-107f-41e5-98a2-d7a944b8caf6.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130650992-7afe63fe-5ee3-43f4-8ad3-1d43990f5ad5.png" width="300" >

<img src="https://user-images.githubusercontent.com/61302874/130651002-20a1f50f-44b9-4acc-b2eb-f8457dfebd0e.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130651014-3b28c4ef-d9a0-4a3a-8576-f25ff1a93840.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130651019-e188c2a6-e110-4563-82d0-5cd15a0d33a0.png" width="300" >


### Log out

- If the user wants to log out, ask once.

<img src="https://user-images.githubusercontent.com/61302874/130651098-19a4e5a1-582e-4e38-ab3c-f75651201ed9.png" width="300" align="left" >
<img src="https://user-images.githubusercontent.com/61302874/130651103-e6247116-d88f-4c3c-842e-db23654e9257.png" width="300" >


