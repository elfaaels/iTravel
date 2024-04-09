//
//  GuideView.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct GuideView: View {
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                Spacer(minLength: 10)
                Text("Get Started")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                Text("Discover and pick the perfect destination for you!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(title: "Like", subtitle: "Swipe Right", description: "Do you like this destination? Touch the screen and swipe right.", icon: "heart.circle")
                    GuideComponent(title: "Dismiss", subtitle: "Swipe Left", description: "Skip this place? Touch the screen and swipe left.", icon: "xmark.circle")
                    GuideComponent(title: "Book", subtitle: "Tap the Button", description: "This is the perfect place for you!", icon: "checkmark.square")
                }
                Spacer(minLength: 10)
                Button(action: {}, label: {
                    Text("Continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            Capsule().fill(Color.pink))
                        .foregroundColor(Color.white)
                })

            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    GuideView()
}
