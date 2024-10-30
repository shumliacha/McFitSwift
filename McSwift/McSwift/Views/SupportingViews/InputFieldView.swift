//
//  InputFieldView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//

import SwiftUI

struct InputFieldView: View { //https://ix76y.medium.com/create-a-login-page-in-swiftui-aab664a7f96f
    //added securefields for passwords
    
    @Binding var data: String //this prwrapper  cause this property wil be passed and changed later
    var title: String?
    var isSecured: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if isSecured {
                    SecureField("", text: $data)
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .overlay( //owwww, sth new
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.gray, lineWidth: 1)
                        )
                } else {
                    TextField("", text: $data)
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                Spacer()
                
                if isSecured {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                }
            }
                
            HStack{
                Text(title ?? "Input")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(4)
                    .background()
                Spacer()
            }
            
            .padding(.leading, 8)
            
            .offset(CGSize(width: 0, height: -20))
        }
        .padding(4)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}


#Preview {
    @Previewable @State var value: String = "blablabla"

    InputFieldView(data: $value, title: "Email", isSecured: true)
}
