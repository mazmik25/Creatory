//
//  Role.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import Foundation

struct Role {
    let name: String
    
    static func generateRoles() -> [Role] {
        var roles = [Role]()
        
        roles.append(Role(name: "boy-1"))
        roles.append(Role(name: "boy-2"))
        roles.append(Role(name: "boy-3"))
        roles.append(Role(name: "boy-4"))
        roles.append(Role(name: "boy-5"))
        roles.append(Role(name: "boy-6"))
        roles.append(Role(name: "boy-7"))
        roles.append(Role(name: "boy-8"))
        roles.append(Role(name: "girl-1"))
        roles.append(Role(name: "girl-2"))
        roles.append(Role(name: "girl-3"))
        roles.append(Role(name: "girl-4"))
        roles.append(Role(name: "girl-5"))
        roles.append(Role(name: "girl-6"))
        roles.append(Role(name: "girl-7"))
        roles.append(Role(name: "girl-8"))
        
        return roles
    }
}
