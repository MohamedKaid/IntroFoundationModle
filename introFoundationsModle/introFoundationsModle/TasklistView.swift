//
//  TasklistView.swift
//  introFoundationsModle
//
//  Created by Mohamed Kaid on 11/21/25.
//

import SwiftUI


struct TasklistView: View {
    @ObservedObject var viewModel: ViewModel
   
    
    var body: some View {
        VStack{
            
            //         display the output from the foundations model
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }
            
            ScrollView(.vertical) {
                Text("Tasklist")
                    .font(Font.largeTitle)
                Text(viewModel.output)
                    .padding()
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    TasklistView(viewModel: ViewModel())
}
