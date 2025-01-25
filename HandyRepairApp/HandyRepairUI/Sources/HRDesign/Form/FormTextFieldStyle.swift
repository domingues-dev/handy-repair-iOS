//
//  FormTextFieldStyle.swift
//  HandyRepairUI
//
//  Created by Nicolá Domingues on 25/01/2025.
//

import SwiftUI

/// A `TextFieldStyle` that makes use of a `Section` to optionally display
///  a `FormHint` above the TextField and a `FormMessage` under it.
public struct FormTextFieldStyle: TextFieldStyle {
  let message: (any FormMessage)?
  let hint: (any FormHint)?
  
  public func _body(configuration: TextField<Self._Label>) -> some View {
    Section {
      configuration
    } header: {
      if let hint {
        Text(hint.text)
          .font(hint.font)
          .textCase(hint.textCase)
          .foregroundStyle(hint.color)
          .lineLimit(1)
      }
    } footer: {
      if let message {
        Text(message.text)
          .font(message.font)
          .foregroundStyle(message.color)
          .lineLimit(message.lineLimit, reservesSpace: message.reservesSpace)
      }
    }
  }
}

// MARK: Public initializers
public extension FormTextFieldStyle {
  init(message: any FormMessage, hint: (any FormHint)? = .none) {
    self.message = message
    self.hint = hint
  }
  
  init(hint: (any FormHint)? = .none) {
    self.message = .none
    self.hint = hint
  }
}
