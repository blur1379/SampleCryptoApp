//
//  HomeView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/14/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showPortfolio = false
    @State private var showPortfolioView = false
    
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    var body: some View {
       
            NavigationStack {
                ZStack {
                // background layer
                Color.theme.background
                    .sheet(isPresented: $showPortfolioView, content: {
                        PortfolioView()
                            .environmentObject(vm)
                    })
                
                // content layer
                VStack {
                    headerView()
                    
                    HomeStatsView(showPortfolio: $showPortfolio)
                    
                    SearchBarView(searchText: $vm.searchText)
                    
                    columnTitles()
                    
                    if !showPortfolio {
                        allCoinList()
                            .transition(.move(edge: .leading))
                    } else {
                        portfolioCoinList()
                            .transition(.move(edge: .trailing))
                    }
                    
                    Spacer(minLength: 0)
                }
                .background(
                    NavigationLink(isActive: $showDetailView, destination: { DetailLoadingView(coin: $selectedCoin) }, label: { EmptyView() })
                )
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}

extension HomeView {
    @ViewBuilder
    func headerView() -> some View {
        
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView = true
                    }
                }
                .background(CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(.degrees(showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func allCoinList() -> some View {
        List {
            ForEach(vm.allCoins) { coin in

                    CoinRowView(coin: coin, showHoldingColumns: false)
                    .onTapGesture {
                        segue(coin: coin)
                    }
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                       
            }
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    func portfolioCoinList() -> some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumns: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private func columnTitles() -> some View {
        HStack {
            HStack (spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
               
            }
            
            Spacer()
            if showPortfolio {
                HStack (spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation {
                        vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                    }
                }
            }
            
            HStack (spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .onTapGesture {
                withAnimation {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
            Button {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
                
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0))
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
        
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView = true
    }
}
