//
//  ContentView.swift
//  SwiftUIGridView
//
//  Created by Kristaps Grinbergs on 26/05/2021.
//

import SwiftUI

struct ContentView: View {
  let data = (1...100).map { "Item \($0)" }
  
  private static let spacing: CGFloat = 20
  
  private let twoColumns = [
    GridItem(.flexible(), spacing: spacing),
    GridItem(.flexible())
  ]
  
  private let threeColumns = [
    GridItem(.fixed(width), spacing: spacing),
    GridItem(.fixed(width), spacing: spacing),
    GridItem(.fixed(width))
  ]
  
  private static let width: CGFloat = (UIScreen.main.bounds.size.width - 20*4) / 3
  
  
  private static let height: CGFloat = width * 0.8
  
  private var columns: [GridItem] {
    threeColumns
  }
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(data, id: \.self) { item in
          VStack(alignment:.leading, spacing: 0) {
            Image("assassins")
              .resizable()
              .frame(width: Self.width, height: Self.height)
            
            VStack(alignment:.leading, spacing: 5) {
              Text(item)
                .font(.subheadline)
              
              HStack(spacing: 2) {
                Text("10€ / day")
                  .foregroundColor(.green)
                  
                
                Spacer()
                
                Image(systemName: "star.fill")
                Text("5")
              }
              .font(.caption)
            }
            .padding(5)
            .padding(.vertical, 4)
          }
          .background(Color.white)
          .shadow(radius: 5)
        }
        
      }
      .padding(.horizontal)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
