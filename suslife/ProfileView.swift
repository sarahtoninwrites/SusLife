////
////  ProfileView.swift
////  suslife
////
////  Created by Sarah Saiyed on 10/07/2024.
////
//
import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isProfileSetupComplete") private var isProfileSetupComplete: Bool = true
    @AppStorage("username") private var username: String = ""
    @AppStorage("email") private var email: String = ""
    @AppStorage("motivation") private var motivation: String = ""
    
    @State private var isEditingUsername = false
    @State private var isEditingEmail = false
    @State private var isEditingMotivation = false
    
    var body: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Home")
                    .padding(9)
                    .font(.custom("sans", size: 15))
                    .background(Color.fromRGB(red: 114, green: 204, blue: 152))
                    .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                    .cornerRadius(100)
            }
            .padding()
            
            Image("suslife") // Replace "suslife" with the name of your image asset
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75) // Adjust the size as needed
                .padding()
            Image("sustxt") // Replace "suslife" with the name of your image asset
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100) // Adjust the size as needed

            Text("this is what you've told us:")
                .font(.title)
                .padding()
            
            // Username Disclosure Group
            DisclosureGroup("\(username)") {
                if isEditingUsername {
                    TextField("Enter your name", text: $username)
                        .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Save") {
                        isEditingUsername = false
                    }
                    .padding()

                } else {
                    Button("Edit") {
                        isEditingUsername = true
                    }
                    .padding()
                }
            }
            .padding()
            .background(Color.fromRGB(red: 114, green: 204, blue: 152))
            .cornerRadius(10)
            .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))

            // Email Disclosure Group
            DisclosureGroup("\(email)") {
                if isEditingEmail {
                    TextField("Enter your email", text: $email)
                        .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))

                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Save") {
                        isEditingEmail = false
                    }
                    .padding()
                } else {
                    Button("Edit") {
                        isEditingEmail = true
                    }
                    .padding()
                }
            }
            .padding()
            .background(Color.fromRGB(red: 114, green: 204, blue: 152))
            .cornerRadius(10)
            .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))

            // Motivation Disclosure Group
            DisclosureGroup("\(motivation)") {
                if isEditingMotivation {
                    TextField("Enter your motivation", text: $motivation)
                        .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Save") {
                        isEditingMotivation = false
                    }
                    .padding()
                } else {
                    Button("Edit") {
                        isEditingMotivation = true
                    }
                    .padding()
                }
            }
            .padding()
            .background(Color.fromRGB(red: 114, green: 204, blue: 152))
            .cornerRadius(10)
            .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))

            Spacer()
            
            Button(action: {
                logout()
            }) {
                Text("Logout")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding() // Add padding to position the logout button correctly
        }
        .animation(.easeInOut)

        .padding()
        .navigationBarHidden(true) // Hide navigation bar if needed
    }
    
    private func logout() {
        isProfileSetupComplete = false
        presentationMode.wrappedValue.dismiss() // Dismiss ProfileView after logout if needed
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//import SwiftUI
//
//struct ProfileView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @AppStorage("isProfileSetupComplete") private var isProfileSetupComplete: Bool = true
//    @AppStorage("username") private var username: String = ""
//    @AppStorage("email") private var email: String = ""
//    @AppStorage("motivation") private var motivation: String = ""
//
//    var body: some View {
//        VStack {
//
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }) {
//                Text("Home")
//                    .padding(9)
//                    .font(.custom("sans", size: 15))
//                    .background(Color.fromRGB(red: 114, green: 204, blue: 152))
//                    .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
//                    .cornerRadius(100)
//            }
//            .padding()
//            Image("suslife") // Replace "suslife" with the name of your image asset
//                .resizable()
//                .scaledToFit()
//                .frame(width: 75, height: 75) // Adjust the size as needed
//                .padding()
//            Image("sustxt") // Replace "suslife" with the name of your image asset
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100) // Adjust the size as needed
//
//            Text("this is what you've tolf us:")
//                .font(.title)
//                .padding()
//
//            Text(" you're \(username), \n we can reach you here (\(email)) and \n \"\(motivation)\" motivates you.")
//                .font(.title2)
//                .padding()
//
////            Text("email: \(email)")
////                .font(.title2)
////                .padding()
////
////            Text("remember: \(motivation)")
////                .font(.title2)
////                .padding()
//
//            Spacer()
//
//            Button(action: {
//                logout()
//            }) {
//                Text("Logout")
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding() // Add padding to position the logout button correctly
//        }
//
//        .navigationBarHidden(true) // Hide navigation bar if needed
//    }
//
//    private func logout() {
//        isProfileSetupComplete = false
//        presentationMode.wrappedValue.dismiss() // Dismiss ProfileView after logout if needed
//    }
//}
//
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
