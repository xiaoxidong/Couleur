//
//  PickerButton.swift
//  Couleur
//
//  Created by HiDeo on 19/01/2020.
//  Copyright © 2020 HiDeoo. All rights reserved.
//

import SwiftUI

struct PickerButton: View {
  let color: NSColor
  let action: Action

  var body: some View {
    Button(action: action) {
      ZStack {
        TransparencyLayer()
          .frame(width: Constants.MainWindowSize.width, height: Constants.ColorPreviewHeight)
        Spacer()
          .frame(width: Constants.MainWindowSize.width, height: Constants.ColorPreviewHeight)
          .background(Color(color))
      }
    }
    .buttonStyle(BorderlessButtonStyle())
  }
}

struct PickerButton_Previews: PreviewProvider {
  static var previews: some View {
    PickerButton(color: .blue, action: {})
  }
}
