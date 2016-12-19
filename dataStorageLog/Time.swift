//
//  Date.swift
//  dataStorageLog
//
//  Created by Admin on 17.12.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

struct Time {
    func getFullTime() -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "d.M.y HH:mm:s.sss"
        return String(fmt.string(from: Date()))
    }
}
