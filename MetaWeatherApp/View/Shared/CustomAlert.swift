//
//  NewCityView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 19/04/2022.
//

import SwiftUI

struct CustomAlert: View {
    let screenSize = UIScreen.main.bounds
    
    var title: String = ""
    @Binding var isShown: Bool
    @Binding var text: String
    var onDone: (String) -> Void = { _ in }
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(title).font(.title)
                TextField("", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Divider()
                HStack {
                    Spacer()
                    Button("Done") {
                        isShown = false
                        onDone(text)
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    Button("Cancel") {
                        isShown = false
                    }
                    Spacer()
                }
            }.padding()
                .frame(width: 300 , height: 150)
                .background(Color(red: 250/255, green: 181/255, blue: 212/255))
                .foregroundColor(Color.purple)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(y: isShown ? 0 : screenSize.height)
            Spacer()
            Spacer()
        }
    }
}

struct NewCityView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(isShown: .constant(true), text: .constant(""))
            .previewInterfaceOrientation(.portrait)
    }
}
