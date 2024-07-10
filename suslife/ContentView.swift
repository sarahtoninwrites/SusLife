
import SwiftUI
import CoreMotion

extension Color {
    static func fromRGB(red: Double, green: Double, blue: Double) -> Color {
        return Color(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Circle().fill(Color.fromRGB(red: 114, green: 204, blue: 152)))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
    }
}
struct CustomButtonStyle2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
    }
}


struct ContentView: View {
    @AppStorage("isProfileSetupComplete") private var isProfileSetupComplete: Bool = false

    var body: some View {
        NavigationView {
            if isProfileSetupComplete {
                MainAppView()
            } else {
                ProfileSetUp()
            }
        }
    }
}


    struct CustomButton: View {
        //                var label: String
        var isWide: Bool = false
        var imageName: String
        var destination: AnyView
        
        var body: some View {
            NavigationLink(destination: destination) {
                
                VStack {
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100) // Set your desired width and height here

                        .padding(1)
                }
                .frame(width: isWide ? 220 : 150, height: 100)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 2, y: 2)
            }
            .buttonStyle(CustomButtonStyle())
        }
    }
    
    struct CustomButton2: View {
        var isWide: Bool = false
        var imageName: String
        let url: URL

        var body: some View {
            Button(action: {
                        UIApplication.shared.open(url)
                    })
            {
                VStack {
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(1)
                }
                .frame(width: isWide ? 220 : 150, height: 100)
                .cornerRadius(0)
                .shadow(color: .gray, radius: 5, x: 2, y: 2)
            }
            .buttonStyle(CustomButtonStyle2())
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
