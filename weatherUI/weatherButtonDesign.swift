//
//  weatherButtonDesign.swift
//  weatherUI
//
//  Created by BJIT on 17/5/22.
//  if a view is to be used all thorughout the app in different screens, we should keep them in a different file like this.
//  if a view is specific for a screen, then that should be kept in that screen file

import SwiftUI
struct btnTextSetup: View{
    var btnText: String
    var txtColor: Color
    var bgColor: Color
    var body: some View{
        Text(btnText)
            .frame(width: 200, height: 50)
            .background(bgColor)
            .foregroundColor(txtColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

