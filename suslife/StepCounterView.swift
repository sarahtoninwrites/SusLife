import SwiftUI
import CoreMotion
import SwiftUI
//
//class PedometerViewModel: ObservableObject {
//    private var pedometer = CMPedometer()
//    @Published var stepCount: Int = 0
//    @Published var sustainabilityImpact: String = ""
//
//    init() {
//        startPedometerUpdates()
//    }
//
//    private func startPedometerUpdates() {
//        if CMPedometer.isStepCountingAvailable() {
//            pedometer.startUpdates(from: Date()) { [weak self] data, error in
//                guard let data = data, error == nil else { return }
//                DispatchQueue.main.async {
//                    self?.stepCount = data.numberOfSteps.intValue
//                    self?.calculateSustainabilityImpact()
//                }
//            }
//        }
//    }
//
//    private func calculateSustainabilityImpact() {
//        // Example conversion: 1 step = 0.05g CO2 reduction
//        let co2ReductionPerStep: Double = 0.05
//        let totalReduction = Double(stepCount) * co2ReductionPerStep
//        sustainabilityImpact = String(format: "%.2f grams of CO2 reduced", totalReduction)
//    }
//}

class PedometerViewModel: ObservableObject {
    private var pedometer = CMPedometer()
    @Published var stepCount: Int = 0
    @Published var sustainabilityImpact: String = ""

    init() {
        // Comment out the startPedometerUpdates for simulation
        // startPedometerUpdates()
        calculateSustainabilityImpact()
    }

    func simulateSteps(_ steps: Int) {
        stepCount = steps
        calculateSustainabilityImpact()
    }

    private func startPedometerUpdates() {
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { [weak self] data, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self?.stepCount = data.numberOfSteps.intValue
                    self?.calculateSustainabilityImpact()
                }
            }
        }
    }

    private func calculateSustainabilityImpact() {
        // Example conversion: 1 step = 0.05g CO2 reduction
        let co2ReductionPerStep: Double = 0.05
        let totalReduction = Double(stepCount) * co2ReductionPerStep
        sustainabilityImpact = String(format: "%.2f grams of CO2 reduced", totalReduction)
    }
}

struct StepCounterTestView: View {
    @ObservedObject var viewModel = PedometerViewModel()
    @State private var stepInput: String = "0"
    @State private var navigateToMainPage = false

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
                        
                        Text("Step Counter")
                            .font(.largeTitle)
                            .padding()

                        Text("Steps: \(viewModel.stepCount)")
                            .font(.title)
                            .padding()

                        Text(viewModel.sustainabilityImpact)
                            .font(.title2)
                            .padding()

                        Spacer()

                        TextField("Enter steps for simulation", text: $stepInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Button(action: {
                            if let steps = Int(stepInput) {
                                viewModel.simulateSteps(steps)
                            }
                        }) {
                            Text("Simulate Steps")
                                .padding(10)
                                .background(Color.fromRGB(red: 114, green: 204, blue: 152))
                                .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                                .cornerRadius(8)
                                .transition(.opacity)
                        }
                        .padding()

                        NavigationLink(destination: MainAppView(), isActive: $navigateToMainPage) {
                            EmptyView()
                        }

                        
                    }
                    .animation(.easeInOut)
                    
                    Spacer()
                }
                .padding()
               // .alert(isPresented: $viewModel.showAlert) {
                 //   Alert(title: Text("Invalid Input"), message: Text($viewModel.alertMessage), dismissButton: .default(Text("OK")))
               // }
            }
        }
    }
}

struct StepCounterTestView_Previews: PreviewProvider {
    static var previews: some View {
        StepCounterTestView()
    }
}

//
//struct StepCounterView: View {
//    @ObservedObject var viewModel = PedometerViewModel()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Step Counter")
//                    .font(.largeTitle)
//                    .padding()
//
//                Text("Steps: \(viewModel.stepCount)")
//                    .font(.title)
//                    .padding()
//
//                Text(viewModel.sustainabilityImpact)
//                    .font(.title2)
//                    .padding()
//
//                Spacer()
//
//                NavigationLink(destination: MainAppView()) {
//                    Text("Plant")
//                        .padding(10)
//                        .background(Color.fromRGB(red: 114, green: 204, blue: 152))
//                        .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
//                        .cornerRadius(8)
//                        .transition(.opacity)
//                }
//                .padding()
//            }
//            .background(Color.fromRGB(red: 175, green: 242, blue: 209)
//                .edgesIgnoringSafeArea(.all))
//        }
//    }
//}
//
//struct StepCounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepCounterView()
//    }
//}
//
