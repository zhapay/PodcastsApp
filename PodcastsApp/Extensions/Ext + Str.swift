//
//  Ext + Str.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 31.01.2022.
//

import UIKit

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}


