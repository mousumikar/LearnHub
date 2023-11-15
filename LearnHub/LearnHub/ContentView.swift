//
//  ContentView.swift
//  LearnHub
//
//  Created by Mousumi Kar on 14/11/23.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedCourse: String?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    Topbar()
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            HorizontalScrollView()
                                .frame(width: 380, height: 180)
                            
                            HStack {
                                Text("Resume from where you left")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                    .padding(.top, 10)
                                
                                Spacer()
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .frame(width: 380, height: 150)
                                    .cornerRadius(15)
                                    .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Z Transform using EQN I")
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .fontWeight(.regular)
                                        .offset(x: -70, y: 10)
                                    Text("Digital Signal Processing")
                                        .font(.system(size: 14))
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                        .offset(x: -70, y: 10)
                                    
                                    Text("9 mins left")
                                        .font(.system(size: 14))
                                        .foregroundColor(.blue)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .offset(x: -70, y: 40)
                                        .foregroundColor(.blue)
                                    
                                    Image("vdoPlayBtn")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .offset(x: 200, y: -25)
                                }
                            }
                            
                            VStack(spacing: 20) {
                                Text("Explore Courses")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                    .padding(.top, 10)
                                
                                HStack(spacing: 20) {
                                    CourseButtonView(title: "B.Tech", enrolled: "2.4K Enrolled", imageName: "square.and.arrow.up", action: {
                                        selectedCourse = "B.Tech"
                                    })
                                    
                                    CourseButtonView(title: "UPSC", enrolled: "2.4K Enrolled", imageName: "heart.fill", action: {
                                        selectedCourse = "UPSC"
                                    })
                                }
                                
                                HStack(spacing: 20) {
                                    CourseButtonView(title: "ISRO", enrolled: "2.4K Enrolled", imageName: "book.fill", action: {
                                        selectedCourse = "ISRO"
                                    })
                                    
                                    CourseButtonView(title: "GATE", enrolled: "2.4K Enrolled", imageName: "gearshape.fill", action: {
                                        selectedCourse = "GATE"
                                    })
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                }
                .navigationTitle("")

                NavigationLink(
                                destination: CourseDetailView(courseTitle: selectedCourse ?? ""),
                                isActive: Binding<Bool>(
                                    get: { selectedCourse != nil },
                                    set: { isActive in
                                        if !isActive {
                                            selectedCourse = nil // Reset the selected course when navigation is inactive
                                        }
                                    }
                                ),
                                label: { EmptyView() }
                            )
                            .hidden()
            }
        }
    }
}

struct CourseButtonView: View {
    let title: String
    let enrolled: String
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                HStack {
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.blue)
                        Text(enrolled)
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(20)
            .frame(width: 170, height: 100)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
            .overlay(
                VStack {
                    HStack {
                        Spacer()
                        Text("20% OFF")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.orange)
                            .cornerRadius(8)
                            .padding(4)
                    }
                    Spacer()
                }
            )
        }
    }
}

        
        struct HorizontalScrollView: View {
            var body: some View {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            ZStack(alignment: .topLeading) { // Overlaying text on the image
                                Image("anyquery") // Replace "anyquery" with your image name
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 370, height: 180)
                                    .cornerRadius(15) // Rounded corners
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(red: 0.529, green: 0.808, blue: 0.922), lineWidth: 2) // Light sky color border
                                    )
                                //                            .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Have any queries?")
                                        .font(.system(size: 18))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .offset(x: 10, y: 15)
                                        .padding(8) // Padding for the text
                                    
                                    
                                    Text("Talk to an academic counsellor for free")
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .offset(x: 10, y: 0)
                                        .padding(8)
                                    Button(action: {
                                        // Action for the button "Call Now"
                                        // Add your functionality here
                                    }) {
                                        Text("Call Now")
                                            .font(.system(size: 16))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 15)
                                            .background(Color.blue)
                                            .cornerRadius(12) // Rounded corners for the button
                                    }
                                    .offset(x: 245, y: 40)
                                }
                                // Offset from the top-left corner
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        
        
        
        struct Topbar: View {
            var body: some View {
                VStack(spacing: 8) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Hey Shwet!")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("Let's learn something new today")
                                .font(.system(size: 14))
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Image(systemName: "bell")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                )
                            
                            Circle()
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Image(systemName: "magnifyingglass")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                )
                        }
                    }
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(red: 0.529, green: 0.808, blue: 0.922, opacity: 1.0), Color.white]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }


