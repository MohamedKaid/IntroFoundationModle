//
//  loadingView.swift
//  introFoundationsModle
//
//  Created by Mohamed Kaid on 11/21/25.
//

import SwiftUI
import Lottie

struct loadingView: View {
//    @ObservedObject var viewModel: ViewModel
//    @Binding var isPresented: Bool
    @State var animationList = ["AmoungUs", "catWheel", "catLoading", "loading", "loadingBot", "Loadingtext"]

    

    
    var body: some View {
        LottieView(animation: .named("loading"))
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
    }
    
    
    
    var randomAnimation: String {
        animationList.randomElement() ?? "loading"
    }
}





#Preview {
    loadingView()
}
