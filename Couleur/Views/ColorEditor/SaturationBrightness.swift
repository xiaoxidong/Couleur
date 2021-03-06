//
//  SaturationBrightness.swift
//  Couleur
//
//  Created by HiDeo on 26/01/2020.
//  Copyright © 2020 HiDeoo. All rights reserved.
//

import SwiftUI

struct SaturationBrightness: View {
  @Binding var color: HSBColor

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ZStack {
          LinearGradient(
            gradient: Gradient(
              colors: [Color(HSBColor(hue: self.color.hue, saturation: 1, brightness: 1, alpha: 1)), .white]
            ),
            startPoint: .trailing,
            endPoint: .leading
          )
          LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
          Pointer()
            .position(self.getPointerPosition(containerSize: geometry.size))
        }
        .cornerRadius(Constants.ControlSmallCornerRadius)
      }
      .gesture(DragGesture(minimumDistance: 0).onChanged { event in
        Pointer.onDragStart()

        self.updateSaturationBrightness(position: event.location, size: geometry.size)
      }.onEnded { _ in
        Pointer.onDragEnd()
      })
    }
  }

  func getPointerPosition(containerSize: CGSize) -> CGPoint {
    CGPoint(x: containerSize.width * color.saturation, y: containerSize.height * (1 - color.brightness))
  }

  func updateSaturationBrightness(position: CGPoint, size: CGSize) {
    color.setSaturationAndBrightness(
      max(0, min(1, position.x / size.width)),
      1 - max(0, min(1, position.y / size.height))
    )
  }
}

struct SaturationBrightness_Previews: PreviewProvider {
  static var previews: some View {
    SaturationBrightness(color: .constant(HSBColor(.blue)))
  }
}
