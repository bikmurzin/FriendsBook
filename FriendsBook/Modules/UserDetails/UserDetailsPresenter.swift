//
//  Project: FriendsBook
//  File: UserDetailsPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

protocol UserDetailsPresentationLogic: AnyObject {
    
}

final class UserDetailsPresenter {
    weak var viewController: UserDetailsDisplayLogic?
}

extension UserDetailsPresenter: UserDetailsPresentationLogic {
    
}

/*
 
 // функции пересчета координат из DD.DDDDDD в DD MM SS.SS:

 // Широта:
 func latCoordConvertDDtoDMS(latitude: Double) -> String {
     var latSeconds = latitude * 3600
     let latDegrees = Int(latSeconds / 3600)
     latSeconds = abs(latSeconds.truncatingRemainder (dividingBy: 3600))
     let latMinutes = Int(latSeconds / 60)
     latSeconds = latSeconds.truncatingRemainder (dividingBy: 60)
     return String(
         format: "%@%02d° %02d' %05.2f\"",
         //format: "%@ %.2f° %.2f' %.2f",
         latDegrees >= 0 ? "N" : "S",
         abs(latDegrees),
         latMinutes,
         latSeconds
     )
 }

 // Долгота:
 func lonCoordConvertDDtoDMS(longitude: Double) -> String {
     var longSeconds = longitude * 3600
     let longDegrees = Int(longSeconds / 3600)
     longSeconds = abs(longSeconds.truncatingRemainder (dividingBy: 3600))
     let longMinutes = Int(longSeconds / 60)
     longSeconds = longSeconds.truncatingRemainder (dividingBy: 60)
     return String(
         format: "%@%03d° %02d' %05.2f\"",
         longDegrees >= 0 ? "E" : "W",
         abs(longDegrees),
         longMinutes,
         longSeconds
     )
 }
 
 */
