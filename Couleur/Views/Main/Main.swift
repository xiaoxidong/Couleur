//
//  Main.swift
//  Couleur
//
//  Created by HiDeo on 09/01/2020.
//  Copyright © 2020 HiDeoo. All rights reserved.
//

import SwiftUI

struct Main: View {
  @EnvironmentObject var appModel: AppModel

  @State private var showPermissionAlert = false
  @State private var showColorFormatPicker = false

  private let mainViewPosition = CGPoint(x: Constants.MainWindowSize.width / 2, y: Constants.MainWindowSize.height / 2)

  var body: some View {
    ZStack {
      StackedView {
        ColorFormatPicker(hidePicker: hideColorFormatPicker)
      }
      VStack(spacing: 0) {
        PickerButton(color: appModel.selectedColor.raw, action: pickColor)
        ColorExporter(color: appModel.selectedColor, showColorFormatPicker: self.$showColorFormatPicker)
        ColorEditor(color: $appModel.selectedColor, componentsEditorType: $appModel.componentsEditorType)
      }
      .transition(.move(edge: .leading))
      .background(Color("windowBackground"))
      .position(
        x: showColorFormatPicker ?
          mainViewPosition.x - Constants.MainWindowSize.width + Constants.StackedViewOffset :
          mainViewPosition.x,
        y: mainViewPosition.y
      )
    }
    .background(Color("windowAltBackground"))
    .frame(height: Constants.MainWindowSize.height, alignment: .topLeading)
    .alert(isPresented: $showPermissionAlert) {
      getPermissionsAlert(action: {
        self.showPicker()
        })
    }
  }

  func pickColor() {
    if !Permissions.canRecordScreen() {
      showPermissionAlert = true
    } else {
      showPicker()
    }
  }

  func showPicker() {
    let pickerWindow = NSWindow(
      contentRect: NSRect(x: 0, y: 0, width: Constants.PickerDimension, height: Constants.PickerDimension),
      styleMask: [],
      backing: .buffered, defer: false
    )

    pickerWindow.center()
    pickerWindow.isOpaque = false
    pickerWindow.backgroundColor = .clear
    pickerWindow.contentView = NSHostingView(rootView: ColorPicker(window: pickerWindow).environmentObject(appModel))

    pickerWindow.makeKeyAndOrderFront(nil)
  }

  func hideColorFormatPicker(_ format: ColorFormatter.Format?) {
    withAnimation {
      showColorFormatPicker = false
    }

    if let newFormat = format {
      print(newFormat)
    }
  }
}

struct Main_Previews: PreviewProvider {
  static var previews: some View {
    Main()
  }
}
