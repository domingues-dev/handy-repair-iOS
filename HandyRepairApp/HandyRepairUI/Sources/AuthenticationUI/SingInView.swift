//
//  SingInView.swift
//  HandyRepairUI
//
//  Created by Nicolá Domingues on 25/01/2025.
//

import SwiftUI

public struct SingInView: View {
  @Binding private var email: String
  
  public init(email: Binding<String>) {
    self._email = email
  }
  
  public var body: some View {
    Form {
      Image(systemName: "person.circle")
        .resizable()
        .scaledToFit()
        .listRowBackground(Color.clear)
        
      Section {
        TextField("Enter email", text: $email)
          .textContentType(.emailAddress)
          .keyboardType(.emailAddress)
          .listRowBackground(inputBackground)
      } footer: {
        Text("Wrong input")
          .foregroundStyle(.red)
          .lineLimit(2, reservesSpace: true)
      }
    }
    .background(Color(.systemGroupedBackground))
    .scrollContentBackground(.hidden)
  }
  
  private var inputBackground: some View {
    RoundedRectangle(cornerRadius: 10)
      .stroke(lineWidth: 3)
      .foregroundStyle(.red)
      .background(Color(.systemBackground))
  }
}

#Preview {
  @Previewable @State
  var email: String = ""
  SingInView(email: $email)
}

