//
//  WidgetView.swift
//  DeliveryLiveActivity
//
//  Created by Nour Gweda on 04/12/2022.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {
    
    let viewModel = LaunchActivityViewModel()
    let activityContext: ActivityViewContext<OrderAttributes>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("Green").gradient)
            VStack {
            HStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("In Store PickUp")
                    .foregroundColor(.white.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: -2) {
                    ForEach(["Burger","Shake"], id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background {
                                Circle()
                                    .fill(Color("Green"))
                                    .padding(-2)
                            }
                            .background {
                                Circle()
                                    .stroke(.white, lineWidth: 1.5)
                                    .padding(-2)
                            }
                    }
                }
            }
                
                HStack(alignment: .bottom, spacing: 0) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(viewModel.getMessage(status: activityContext.state.status))
                            .font(.title3)
                            .foregroundColor(.white)
                    
                        Text(viewModel.getSubMessage(status: activityContext.state.status))
                            .font(.caption2)
                            .foregroundColor(.white)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        ForEach(Status.allCases, id: \.self) { type in
                            Image(systemName: type.rawValue)
                                .font(.body)
                                .foregroundColor(activityContext.state.status == type ? Color("Green") : Color.white.opacity(0.7))
                                .frame(width: activityContext.state.status == type ? 45 : 32 , height: activityContext.state.status == type ? 45 : 32)
                                .background {
                                    Circle()
                                        .fill(activityContext.state.status == type ? Color.white : Color("Green").opacity(0.5))
                                }
                                .background (alignment: .bottom) {
                                    bottomArrow(status: activityContext.state.status, type: type)
                                        }
                                }.frame(maxWidth: .infinity)
                        }
                    .overlay(alignment: .bottom) {
                      Rectangle()
                            .fill(Color.white.opacity(0.6))
                            .frame(height: 2)
                            .offset(y: 12)
                            .padding(.horizontal, 15)
                    }
                    .padding(.leading, 15)
                    .padding(.trailing, -10)
                    .frame(maxWidth: .infinity)
                    }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 10) 
            }.padding(15)
            }
       }
    }



@ViewBuilder
func bottomArrow(status: Status, type: Status) -> some View {
    Image("arrowtriangle.down.fill")
        .font(.system(size: 15))
        .scaleEffect(x: 1.3)
        .offset(y: 6)
        .opacity(status == type ? 1 : 0)
        .foregroundColor(Color.white)
        .overlay(alignment: .bottom) {
            Circle()
                .fill(Color.white)
                .frame(width: 5, height: 5)
                .offset(y: 13)
        }
}
