//
//  FormHint.swift
//  HandyRepairUI
//
//  Created by Nicolá Domingues on 25/01/2025.
//

import SwiftUI

public protocol FormHint {
  var text: String { get }
  var color: Color { get }
  var font: Font { get }
  var textCase: Text.Case? { get }
}

public extension FormHint {
  var color: Color { Color(.secondaryLabel) }
  var font: Font { .subheadline }
  var textCase: Text.Case? { .none }
}
