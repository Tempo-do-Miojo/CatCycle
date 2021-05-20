//
//  CCTextField.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 20/05/21.
//

import SwiftUI
// swiftlint:disable identifier_name

struct CCTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.ccGray3)
            .cornerRadius(6)
    }
}
