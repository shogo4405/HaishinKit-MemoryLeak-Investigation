//
//  MemoryLeak_investigationApp.swift
//  MemoryLeak-investigation
//
//  Created by Shogo Endo on 2024/07/26.
//

import AVFoundation
import HaishinKit
import Logboard
import SwiftUI

let logger = LBLogger.with("MemoryLeak-investigation")

@main
struct MemoryLeak_investigationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Logboard.with(HaishinKitIdentifier).level = .trace
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            try session.setActive(true)
        } catch {
            logger.error(error)
        }
        return true
    }
}
