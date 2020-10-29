//
//  Array+Only.swift
//  Memorize
//
//  Created by Ces Mejia on 25/10/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
