//
//  AsyncButton.swift
//  HandyRepairUI
//
//  Created by Nicolá Domingues on 30/01/2025.
//

import SwiftUI

public struct AsyncButton<Label: View>: View {
  @State private var allowsHitTesting = true
  
  private let action: () async -> Void
  private let label: () -> Label
  
  public init(
    action: @escaping () async -> Void,
    @ViewBuilder label: @escaping () -> Label
  ) {
    self.action = action
    self.label = label
  }
  
  public var body: some View {
    Button {
      allowsHitTesting = false
      Task {
        await action()
        allowsHitTesting = true
      }
    } label: {
      label()
    }
    .allowsHitTesting(allowsHitTesting)
  }
}
