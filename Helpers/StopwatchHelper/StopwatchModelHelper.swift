//
//  StopwatchModelHelper.swift
//  swiftui-run-behavior
//
//  Created by Leo Wirasanto Laia on 14/03/24.
//

import Foundation

class StopwatchModelHelper: ObservableObject {
    var timer: Timer?
    @Published var elapsedTime: TimeInterval = 0
    
    init() {
        startOrResume()
    }
    
    func startOrResume() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] stopwatchTimer in
            self?.elapsedTime += stopwatchTimer.timeInterval
        })
    }
    
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    func stop(_ onsTop: ((StopWatchResult) -> Void)? = nil) {
        timer?.invalidate()
        timer = nil
        onsTop?(StopWatchResult(elapsedTime: elapsedTime))
    }
    
    func formattedElapsedTime() -> String {
        let minutes = Int(elapsedTime) / 60 % 60
        let seconds = Int(elapsedTime) % 60
        let millis = Int(elapsedTime * 100) % 100
        
        return String(format: "%02d:%02d:%02d", minutes, seconds, millis)
    }
}

struct StopWatchResult {
    var minutes: Int
    var seconds: Int
    var millis: Int
    var formatted: String
    
    init(elapsedTime: TimeInterval) {
        self.minutes = Int(elapsedTime) / 60 % 60
        self.seconds = Int(elapsedTime) % 60
        self.millis = Int(elapsedTime * 100) % 100
        self.formatted = String(format: "%02d:%02d:%02d", minutes, seconds, millis)
    }
}
