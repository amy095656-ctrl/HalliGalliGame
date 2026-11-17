//
//  CardView.swift
//  MyApp
//
//  Created by 115-1Student04 on 2026/11/17.
//


import SwiftUI

struct CardView: View {
    let cardText: String
    
    var body: some View {
        ZStack {
            // 底色：未翻牌底色，翻牌後的白色
            RoundedRectangle(cornerRadius: 14)
                .fill(cardText == "" ? Color(red:225/255, green: 204/255, blue: 216/255) : Color.white)
                .frame(width: 88, height: 114)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color(Color(red: 132/255, green: 104/255, blue: 106/255)), lineWidth: 3)
                )
            
            // 內框：未翻牌時顯示咖啡色內框，翻牌後變透明
            RoundedRectangle(cornerRadius: 8)
                .stroke(cardText == "" ? Color(red: 132/255, green: 104/255, blue: 106/255) : .clear, lineWidth: 2)
                .frame(width: 70, height: 96)
            
            // 牌面文字：未翻牌時顯示空字串 ""，翻牌後顯示水果圖案
            Text(cardText == "" ? "" : cardText)
                .font(.system(size: 26))
            
        }
    }
}