//
//  LaunchActivityViewModel.swift
//  DeliveryLiveActivity
//
//  Created by Nour Gweda on 04/12/2022.
//

import Foundation
import ActivityKit

class LaunchActivityViewModel {
    @Published var currentID: String = ""

    func startActivity() {
        let orderAttributes = OrderAttributes(orderNumber: 26383, orderItems: "Burger & Milk Shake")
        //we don't have to set initial value here since we already declare it in the order attribute model as (.received)
        let initialContentState = OrderAttributes.ContentState()
        do {
            let activity = try Activity<OrderAttributes>.request(attributes: orderAttributes, contentState: initialContentState, pushType: nil)
            print("Activity is added , id: \(activity.id)")
            currentID = activity.id
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func updateLiveActivity(currentSelection: Status) {
        if let activity = Activity.activities.first(where: { (activity: Activity<OrderAttributes>) in
            activity.id == currentID
        }){
            print("Activity Updated 🐙")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                var updatedStatus = activity.contentState
                updatedStatus.status = currentSelection
                Task {
                    await activity.update(using: updatedStatus)
                }
            }
        }
    }

    func getMessage(status: Status) -> String {
        switch status {
        case .received:
            return "Order Received"
        case .progress:
            return "Order in Progress"
        case .ready:
            return "Order is Ready"
        }
    }
    
    func getSubMessage(status: Status) -> String {
        switch status {
        case .received:
            return "We just Received Your Order"
        case .progress:
            return "We Are Handcrafting Your Order"
        case .ready:
            return "We Crafted Your Order"
        }
    }
    
}
