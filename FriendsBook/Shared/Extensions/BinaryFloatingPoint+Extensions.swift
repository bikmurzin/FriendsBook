//
//  Project: FriendsBook
//  File: BinaryFloatingPoint+Extensions.swift
//  Created by: Robert Bikmurzin
//  Date: 30.01.2024
//

extension BinaryFloatingPoint {
    var dms: (degrees: Int, minutes: Int, seconds: Int) {
        var seconds = Int(self * 3600)
        let degrees = seconds / 3600
        seconds = abs(seconds % 3600)
        return (degrees, seconds / 60, seconds % 60)
    }
}

