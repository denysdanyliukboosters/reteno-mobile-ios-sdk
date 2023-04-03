//
//  DeepLinksProcessor.swift
//  Reteno
//
//  Created by Serhii Prykhodko on 25.09.2022.
//

import UIKit

struct DeepLinksProcessor {
    
    @available(iOSApplicationExtension, unavailable)
    static func processLinks(
        wrappedUrl: URL?,
        rawURL: URL?,
        storage: KeyValueStorage = StorageBuilder.build(),
        scheduler: EventsSenderScheduler = Reteno.senderScheduler
    ) {
        guard let url = rawURL else { return }
        
        if let wrappedUrl = wrappedUrl {
            storage.appendLink(StorableLink(value: wrappedUrl.absoluteString, date: Date()))
            scheduler.forcePushEvents()
        }
        Reteno.linkHandler?(url) ?? UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
