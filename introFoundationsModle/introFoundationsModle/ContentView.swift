//
//  ContentView.swift
//  introFoundationsModle
//
//  Created by Mohamed Kaid on 11/21/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @FocusState private var isTextEditorFocused: Bool
    @State var push: Bool = false

    var body: some View {
        NavigationStack {
            ZStack{
                Color.BG
                    .ignoresSafeArea(.all)
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("What do you need help with:")
                        .font(.title)
                    
                    TextEditor(text: $viewModel.userInput)
                        .padding()
                        .frame(maxHeight: 900)
                    
                    Button {
                        Task {
                            await viewModel.runModel()
                        }
                        push=true
                    } label: {
                        Label("Send", systemImage: "paperplane")
                    }
                    .buttonStyle(.bordered)
                    .tint(Color.black)
                    .disabled(viewModel.isLoading)   // disable while loading
                    
                    NavigationLink(
                        destination: TasklistView(viewModel: viewModel),
                    
                    isActive: $push
                    ){EmptyView()}
                        .hidden()
                    
                    
                    //         display the output from the foundations model
//                    if let error = viewModel.errorMessage {
//                        Text(error)
//                            .foregroundStyle(.red)
//                    }
//                    
//                    ScrollView(.vertical) {
//                        Text("Tasklist")
//                            .font(Font.largeTitle)
//                        Text(viewModel.output)
//                            .padding()
//                            .foregroundStyle(.black)
//                    }
                    
                }
                .padding()
                .onTapGesture {
                    isTextEditorFocused = false
                }
            }
            
                    .popover(isPresented: $viewModel.isLoading) {
                        loadingView()
                    }
        }
    }
}

#Preview {
    ContentView()
}
