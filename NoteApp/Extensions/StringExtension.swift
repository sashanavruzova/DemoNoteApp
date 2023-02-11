//
//  StringExtension.swift
//  NoteApp
//
//  Created by aleksandranavruzova on 02.02.2023.
//

import Foundation

extension String {
  var trimmed: String {
    return trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
