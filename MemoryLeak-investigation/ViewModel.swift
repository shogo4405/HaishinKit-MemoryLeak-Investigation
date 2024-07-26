//
//  ViewModel.swift
//  MemoryLeak-investigation
//
//  Created by Shogo Endo on 2024/07/26.
//

import Foundation
import AVFoundation
import UIKit
import HaishinKit

final class ViewModel: ObservableObject {
    lazy var connection: RTMPConnection = .init()
    lazy var stream: RTMPStream = {
        let stream = RTMPStream(connection: connection)
        stream.frameRate = 30.0
        stream.sessionPreset = .hd1280x720
        stream.videoMixerSettings.mode = .offscreen
        stream.screen.size = .init(width: 1280, height: 720)
        stream.screen.backgroundColor = UIColor.white.cgColor
        stream.screen.startRunning()
        stream.isMultiTrackAudioMixingEnabled = true
        //_ = stream.registerVideoEffect(backgroundVideoEffect)
        return stream
    }()

    func prepare() {
        stream.attachAudio(AVCaptureDevice.default(for: .audio)) { _, error in
            if let error {
                logger.error(error)
            }
        }
        stream.attachCamera(AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)) { _, error  in
            if let error {
                logger.error(error)
            }
        }
    }
}
