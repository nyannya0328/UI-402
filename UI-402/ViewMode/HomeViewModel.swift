//
//  HomeViewModel.swift
//  UI-402
//
//  Created by nyannyan0328 on 2021/12/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var fetchedUser : [User] = []
    
    @Published var displayUser : [User]?
    
    
    init() {
        fetchedUser = [
        
            User(profilePick: "User1"),
            User(profilePick: "User2"),
            User(profilePick: "User3"),
            User(profilePick: "User4"),
            User(profilePick: "User5"),
            User(profilePick: "User6"),
        
        
        
        
        ]
        
        displayUser = fetchedUser
    }
    
    
    func getIndex(user : User) -> Int{
        
        
        let index = displayUser?.firstIndex(where: { currentUser in
            
            currentUser.id == user.id
        }) ?? 0
        
        return index
        
        
        
    }
    
    
    
}

