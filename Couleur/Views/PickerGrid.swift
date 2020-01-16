//
//  PickerGrid.swift
//  Couleur
//
//  Created by HiDeo on 14/01/2020.
//  Copyright © 2020 HiDeoo. All rights reserved.
//

import SwiftUI

struct PickerGrid: View {
  let lineCount = Int(Constants.PickerPointCount + 2)

  var body: some View {
    ZStack {
      Path { path in
        for index in 0 ... lineCount {
          let offset = Constants.PickerPointSize * CGFloat(index) - 1
          path.move(to: CGPoint(x: offset, y: 0))
          path.addLine(to: CGPoint(x: offset, y: Constants.PickerSize))
        }

        for index in 0 ... lineCount {
          let offset = Constants.PickerPointSize * CGFloat(index) - 1
          path.move(to: CGPoint(x: 0, y: offset))
          path.addLine(to: CGPoint(x: Constants.PickerSize, y: offset))
        }
      }
      .stroke(Color.black.opacity(0.5))
      Path { path in
        let origin = floor(Constants.PickerPointCount / 2) * Constants.PickerPointSize - 2
        path.move(to: CGPoint(x: origin, y: origin))
        path.addLine(to: CGPoint(x: origin + Constants.PickerPointSize + 2, y: origin))
        path.addLine(to: CGPoint(x: origin + Constants.PickerPointSize + 2, y: origin + Constants.PickerPointSize + 2))
        path.addLine(to: CGPoint(x: origin, y: origin + Constants.PickerPointSize + 2))
        path.addLine(to: CGPoint(x: origin, y: origin - 0.5))
      }
      .stroke(Color.white)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
  }
}

struct PickerGrid_Previews: PreviewProvider {
  static var previews: some View {
    PickerGrid()
  }
}
