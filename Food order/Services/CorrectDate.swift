//
//  CorrectDate.swift
//  Food order
//
//  Created by Максим Зыкин on 13.07.2023.
//

import Foundation

protocol CorrectDateProtocol {
    func сorDate() -> String
}

class CorrectDateModel: CorrectDateProtocol {
   
    func сorDate() -> String {
        let mytime = Date()
        let format = DateFormatter()
        format.dateStyle = .long
        let сorrectData = (format.string(from: mytime))
        return сorrectData
    }
}
