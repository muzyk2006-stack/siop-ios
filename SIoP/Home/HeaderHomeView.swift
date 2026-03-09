//
//  HeaderHomeView.swift
//  SIoP
//
//  Created by private on 24/02/2024.
//

import SwiftUI

struct HeaderHomeView: View {
    var body: some View {
        Text("SIoP - system informacji o poszkodowanym")
            .font(.title)
            .padding(.top, 50)
        Image(uiImage: UIImage(named: "home.logo")!).resizable()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    HeaderHomeView()
}
