import SwiftUI

struct ProfileSetUp: View {
    
    @AppStorage("isProfileSetupComplete") private var isProfileSetupComplete: Bool = false
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var motivation: String = ""
    
    @State private var currentStep: Int = 0
    
    @State private var navigateToMainPage = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.fromRGB(red: 175, green: 242, blue: 209)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Image("suslife") // Replace "suslife" with the name of your image asset
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100) // Adjust the size as needed
                            .padding()
                        Image("sustxt") // Replace "suslife" with the name of your image asset
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200) // Adjust the size as needed
                            .padding()
                        
                        if currentStep == 0 {
                            Text("welcome, \n let's get to know you\n\n\n\n\n")
                                .font(.title2)
                                .transition(.opacity)
                            Text("what's your name?")
                                .font(.title3)
                                .transition(.opacity)
                            TextField("go on, dont be shy ;)", text: $username, onCommit: nextStep)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .transition(.opacity)
                        } else if currentStep == 1 {
                            Text("welcome to suslife, \n let's get to know you\n\n\n\n\n")
                                .font(.title2)
                                .transition(.opacity)
                            Text("where can we reach you? (Email)")
                                .font(.title3)
                                .transition(.opacity)
                            TextField("promise not to spam hehe", text: $email, onCommit: nextStep)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .transition(.opacity)
                        } else if currentStep == 2 {
                            Text("welcome to suslife, \n let's get to know you\n\n\n\n\n")
                                .font(.title2)
                                .transition(.opacity)
                            Text("what motivates you?")
                                .font(.title3)
                                .transition(.opacity)
                            TextField("we'll remind u dw", text: $motivation, onCommit: nextStep)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .transition(.opacity)
                        }
                        
                        if currentStep > 2 {
                            Button(action: {
                                navigateToMainPage = true
                            }) {
                                Text("Plant")
                                    .padding(10)
                                    .background(Color.fromRGB(red: 114, green: 204, blue: 152))
                                    .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                                    .cornerRadius(8)
                                    .transition(.opacity)
                            }
                            .padding()
                        }
                    }
                    .animation(.easeInOut)
                    
                    Spacer()
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                
                // NavigationLink to MainAppView
                NavigationLink(destination: MainAppView(), isActive: $navigateToMainPage) {
                    EmptyView()
                }
            }
        }
    }
    
    private func nextStep() {
        withAnimation {
            if currentStep == 0 {
                if username.isEmpty {
                    alertMessage = "Username is required."
                    showAlert = true
                    return
                }
            } else if currentStep == 1 {
                if email.isEmpty || !isValidEmail(email) {
                    alertMessage = email.isEmpty ? "Email is required." : "Invalid email format."
                    showAlert = true
                    return
                }
            } else if currentStep == 2 {
                if motivation.isEmpty {
                    alertMessage = "Motivation is required."
                    showAlert = true
                    return
                }
                saveUserProfile()
            }
            currentStep += 1
        }
    }
    
    private func saveUserProfile() {
        // Save the user profile data (e.g., username, email, motivation) to UserDefaults or a database
        // For simplicity, we use UserDefaults here
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(motivation, forKey: "motivation") // Save motivation
        
        // Mark profile setup as complete
        isProfileSetupComplete = true

        // Navigate to the main page
        navigateToMainPage = true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct ProfileSetUp_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetUp()
    }
}
