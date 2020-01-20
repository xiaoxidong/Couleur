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
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Spacer()
        .frame(width: Constants.ColorPreviewSize, height: Constants.ColorPreviewSize)
        .background(Color(color))
    }
    .buttonStyle(BorderlessButtonStyle())
  }
}

struct PickerButton_Previews: PreviewProvider {
  static var previews: some View {
    PickerButton(color: .blue, action: {})
  }
}