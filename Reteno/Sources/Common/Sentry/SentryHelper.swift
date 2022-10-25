//
//  SentryHelper.swift
//  
//
//  Created by Serhii Prykhodko on 17.10.2022.
//

import Sentry

struct SentryHelper {
    
    private init() {}
    
    static func capture(error: Error) {
        let hub = prepareHub()
        hub?.capture(error: error)
    }
    
    static func capture(exeption: NSException) {
        let hub = prepareHub()
        hub?.capture(exception: exeption)
    }
    
    static func captureLog(title: String, count: Int) {
        let hub = prepareHub()
        hub?.capture(message: "Outdated \(title): - \(count)")
    }
    
    static private func prepareHub() -> SentryHub? {
        do {
            let options = try Sentry.Options(
                dict: ["dsn": "https://4d9bf85beb7443069b6882ba8ffdee24@sentry.reteno.com/4503999620841472"]
            )
            options.debug = true
            
            // Features turned off by default, but worth checking out
            options.enableAppHangTracking = true
            options.enableFileIOTracking = true
            
            let client = Client(options: options)
            let hub = SentryHub(client: client, andScope: nil)
            
            return hub
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }
    
}
