//
//  ProfileView.swift
//  UIScreen
//
//  Created by Jai  on 08/11/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var phase = "5"
    @State private var type = "Lateral"
    @State private var level = "4"
    @State private var selectedDate = Date()
    
    var body: some View {
            VStack {
                
                ZStack{
                    Color.black.edgesIgnoringSafeArea(.all)
                    VStack {
                        ShieldView()
                    
                        Text("Andrew Smith")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,4)
                        HStack {
                            VStack{
                                UserInfoView(label: "5' 11\"", value: "Height")
                                
                                UserInfoView(label: "200 lbs", value: "Weight")
                            }
                            .padding()
                            VStack{
                                UserInfoView(label: "73", value: "SMM")
                                UserInfoView(label: "20%", value: "Body Fat")
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: 400)
                
                    HStack {
                    VStack {
                        Text("Phase")
                            .fontWeight(.heavy)
                        Text("5")
                    }
                    Spacer()
                    VStack {
                        Text("Type")
                            .fontWeight(.heavy)
                        Text("Lateral")
                    }
                    Spacer()
                    VStack {
                        Text("Level")
                            .fontWeight(.heavy)
                        Text("4")
                    }
                }
                
                .padding(.horizontal)
                
                // Date picker
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.compact)
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .center)

            
                ScrollView{
                    VStack(spacing: 10) {
                        MenuButton(title: "Activation", action: {})
                        MenuButton(title: "Build", action: {})
                        MenuButton(title: "Energy", action: {})
                        MenuButton(title: "Skill", action: {})
                        MenuButton(title: "Regen", action: {})
                        MenuButton(title: "Fuel", action: {})
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
        
        
    }
    
    struct ShieldView: View {
        var body: some View {
            VStack {
                Image(systemName: "shield.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.yellow)
                    .padding(.top, 16)
                
                Image("profilePicture")                     .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .padding(.top, -30)            }
        }
    }
    
    struct UserInfoView: View {
        var label: String
        var value: String
        
        var body: some View {
            VStack {
                Text(label)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(value)
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
    
    struct PhaseTypeLevelView: View {
        var label: String
        @Binding var value: String
        
        var body: some View {
            VStack {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(value)
                    .fontWeight(.bold)
            }
        }
    }
    
    struct MenuButton: View {
        var title: String
        var action: () -> Void

        var body: some View {
            NavigationLink(destination: DestinationView()) {
                HStack {
                    Text(title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .background(buttonBackground)
                .foregroundColor(buttonTextColor)
                .cornerRadius(10)
            }
        }
        
        var buttonBackground: Color {
            switch title {
            case "Build":
                return Color.orange
            case "Energy":
                return Color.gray.opacity(0.5)
            default:
                return Color.white
            }
        }
        
        var buttonTextColor: Color {
            return title == "Energy" ? Color.white : Color.black
        }
    }
    
    
    
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
