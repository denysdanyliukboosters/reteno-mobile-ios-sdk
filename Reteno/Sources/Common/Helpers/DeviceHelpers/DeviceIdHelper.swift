//
//  DeviceIdHelper.swift
//  Reteno
//
//  Created by Serhii Prykhodko on 28.09.2022.
//

import Foundation
import UIKit

struct DeviceIdHelper {
    
    private init() {}
    
    static func actualizeDeviceId() {
        guard let id = UIDevice.current.identifierForVendor, id.uuidString != deviceId() else { return }
        
        let storage = StorageBuilder.build()
        storage.set(value: id.uuidString, forKey: StorageKeys.deviceId.rawValue)
        RetenoNotificationsHelper.isSubscribedOnNotifications { isSubscribed in
            storage.set(value: isSubscribed, forKey: StorageKeys.isPushSubscribed.rawValue)
            Reteno.upsertDevice(Device(externalUserId: ExternalUserIdHelper.getId(), isSubscribedOnPush: isSubscribed))
        }
    }
    
    static func deviceId() -> String? {
        StorageBuilder.build().getValue(forKey: StorageKeys.deviceId.rawValue)
    }
    
}
