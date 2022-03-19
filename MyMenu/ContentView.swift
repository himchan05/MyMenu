//
//  ContentView.swift
//  MyMenu
//
//  Created by 박힘찬 on 2022/03/19.
//

import SwiftUI

struct ContentView: View {
    @State var shouldShowAlert = false
    @State var citytext = ""
    @State var selectedItem = 0
    var item = ["고양이 🐱", "사막여우 🦊", "판다 🐼"]
    
    var body: some View {
        NavigationView {
            Text("\(self.item[selectedItem])")
                .padding()
                .font(.system(size: 40, weight: .heavy))
                .background(Color(#colorLiteral(red: 1, green: 0.9260074496, blue: 0.8201015592, alpha: 0.8470588235)))
                .cornerRadius(15)
                .navigationTitle("힘찬 메뉴")
                .toolbar(content: {
                    ToolbarItem(placement: .bottomBar) {
                        Menu(content: {
                            Section {
                                Button(action: {
                                    self.citytext = "수유동입니다."
                                    shouldShowAlert = true
                                }) {
                                    Text("수유동")
                                }
                                Button(action: {
                                    self.citytext = "인수동입니다."
                                    shouldShowAlert = true
                                }) {
                                    Text("인수동")
                                }
                                Button(action: {
                                    self.citytext = "삼양동입니다."
                                    shouldShowAlert = true
                                }) {
                                    Text("삼양동")
                                }
                            }
                            Section {
                                Button(action: {}) {
                                    HStack {
                                        Text("새 파일 만들기")
                                        Image(systemName: "paperplane.fill")
                                    }
                                }
                                Button(action: {}) {
                                    HStack {
                                        Text("새 폴더 만들기")
                                        Image(systemName: "plus.rectangle.on.folder.fill")
                                    }
                                }
                            }
                            Section {
                                Button(action: {}) {
                                    HStack {
                                        Text("파일 삭제")
                                        Image(systemName: "trash.fill")
                                    }
                                }
                            }
                            Section {
                                ForEach(self.item.indices, id: \.self) { index in
                                    Button(action: {
                                        self.selectedItem = index
                                    }) {
                                        Text(self.item[index])
                                    }
                                }
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color(#colorLiteral(red: 0.1744251549, green: 0.06323259324, blue: 1, alpha: 1)))
                                Image(systemName: "flag.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.8766744137, green: 1, blue: 0.7628422379, alpha: 1)))
                            }
                        }
                    }
                })
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창"), message: Text("이곳은 \(self.citytext)"), dismissButton: .default(Text("확인")))
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
