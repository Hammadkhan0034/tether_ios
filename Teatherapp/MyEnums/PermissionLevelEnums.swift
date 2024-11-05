//
//  PermissionLevelEnums.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 08-09-2024.
//

import Foundation


enum PermissionLevels: String{
    case fullAccess
    case limitedAccess
    case childAccess 
    
}

extension PermissionLevels{
    var getRequestValue: String{
        if(self == PermissionLevels.childAccess){
            return "child_access"
        }
        else if (self == PermissionLevels.limitedAccess){
            return "limited_access"
        }
        return "full_access"
        
    }
    var getValue: String{
        if(self == PermissionLevels.childAccess){
            return "Child Access"
        }
        else if (self == PermissionLevels.limitedAccess){
            return "Limited Access"
        }
        return "Full Access"
        
    }
}

