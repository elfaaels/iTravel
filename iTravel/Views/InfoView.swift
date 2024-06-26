//
//  InfoView.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
             HeaderComponent()
                Spacer(minLength: 10)
            Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                AppInfoView()
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                HStack {
                    Text("Photos")
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text("Unsplash")
                }
                    Text("Photographers")
                        .foregroundColor(Color.gray)
                    Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                Spacer(minLength: 10)
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())

                }

            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    InfoView()
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "iTravel")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone, iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Elfaael")
            RowAppInfoView(itemOne: "Github", itemTwo: "www.github.com/elfaaels")

        }
    }
}

struct RowAppInfoView: View {
    var itemOne: String
    var itemTwo: String
    
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne)
                    .foregroundColor(Color.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}
