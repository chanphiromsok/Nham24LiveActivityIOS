import SwiftUI

struct StepperView: View {
  var iconName: String
  var isStepped:Bool
  var showLine: Bool=true
  var body: some View{
    Group{
      if(showLine){
        HLine()
          .stroke(style: StrokeStyle(lineWidth: 5,lineCap: .round, dash: [0,0]))
          .foregroundColor(isStepped ? Color("primary") : .gray)
      }
      
      Image(iconName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 15, height: 15)
        .clipShape(Circle())
        .background(Circle().fill(isStepped ? Color("primary") : .gray).frame(width: 25, height: 25))
    }
  }
}
