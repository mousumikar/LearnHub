//
//  CourseDetailView.swift
//  LearnHub
//
//  Created by Mousumi Kar on 14/11/23.
//

import SwiftUI

struct BranchData: Identifiable, Decodable {
    let id: Int
    let bigText: String
    let smallText: String

    private enum CodingKeys: String, CodingKey {
        case id
        case bigText = "short"
        case smallText = "name"
    }
}

struct CourseDetailView: View {
    @State private var searchText = ""
    let courseTitle: String
    @State private var branchData: [BranchData] = []

    var filteredData: [BranchData] {
        if searchText.isEmpty {
            return branchData
        } else {
            return branchData.filter { data in
                data.bigText.localizedCaseInsensitiveContains(searchText) || data.smallText.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topLeading) {
                    // Image as app bar or header
                    Image("blueBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        if courseTitle == "B.Tech" {
                            Text("All B.Tech Courses")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                        } else if courseTitle == "UPSC" {
                            Text("All UPSC Courses")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                            
                            // Add similar conditional texts for other course titles
                        } else if courseTitle == "GATE" {
                            Text("All GATE Courses")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                            
                            // Add similar conditional texts for other course titles
                        } else if courseTitle == "ISRO" {
                            Text("All ISRO Courses")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                            
                            // Add similar conditional texts for other course titles
                        } else {
                            Text("No specific course selected")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                        }
                        
                        Text("Find Your Branch")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            
                            TextField("Search", text: $searchText)
                                .padding(.vertical, 10)
                                .foregroundColor(.black)
                                .onChange(of: searchText) { newValue in
                                    // Perform filtering logic here
                                }
                        }
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        Spacer().frame(height: 15)
                        ScrollView {
                            LazyVGrid(columns: [
                                GridItem(.adaptive(minimum: 170), spacing: 20)
                            ], spacing: 20) {
                                ForEach(filteredData) { data in
                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack {
                                            Image(systemName: "book.fill") // Replace with your icon name
                                                .foregroundColor(.blue) // Adjust icon color if needed
                                                .font(.system(size: 22))
                                            Text(data.bigText)
                                                .fontWeight(.bold)
                                                .font(.system(size: 19))
                                                .foregroundColor(.blue)
                                        }
                                        .padding(.horizontal)
                                        Text(data.smallText)
                                            .font(.caption)
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .padding(.horizontal)
                                    }
                                    .frame(width: 170, height: 100)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(false)
                        .navigationBarBackButtonHidden(false)
//                        .navigationBarItems(leading: NavigationBackButtonView())
                               .onAppear {
                                   fetchData()
                               }
            }
        }
     
    }

    
    
    func fetchData() {
        guard let url = URL(string: "https://api.msigma.in/btech/v2/branches") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let branches = json["branches"] as? [[String: Any]] {
                    self.branchData = try branches.map { branch in
                        guard let id = branch["id"] as? Int,
                              let bigText = branch["short"] as? String,
                              let smallText = branch["name"] as? String else {
                            throw NSError(domain: "DecodingError", code: 1, userInfo: nil)
                        }
                        return BranchData(id: id, bigText: bigText, smallText: smallText)
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

struct NavigationBackButtonView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white) // Set the color you desire for the back button
                .imageScale(.large)
        }
    }
}








