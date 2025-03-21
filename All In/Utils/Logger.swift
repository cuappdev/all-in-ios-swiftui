//
//  Logger.swift
//  All In
//
//  Created by Caitlyn Jin on 11/17/24.
//

import OSLog

/// Configures log categories for All In.
extension Logger {

    private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs related to views.
    static let views = Logger(subsystem: subsystem, category: "views")

}
