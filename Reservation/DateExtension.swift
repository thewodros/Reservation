//
//  DateExtension.swift
//  Reservation
//
//  Created by Teddy Demilew on 9/19/17.
//  Copyright © 2017 Teddy Demilew. All rights reserved.
//

import Foundation

extension Date {
    func monthNameFull() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMMM")
        return df.string(from:self)
    }
    
    func dayThreeLetters() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("E")
        return df.string(from:self)
    }
    
    func dateMMDDYYYY() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("dd.MM.yyyy")
        return df.string(from: self)
    }
    
    func dateDD() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("dd")
        return df.string(from: self)
    }
    
    func dateDispaly() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("EEEE, MMM d, yyyy")
        return df.string(from: self)
    }
}
