//
//  SignInScreen.swift
//  Authentication
//
//  Created by Nicolá Domingues on 27/01/2025.
//

import SwiftUI

public struct SignInButton: View {
  @Environment(\.colorScheme)
  private var colorScheme
  
  private let action: () -> Void
  
  public init(action: @escaping () -> Void) {
    self.action = action
  }
  
  public var body: some View {
    Button {
      action()
    } label: {
      ViewThatFits {
        Label(Localization.signInButtonTitle, systemImage: "apple.logo")
          .padding(.horizontal)
          .frame(height: 44)

        Image(systemName: "apple.logo")
          .padding()
          .frame(width: 44, height: 44)
          .aspectRatio(1, contentMode: .fit)
      }
      .foregroundStyle(colorScheme == .light ? Color.white : .black)
      .font(.title3)
      .background(.ultraThinMaterial)
      .background(colorScheme == .light ? Color.black.opacity(0.4) : .white.opacity(0.4) ,in: .rect(cornerRadius: 10))
      .shadow(radius: 1.5, x: 2, y: 2)
    }
    .environment(\.colorScheme, .dark)
  }
}

#Preview {
  ZStack {
    LinearGradient(colors: [.red, .yellow, .green], startPoint: .bottomLeading, endPoint: .topTrailing)
      .ignoresSafeArea()
    HStack {
      Text("Hello world!")
//      Text("Hello world!")
      SignInButton(action: {})
    }
  }
}
