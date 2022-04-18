//
//  BackgroundView.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        // Linear Gradient Background
        LinearGradient(gradient: Gradient(
            colors: [
                Color(red: 250/255, green: 181/255, blue: 212/255),
                Color(red: 131/255, green: 131/255, blue: 246/255)
            ]
        ), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
