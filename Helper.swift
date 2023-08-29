//
//  Helper.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 21/08/23.
//

import Foundation

class Helper {
    func replaceSnakeCaseWithNormalString(snakeCaseString: String) -> String {
        let normalWords = snakeCaseString.replacingOccurrences(of: "-", with: " ")
        return normalWords
    }
}
