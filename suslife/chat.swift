//
//  chat.swift
//  suslife
//
//  Created by Sarah Saiyed on 28/06/2024.
//

//import Foundation
//import SwiftUI
//
//struct ChatView: View {
//    @State private var userInput = ""
//    @State private var messages: [String] = []
//    private let chatbotService = ChatbotService()
//    
//    var body: some View {
//        VStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 10) {
//                    ForEach(messages, id: \.self) { message in
//                        Text(message)
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            .frame(maxWidth: .infinity, alignment: message.hasPrefix("You: ") ? .trailing : .leading)
//                    }
//                }
//                .padding()
//            }
//            
//            HStack {
//                TextField("Ask a question...", text: $userInput)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.horizontal)
//                
//                Button(action: {
//                    sendMessage()
//                }) {
//                    Text("Send")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//        .navigationBarTitle("Sustainable Chatbot")
//    }
//    
//    private func sendMessage() {
//        guard !userInput.isEmpty else { return }
//        let message = "You: \(userInput)"
//        messages.append(message)
//        
//        chatbotService.getResponse(for: userInput) { response in
//            DispatchQueue.main.async {
//                messages.append("Bot: \(response)")
//                userInput = ""
//            }
//        }
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
