import SwiftUI

struct ContentView: View {

    // 建立水果陣列
    @State private var deck = [
        "🍓", "🍓🍓", "🍓🍓🍓",
        "🍌", "🍌🍌", "🍌🍌🍌",
        "🍇", "🍇🍇", "🍇🍇🍇",
    ]

    // 紀錄三位玩家目前翻開的牌面；空字串 "" 代表尚未翻牌
    @State private var p1Card = ""
    @State private var p2Card = ""
    @State private var p3Card = ""

    // 紀錄三位玩家的目前分數，初始值皆存為 0
    @State private var p1Score = 0
    @State private var p2Score = 0
    @State private var p3Score = 0

    // 紀錄中央提示橫幅的文字內容
    @State private var message = "湊滿 5 顆相同水果快按鈴！"

    // 用來控制遊戲是否結束
    @State private var isGameOver = false

    var body: some View {
        ZStack {
            // 德國心臟病背景
            RadialGradient(
                gradient: Gradient(colors: [Color(red: 1/255, green: 114/255, blue: 179/255), Color(red: 90/255, green: 163/255, blue: 212/255)]),
                center: .center,
                startRadius: 20,
                endRadius: 220
            )
            .ignoresSafeArea()

            // 圓桌桌緣紅色框線裝飾
            Circle()
                .strokeBorder(.black.opacity(0.25), lineWidth: 14)
                .padding(16)

            VStack {
                
                VStack(spacing: 8) {
                    // 顯示玩家3的卡牌內容
                    CardView(cardText: p3Card)

                    // 顯示玩家3名稱與分數
                    Text("玩家 3（\(p3Score) 分）")
                        .font(.caption.bold())
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color(red: 64/255, green: 23/255, blue: 68/255))
                        .clipShape(Capsule())

                    // 只有當遊戲還沒結束時，才顯示翻牌與拍鈴按鈕
                    if isGameOver == false {
                        HStack(spacing: 8) {
                            // 點擊翻牌時呼叫deck.shuffle() 打亂陣列順序，並取出第1張（deck[0]）存進 p3Card
                            Button("翻牌") {
                                deck.shuffle()
                                p3Card = deck[0]
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundStyle(.black)

                            // 玩家 3 的拍鈴按鈕
                            Button("🔔") {
                                // 宣告三個整數變數，用來統計目前圓桌上三張牌的水果總數
                                var strawberryCount = 0
                                var bananaCount = 0
                                var grapeCount = 0

                                // 使用 == 比較字串相等，搭配 if / else if 逐一檢查玩家1的牌面並累加數量
                                if p1Card == "🍓" {
                                    strawberryCount = strawberryCount + 1
                                } else if p1Card == "🍓🍓" {
                                    strawberryCount = strawberryCount + 2
                                } else if p1Card == "🍓🍓🍓" {
                                    strawberryCount = strawberryCount + 3
                                } else if p1Card == "🍌" {
                                    bananaCount = bananaCount + 1
                                } else if p1Card == "🍌🍌" {
                                    bananaCount = bananaCount + 2
                                } else if p1Card == "🍌🍌🍌" {
                                    bananaCount = bananaCount + 3
                                } else if p1Card == "🍇" {
                                    grapeCount = grapeCount + 1
                                } else if p1Card == "🍇🍇" {
                                    grapeCount = grapeCount + 2
                                } else if p1Card == "🍇🍇🍇" {
                                    grapeCount = grapeCount + 3
                                }

                                // 檢查玩家2的牌面並累加數量
                                if p2Card == "🍓" {
                                    strawberryCount = strawberryCount + 1
                                } else if p2Card == "🍓🍓" {
                                    strawberryCount = strawberryCount + 2
                                } else if p2Card == "🍓🍓🍓" {
                                    strawberryCount = strawberryCount + 3
                                } else if p2Card == "🍌" {
                                    bananaCount = bananaCount + 1
                                } else if p2Card == "🍌🍌" {
                                    bananaCount = bananaCount + 2
                                } else if p2Card == "🍌🍌🍌" {
                                    bananaCount = bananaCount + 3
                                } else if p2Card == "🍇" {
                                    grapeCount = grapeCount + 1
                                } else if p2Card == "🍇🍇" {
                                    grapeCount = grapeCount + 2
                                } else if p2Card == "🍇🍇🍇" {
                                    grapeCount = grapeCount + 3
                                }

                                // 檢查玩家3的牌面並累加數量
                                if p3Card == "🍓" {
                                    strawberryCount = strawberryCount + 1
                                } else if p3Card == "🍓🍓" {
                                    strawberryCount = strawberryCount + 2
                                } else if p3Card == "🍓🍓🍓" {
                                    strawberryCount = strawberryCount + 3
                                } else if p3Card == "🍌" {
                                    bananaCount = bananaCount + 1
                                } else if p3Card == "🍌🍌" {
                                    bananaCount = bananaCount + 2
                                } else if p3Card == "🍌🍌🍌" {
                                    bananaCount = bananaCount + 3
                                } else if p3Card == "🍇" {
                                    grapeCount = grapeCount + 1
                                } else if p3Card == "🍇🍇" {
                                    grapeCount = grapeCount + 2
                                } else if p3Card == "🍇🍇🍇" {
                                    grapeCount = grapeCount + 3
                                }

                                // 用Bool變數紀錄是否有任何一種水果剛好等於5顆
                                var isFive = false
                                if strawberryCount == 5 {
                                    isFive = true
                                } else if bananaCount == 5 {
                                    isFive = true
                                } else if grapeCount == 5 {
                                    isFive = true
                                }

                                // 若isFive為true則加1 分並清空牌面；否則拍錯扣1分
                                if isFive {
                                    p3Score = p3Score + 1
                                    message = "🔔 玩家 3 得 1 分"
                                    p1Card = ""
                                    p2Card = ""
                                    p3Card = ""
                                } else {
                                    p3Score = p3Score - 1
                                    message = "❌ 沒有 5 顆（玩家 3 扣 1 分）"
                                }

                                // 檢查玩家3是否率先達到5分獲勝
                                if p3Score >= 5 {
                                    message = "🏆 遊戲結束！玩家 3 率先獲得 5 分勝利！"
                                    isGameOver = true
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.yellow)
                        }
                    }
                }
                .padding(10)
                .background(Color.white.opacity(0.35))
                .cornerRadius(20)
                .rotationEffect(.degrees(180))
                .padding(.top, 6)

                Spacer()

                // 戰況提示橫幅
                VStack(spacing: 10) {
                    Text(message)
                        .font(.subheadline.bold())
                        .foregroundStyle(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    
                        // 遊戲結束時背景變黃色，進行中則為白色
                        .background(
                            isGameOver ? Color(red: 211/255, green: 204/255, blue: 14/255) : Color.white.opacity(0.75)
                        )
                        .clipShape(Capsule())


                    // 只有當isGameOver為true時，才讓重新開始按鈕出現
                    if isGameOver {
                        Button("🔄") {
                            // 將所有分數與牌面變數重新存回初始狀態，並重新洗牌
                            p1Score = 0
                            p2Score = 0
                            p3Score = 0
                            p1Card = ""
                            p2Card = ""
                            p3Card = ""
                            isGameOver = false
                            message = "Restart"
                            deck.shuffle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.black)
                    }
                }

                Spacer()

                HStack(spacing: 14) {
                    // 玩家1
                    VStack(spacing: 8) {
                        CardView(cardText: p1Card)
                            .rotationEffect(.degrees(-6))

                        Text("玩家 1（\(p1Score) 分）")
                            .font(.caption.bold())
                            .foregroundStyle(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color(red: 162/255, green: 198/255, blue: 41/255))
                            .clipShape(Capsule())


                        if isGameOver == false {
                            HStack(spacing: 8) {
                                
                                Button("翻牌") {
                                    deck.shuffle()
                                    p1Card = deck[0]
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.white)
                                .foregroundStyle(.black)

                                Button("🔔") {
                                    var strawberryCount = 0
                                    var bananaCount = 0
                                    var grapeCount = 0

                                    if p1Card == "🍓" {
                                        strawberryCount = strawberryCount + 1
                                    } else if p1Card == "🍓🍓" {
                                        strawberryCount = strawberryCount + 2
                                    } else if p1Card == "🍓🍓🍓" {
                                        strawberryCount = strawberryCount + 3
                                    } else if p1Card == "🍌" {
                                        bananaCount = bananaCount + 1
                                    } else if p1Card == "🍌🍌" {
                                        bananaCount = bananaCount + 2
                                    } else if p1Card == "🍌🍌🍌" {
                                        bananaCount = bananaCount + 3
                                    } else if p1Card == "🍇" {
                                        grapeCount = grapeCount + 1
                                    } else if p1Card == "🍇🍇" {
                                        grapeCount = grapeCount + 2
                                    } else if p1Card == "🍇🍇🍇" {
                                        grapeCount = grapeCount + 3
                                    }

                                    if p2Card == "🍓" {
                                        strawberryCount = strawberryCount + 1
                                    } else if p2Card == "🍓🍓" {
                                        strawberryCount = strawberryCount + 2
                                    } else if p2Card == "🍓🍓🍓" {
                                        strawberryCount = strawberryCount + 3
                                    } else if p2Card == "🍌" {
                                        bananaCount = bananaCount + 1
                                    } else if p2Card == "🍌🍌" {
                                        bananaCount = bananaCount + 2
                                    } else if p2Card == "🍌🍌🍌" {
                                        bananaCount = bananaCount + 3
                                    } else if p2Card == "🍇" {
                                        grapeCount = grapeCount + 1
                                    } else if p2Card == "🍇🍇" {
                                        grapeCount = grapeCount + 2
                                    } else if p2Card == "🍇🍇🍇" {
                                        grapeCount = grapeCount + 3
                                    }

                                    if p3Card == "🍓" {
                                        strawberryCount = strawberryCount + 1
                                    } else if p3Card == "🍓🍓" {
                                        strawberryCount = strawberryCount + 2
                                    } else if p3Card == "🍓🍓🍓" {
                                        strawberryCount = strawberryCount + 3
                                    } else if p3Card == "🍌" {
                                        bananaCount = bananaCount + 1
                                    } else if p3Card == "🍌🍌" {
                                        bananaCount = bananaCount + 2
                                    } else if p3Card == "🍌🍌🍌" {
                                        bananaCount = bananaCount + 3
                                    } else if p3Card == "🍇" {
                                        grapeCount = grapeCount + 1
                                    } else if p3Card == "🍇🍇" {
                                        grapeCount = grapeCount + 2
                                    } else if p3Card == "🍇🍇🍇" {
                                        grapeCount = grapeCount + 3
                                    }

                                    var isFive = false
                                    if strawberryCount == 5 {
                                        isFive = true
                                    } else if bananaCount == 5 {
                                        isFive = true
                                    } else if grapeCount == 5 {
                                        isFive = true
                                    }
                                 
                                    if isFive {
                                        p1Score = p1Score + 1
                                        message = "🔔 玩家 1 得 1 分"
                                        p1Card = ""
                                        p2Card = ""
                                        p3Card = ""
                                    } else {
                                        p1Score = p1Score - 1
                                        message = "❌ 沒有 5 顆（玩家 1 扣 1 分）"
                                    }
                                    
                                    if p1Score >= 5 {
                                        message = "🏆 遊戲結束！玩家 1 率先獲得 5 分勝利！"
                                        isGameOver = true
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.yellow)
                            }
                        }
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(20)

                    // 玩家2
                    VStack(spacing: 8) {
                        CardView(cardText: p2Card)
                            .rotationEffect(.degrees(6))

                        Text("玩家 2（\(p2Score) 分）")
                            .font(.caption.bold())
                            .foregroundStyle(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color(red: 221/255, green: 33/255, blue: 14/255))
                            .clipShape(Capsule())

              
                        if isGameOver == false {
                            HStack(spacing: 8) {
          
                                Button("翻牌") {
                                    deck.shuffle()
                                    p2Card = deck[0]
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.white)
                                .foregroundStyle(.black)

                                Button("🔔") {
                                    var strawberryCount = 0
                                    var bananaCount = 0
                                    var grapeCount = 0

                                    if p1Card == "🍓" {
                                        strawberryCount = strawberryCount + 1
                                    } else if p1Card == "🍓🍓" {
                                        strawberryCount = strawberryCount + 2
                                    } else if p1Card == "🍓🍓🍓" {
                                        strawberryCount = strawberryCount + 3
                                    } else if p1Card == "🍌" {
                                        bananaCount = bananaCount + 1
                                    } else if p1Card == "🍌🍌" {
                                        bananaCount = bananaCount + 2
                                    } else if p1Card == "🍌🍌🍌" {
                                        bananaCount = bananaCount + 3
                                    } else if p1Card == "🍇" {
                                        grapeCount = grapeCount + 1
                                    } else if p1Card == "🍇🍇" {
                                        grapeCount = grapeCount + 2
                                    } else if p1Card == "🍇🍇🍇" {
                                        grapeCount = grapeCount + 3
                                    }

                                    if p2Card == "🍓" {
                                        strawberryCount = strawberryCount + 1
                                    } else if p2Card == "🍓🍓" {
                                        strawberryCount = strawberryCount + 2
                                    } else if p2Card == "🍓🍓🍓" {
                                        strawberryCount = strawberryCount + 3
                                    } else if p2Card == "🍌" {
                                        bananaCount = bananaCount + 1
                                    } else if p2Card == "🍌🍌" {
                                        bananaCount = bananaCount + 2
                                    } else if p2Card == "🍌🍌🍌" {
                                        bananaCount = bananaCount + 3
                                    } else if p2Card == "🍇" {
                                        grapeCount = grapeCount + 1
                                    } else if p2Card == "🍇🍇" {
                                        grapeCount = grapeCount + 2
                                    } else if p2Card == "🍇🍇🍇" {
                                        grapeCount = grapeCount + 3
                                    }

                                    if p3Card == "🍓" {
                                        strawberryCount = strawberryCount + 1
                                    } else if p3Card == "🍓🍓" {
                                        strawberryCount = strawberryCount + 2
                                    } else if p3Card == "🍓🍓🍓" {
                                        strawberryCount = strawberryCount + 3
                                    } else if p3Card == "🍌" {
                                        bananaCount = bananaCount + 1
                                    } else if p3Card == "🍌🍌" {
                                        bananaCount = bananaCount + 2
                                    } else if p3Card == "🍌🍌🍌" {
                                        bananaCount = bananaCount + 3
                                    } else if p3Card == "🍇" {
                                        grapeCount = grapeCount + 1
                                    } else if p3Card == "🍇🍇" {
                                        grapeCount = grapeCount + 2
                                    } else if p3Card == "🍇🍇🍇" {
                                        grapeCount = grapeCount + 3
                                    }

                                    var isFive = false
                                    if strawberryCount == 5 {
                                        isFive = true
                                    } else if bananaCount == 5 {
                                        isFive = true
                                    } else if grapeCount == 5 {
                                        isFive = true
                                    }

                                    if isFive {
                                        p2Score = p2Score + 1
                                        message = "🔔 玩家 2 得 1 分"
                                        p1Card = ""
                                        p2Card = ""
                                        p3Card = ""
                                    } else {
                                        p2Score = p2Score - 1
                                        message = "❌ 沒有 5 顆（玩家 2 扣 1 分）"
                                    }

                                    if p2Score >= 5 {
                                        message = "🏆 遊戲結束！玩家 2 率先獲得 5 分勝利！"
                                        isGameOver = true
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.yellow)
                            }
                        }
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(20)
                }
                .padding(.bottom, 6)
            }
            .padding(.horizontal, 10)
        }
        
        // 畫面出現時自動執行onAppear，將deck陣列隨機洗牌
        .onAppear {
            deck.shuffle()
        }
    }
}

#Preview {
    ContentView()
}
