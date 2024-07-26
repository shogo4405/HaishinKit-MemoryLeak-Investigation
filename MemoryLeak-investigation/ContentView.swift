//
//  ContentView.swift
//  MemoryLeak-investigation
//
//  Created by Shogo Endo on 2024/07/26.
//

import SwiftUI
import HaishinKit
import AVFoundation

struct ContentView: View {
    private var lfView: MTHKSwiftUiView!
    @ObservedObject var viewModel: ViewModel = .init()

    init() {
        lfView = MTHKSwiftUiView(rtmpStream: viewModel.stream)
    }

    var body: some View {
        ZStack {
            lfView
                .ignoresSafeArea()
                .onTapGesture { location in
                }
        }
        .onAppear {
            viewModel.prepare()
        }
        .onDisappear {
        }
    }
}

#Preview {
    ContentView()
}
