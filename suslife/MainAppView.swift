
import SwiftUI

struct MainAppView: View {
    @AppStorage("isProfileSetupComplete") private var isProfileSetupComplete: Bool = true
    @State private var showProfile = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.fromRGB(red: 2, green: 89, blue: 57)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
//                        Spacer()
                        
                        Button(action: {
                            showProfile = true
                        }) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .padding()
                        }
                        
                        NavigationLink(destination: SDGView()) {
                            Text("SDGs")
                                .padding(9)
                                .font(.custom("sans", size: 15))
                                .background(Color.fromRGB(red: 114, green: 204, blue: 152))
                                .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                                .cornerRadius(100)
                        }
                        .padding()
                        
                        NavigationLink(destination: StepCounterTestView()) {
                            Image("shoe")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .padding()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding([.leading, .trailing, .top])
                    
                    Spacer()
                    
                    Text("wanna save \nthe world?")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    
                    Text("ask the \n right questions")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 20)
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: ChatbotView()) {
                        Image("chat2")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 120, height: 120)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Link(destination: URL(string: "https://sarahtoninwrites.github.io/sarahtonin/suslife.html")!) {
                        Text("waitlist")
                            .padding(15)
                            .font(.custom("sans", size: 20))
                            .background(Color.fromRGB(red: 114, green: 204, blue: 152))
                            .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                            .cornerRadius(100)
                    }
                    .animation(.easeInOut)

                    .padding(.bottom, 20)
                    
                    Spacer()
                }
            }
            .sheet(isPresented: $showProfile) {
                ProfileView()
            }
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
