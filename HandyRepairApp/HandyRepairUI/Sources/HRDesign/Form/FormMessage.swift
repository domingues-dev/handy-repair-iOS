//
//  FormMessage.swift
//  HandyRepairUI
//
//  Created by Nicolá Domingues on 25/01/2025.
//

import SwiftUI

public protocol FormMessage {
  var text: String { get }
  var color: Color { get }
  var font: Font { get }
  var lineLimit: Int { get }
  var reservesSpace: Bool { get }
}

public extension FormMessage {
  var color: Color { Color(.tertiaryLabel) }
  var font: Font { .footnote }
  var lineLimit: Int { 2 }
  var reservesSpace: Bool { true }
}
