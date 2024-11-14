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
    
    @State var isSecuredNow = true
    @State var isSecured: Bool
    
    var body: some View {
        ZStack {
                if isSecuredNow == isSecured {
                    SecureField("", text: $data)
                        .padding(.horizontal, 10)
                        .frame(height: 44)
                        .overlay( //owwww, sth new
                            RoundedRectangle(cornerRadius: 5.5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                } else {
                    TextField("", text: $data)
                        .padding(.horizontal, 10)
                        .frame(height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                Spacer()
                
            HStack{
                Text(title ?? "Input")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                    .background()
                Spacer()
            }
            
            .padding(.leading, 8)
            
            .offset(CGSize(width: 0, height: -20))
            
            if isSecured {
                HStack{
                    Spacer()
                    Button(action: {
                        isSecuredNow.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .background()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                }
            }

        }
        .padding(4)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}


#Preview {
    @Previewable @State var value: String = "blablabla"

    InputFieldView(data: $value, title: "Email", isSecured: false)
}
