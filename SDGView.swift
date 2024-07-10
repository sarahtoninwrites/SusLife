//
//  SDGView.swift
//  suslife
//
//  Created by Sarah Saiyed on 10/07/2024.

import SwiftUI

struct SDGView: View {
    var body: some View {
        ZStack {
            Color.fromRGB(red: 2, green: 89, blue: 57)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("Sustainable Development Goals")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .foregroundColor(.white)
                
                Text("Explore the categories below to learn more")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 20)
                    .foregroundColor(.white)
                
                Spacer()
                VStack {
                        Image("suslife")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                }
                
                TabView {
                    VStack {
                        CustomButton(imageName: "6", destination: AnyView(PovertyAndSocietyView()))
                        Text("Poverty and Society")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    VStack {
                        CustomButton(imageName: "3", destination: AnyView(PersonalView()))
                        Text("Personal")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    VStack {
                        CustomButton(imageName: "7", destination: AnyView(EqualityAndJusticeView()))
                        Text("Equality and Justice")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    VStack {
                        CustomButton(imageName: "2", destination: AnyView(EnergyAndInfrastructureView()))
                        Text("Energy and Infrastructure")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    VStack {
                        CustomButton(imageName: "4", destination: AnyView(ClimateAndLifeView()))
                        Text("Climate and Life")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    VStack {
                        CustomButton2(imageName: "1", url: URL(string: "https://unstats.un.org/sdgs/files/report/2024/SG-SDG-Progress-Report-2024-advanced-unedited-version.pdf")!)
                        Text("SDG Progress Report- 2024")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 300) // Adjust the height as needed
                
                
                Spacer()
                
            }
            .padding()
        }
        
    }
}

struct SDGView_Previews: PreviewProvider {
    static var previews: some View {
        SDGView()
    }
}

struct PovertyAndSocietyView: View {
    var body: some View {
        VStack{
            Text("Poverty and Society")
                .fontWeight(.light)

                .font(.custom("Helvetica Neue", size: 24)) // Custom font and size
                .foregroundColor(.black)
//                .navigationBarTitle("Poverty and Society", displayMode: .inline)
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal1",
                    url: URL(string: "https://sdgs.un.org/goals/goal1")!)
                CustomButton2(
                    imageName: "goal2",
                    url: URL(string: "https://sdgs.un.org/goals/goal2")!)
            }
            
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal4",
                    url: URL(string: "https://sdgs.un.org/goals/goal4")!)
                CustomButton2(
                    imageName: "goal6",
                    url: URL(string: "https://sdgs.un.org/goals/goal6")!)
            }
          
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(Color.fromRGB(red: 114, green: 204, blue: 152))
        
    }
    
}

struct PersonalView: View {
    var body: some View {
        VStack{
            Text("Personal")
                .fontWeight(.light)

                .font(.custom("Helvetica Neue", size: 24)) // Custom font and size                    .foregroundColor(.black)
//                .navigationBarTitle("Personal", displayMode: .inline)
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal3",
                    url: URL(string: "https://sdgs.un.org/goals/goal3")!)
                CustomButton2(
                    imageName: "goal8",
                    url: URL(string: "https://sdgs.un.org/goals/goal8")!)
            }
            
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal2",
                    url: URL(string: "https://sdgs.un.org/goals/goal2")!)
                
            }}
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(Color.fromRGB(red: 114, green: 204, blue: 152))
        
    }
}

struct EqualityAndJusticeView: View {
    var body: some View {
        VStack{
            Text("Equality and Justice")
                .fontWeight(.light)

                .font(.custom("Helvetica Neue", size: 24)) // Custom font and size                    .foregroundColor(.black)
//                .navigationBarTitle("Equality and Justice", displayMode: .inline)
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal5",
                    url: URL(string: "https://sdgs.un.org/goals/goal5")!)
                CustomButton2(
                    imageName: "goal10",
                    url: URL(string: "https://sdgs.un.org/goals/goal10")!)
            }
            
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal16",
                    url: URL(string: "https://sdgs.un.org/goals/goal6")!)
                
            }}
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(Color.fromRGB(red: 114, green: 204, blue: 152))
        
    }
}

struct EnergyAndInfrastructureView: View {
    var body: some View {
        VStack{
        Text("Energy and Infrastructure")
                .fontWeight(.light)

                .font(.custom("Helvetica Neue", size: 24)) // Custom font and size                .foregroundColor(.black)
//            .navigationBarTitle("Energy and Infrastructure", displayMode: .inline)
        HStack(spacing: 20) {
            CustomButton2(
                imageName: "goal7",
                url: URL(string: "https://sdgs.un.org/goals/goal7")!)
            CustomButton2(
                imageName: "goal9",
                url: URL(string: "https://sdgs.un.org/goals/goal9")!)
        }
        
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal11",
                    url: URL(string: "https://sdgs.un.org/goals/goal11")!)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(Color.fromRGB(red: 114, green: 204, blue: 152))
        
    }
}

struct ClimateAndLifeView: View {
    var body: some View {
        VStack{
            Text("Climate and Life")
                .fontWeight(.light)

                .font(.custom("Helvetica Neue", size: 24)) // Custom font and size                    .foregroundColor(.black)
//                .navigationBarTitle("Climate and Life", displayMode: .inline)
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal13",
                    url: URL(string: "https://sdgs.un.org/goals/goal13")!)
                CustomButton2(
                    imageName: "goal14",
                    url: URL(string: "https://sdgs.un.org/goals/goal14")!)
            }
            
            HStack(spacing: 20) {
                CustomButton2(
                    imageName: "goal15",
                    url: URL(string: "https://sdgs.un.org/goals/goal15")!)
                
            }}
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(Color.fromRGB(red: 114, green: 204, blue: 152))
        
    }
}

