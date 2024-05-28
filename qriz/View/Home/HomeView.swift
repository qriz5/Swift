//
//  HomeView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/27.
//
//
import SwiftUI

struct HomeView: View {
    
//    @EnvironmentObject private var pathModel: PathModel
    @StateObject private var homeViewMoodel = HomeViewModel()
    
    
    var body: some View {
        ZStack {
            TabView(selection: $homeViewMoodel.selectedTab) {
                MainPageView()
                .tabItem {
                    Image(
                        homeViewMoodel.selectedTab == .mainPage
                        ? "Frame 39"
                        : "Frame 40"
                    )
                }
                .tag(Tab.mainPage)
                
                TestView()
                .tabItem {
                    Image(
                        homeViewMoodel.selectedTab == .test
                        ? "Frame 39"
                        : "Frame 40"
                    )
                }
                .tag(Tab.test)
                
                ExamView()
                .tabItem {
                    Image(
                       homeViewMoodel.selectedTab == .conceptBook
                       ? "Frame 39"
                       : "Frame 40"
                    )
                }
                .tag(Tab.conceptBook)
                
                MyPageView()
                .tabItem {
                    Image(
                        homeViewMoodel.selectedTab == .myPage
                        ? "Frame 39"
                        : "Frame 40"
                    )
                }
                .tag(Tab.myPage)
            }
            .environmentObject(homeViewMoodel)
            
            SeperatorListView()
        }
    }
}
//MARK: -구분서
private struct SeperatorListView: View {
    fileprivate var body: some View {
        VStack {
            Spacer()
            
            Rectangle()
                .fill(
                  LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]),
                    startPoint: .top,
                    endPoint: .bottom
                  )
                )
                .frame(height: 10)
                .padding(.bottom, 60)
        }
    }
}
#Preview {
    HomeView()

}
