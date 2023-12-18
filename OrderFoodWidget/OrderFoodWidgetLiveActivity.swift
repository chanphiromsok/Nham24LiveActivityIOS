//
//  OrderFoodWidgetLiveActivity.swift
//  OrderFoodWidget
//
//  Created by rom on 6/11/23.
//

import ActivityKit
import WidgetKit
import SwiftUI



struct OrderFoodWidgetLiveActivity: Widget {
  
  var body: some WidgetConfiguration {
    
    ActivityConfiguration(for: OrderFoodWidgetAttributes.self) { context in
      // Lock screen/banner UI goes here
      let status=context.state.status
      let statusCode=context.state.status_code
      
      
      VStack {
        HStack{
          VStack(alignment: .leading){
            Text("Nham24")
              .bold()
              .font(.headline)
              .foregroundColor(Color("primary"))
            Spacer().frame(height: 5)
            Text("\(status)")
              .font(.system(size: 12))
              .foregroundColor(Color(.gray))
            
          }
          Spacer()
          Image("icon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30,height: 30, alignment: .leading)
            .cornerRadius(3)
        }
        Spacer().frame(height: 20)
        HStack{
          StepperView(iconName: "step0", isStepped: true,showLine: false)
          StepperView(iconName: "step1", isStepped: statusCode>=2)
          StepperView(iconName: "step2", isStepped: statusCode>=4)
          StepperView(iconName: "step3", isStepped: statusCode==17 || (statusCode==5) || (statusCode==6 ))
          StepperView(iconName: "step4", isStepped: statusCode>=5 && !(statusCode==17))
          StepperView(iconName: "step5", isStepped: statusCode==6 && !(statusCode==17))
        }
        
      }
      .padding(20)
      .activitySystemActionForegroundColor(Color.black)
      .activityBackgroundTint(Color.white)
      
      
    } dynamicIsland: { context in
      DynamicIsland {
        // Expanded UI goes here.  Compose the expanded UI through
        // various regions, like leading/trailing/center/bottom
        DynamicIslandExpandedRegion(.leading) {
          Image("icon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 44,height: 44, alignment: .leading)
            .cornerRadius(22)
        }
        DynamicIslandExpandedRegion(.trailing) {
          Text("Nham24")
            .font(.headline)
            .fontWeight(.bold)
        }
        DynamicIslandExpandedRegion(.bottom) {
          Text("Superapp")
          // more content
        }
      } compactLeading: {
        Image("icon")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 24,height: 24, alignment: .leading)
          .cornerRadius(12)
      } compactTrailing: {
        // empty right
        
      } minimal: {
        Image("icon")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 24,height: 24, alignment: .leading)
          .cornerRadius(12)
      }
      .widgetURL(URL(string: "http://www.apple.com"))
      .keylineTint(Color.red)
    }
  }
}



struct OrderFoodWidgetLiveActivity_Previews: PreviewProvider {
  static let attributes = OrderFoodWidgetAttributes(orderId: 200,name: "Me")
  static let contentState = OrderFoodWidgetAttributes.ContentState(status: "Accepted",status_code: 4)
  
  static var previews: some View {
    attributes
      .previewContext(contentState, viewKind: .dynamicIsland(.compact))
      .previewDisplayName("Island Compact")
    attributes
      .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
      .previewDisplayName("Island Expanded")
    attributes
      .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
      .previewDisplayName("Minimal")
    attributes
      .previewContext(contentState, viewKind: .content)
      .previewDisplayName("Notification")
  }
}
