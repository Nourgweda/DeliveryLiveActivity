//
//  DeliveryStatus.swift
//  DeliveryStatus
//
//  Created by Nour Gweda on 04/12/2022.
//

import WidgetKit
import SwiftUI

struct DeliveryStatus: Widget {
    let kind: String = "OrderStatus"

    var body: some WidgetConfiguration {

        ActivityConfiguration(for: OrderAttributes.self) { context in
            WidgetView(activityContext: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                }
                
                DynamicIslandExpandedRegion(.center) {
                    WidgetView(activityContext: context)
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                }
                
            } compactLeading: {
                // Create the compact leading presentation.
                // ...
            } compactTrailing: {
                // Create the compact trailing presentation.
                // ...
            } minimal: {
                // Create the minimal presentation.
                // ...
            }
            .keylineTint(.yellow)
        }

    }
}




