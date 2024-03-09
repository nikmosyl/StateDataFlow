//
//  ContentViewViewModel.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import Foundation
import Observation

@Observable
final class ContentViewViewModel {
    var counter = 3
    var timerState = TimerState.ready    
    
    private var timer: Timer?
    
    func buttonDidTapped() {
        switch timerState {
        case .ready:
            startTimer()
            timerState = .inProgress
        case .inProgress:
            break
        case .end:
            counter = 3
            timerState = .ready
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCounter),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            timerState = .end
        }
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}

extension ContentViewViewModel {
    enum TimerState: String {
        case ready = "Start"
        case inProgress = "Wait..."
        case end = "Reset"
    }
}
