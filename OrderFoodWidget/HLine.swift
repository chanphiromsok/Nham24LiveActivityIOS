import SwiftUI

// Ref https://stackoverflow.com/questions/68217631/circle-with-an-evenly-dotted-border-in-swiftui
struct HLine: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX, y: rect.midY))
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
    }
  }
}
