//
//  LaunchLiveActivity.swift
//  DeliveryLiveActivity
//
//  Created by Nour Gweda on 04/12/2022.
//

import SwiftUI

struct LaunchLiveActivity: View {
    
    let viewModel = LaunchActivityViewModel()
    @State var currentID: String = ""
    @State var currentSelection: Status = .received
    
    var body: some View {
        VStack(spacing: 15) {
            Button("Launch Activity") {
                viewModel.startActivity()
            }
            
            Button("Order is Received") {
                currentSelection = .received
                viewModel.updateLiveActivity(currentSelection: currentSelection)
            }
            
            Button("Order is in Progress") {
                currentSelection = .progress
                viewModel.updateLiveActivity(currentSelection: currentSelection)
            }
            
            Button("Order is Ready") {
                currentSelection = .ready
                viewModel.updateLiveActivity(currentSelection: currentSelection)
            }

        }
    }
}



