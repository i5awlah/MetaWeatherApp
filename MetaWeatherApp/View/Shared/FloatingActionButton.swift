//
//  FloatingActionButton.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 19/04/2022.
//

import SwiftUI

struct FloatingActionButton: View {
    
    let action: () -> Void
    let imageName: String
    let color: Color
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: action, label: {
                    Image(systemName: imageName)
                        .font(.largeTitle)
                        .frame(width: 70, height: 70)
                        .background(color)
                        .clipShape(Circle())
                        .foregroundColor(Color.white)
                })
                    .padding()
                    .shadow(radius: 2)
            }
        }
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton(action: { }, imageName: "plus", color: .blue)
    }
}
