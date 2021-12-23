//
//  User.swift
//  UI-402
//
//  Created by nyannyan0328 on 2021/12/23.
//

import SwiftUI

struct User: Identifiable,Hashable {
    var id = UUID().uuidString
    var profilePick : String
}

