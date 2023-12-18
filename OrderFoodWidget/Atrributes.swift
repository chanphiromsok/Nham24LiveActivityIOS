import ActivityKit
import WidgetKit
import SwiftUI

struct OrderFoodWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var status: String
        var status_code: Int
    }

    // Fixed non-changing properties about your activity go here!
    public var orderId: Int
    var name: String
}
