//
//  ContentView.swift
//  Nham24
//
//  Created by rom on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 50, alignment: .leading)

                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
