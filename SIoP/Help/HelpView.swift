//
//  HelpView.swift
//  SIoP
//
//  Created by private on 13/01/2024.
//

import SwiftUI
import MarkdownUI

struct HelpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    init() {
        let url = Bundle.main.url(forResource: "help", withExtension: "md")!
        let data = try? Data(contentsOf: url)
        if let data = data, let text = String(data: data, encoding: .utf8) {
            content = .init(text)
        } else {
            content = .init("")
        }
    }
  
    let content: MarkdownContent
    
    var body: some View {
        NavigationView {
            Markdown(content)
            .padding()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text("Pomoc")
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    HelpView(isPresented: .constant(false))
//}
