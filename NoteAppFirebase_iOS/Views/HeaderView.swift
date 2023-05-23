//
//  HeaderView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let color: Color
    let rotationDegree: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: rotationDegree))
                
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
            }
            .foregroundColor(.white)
            .padding(.top, 80)
        }
        .frame(width: getScreenWide() * 3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "To Do List", subTitle: "Get things done", color: .pink, rotationDegree: 15)
    }
}
