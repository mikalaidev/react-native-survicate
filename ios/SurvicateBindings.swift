//
//  SurvicateBindings.swift
//  SurvicateBindings
//
//  Created by Valery Piniazik on 8.02.21.
//

import Foundation
import Survicate

@objc(SurvicateBindings)
class SurvicateBindings: NSObject {
  private var survicateDelegate: FlutterSurvicateDelegate?
  @objc(sampleMethod)
  func sampleMethod() -> Void {
    Survicate.shared.reset()
    Survicate.shared.initialize()
    self.survicateDelegate = FlutterSurvicateDelegate()
    Survicate.shared.delegate = self.survicateDelegate
    Survicate.shared.invokeEvent(name: "event")
    Survicate.shared.reset()
  }
}

class FlutterSurvicateDelegate : RCTEventEmitter, SurvicateDelegate {
    
    override func supportedEvents() -> [String]! {
            return ["onIncrement"]
        }

    private func send() {
        sendEvent(withName: "onIncrement", body: ["count": 1])
    }
    
    @objc
    public func surveyDisplayed(surveyId: String) {
        // self.send()
        NSLog("surveyDisplayed")
    }

    public func questionAnswered(surveyId: String, questionId: Int, answer: SurvicateAnswer) {
        NSLog("questionAnswered")
    }

    public func surveyCompleted(surveyId: String) {
        NSLog("surveyCompleted")
    }

    public func surveyClosed(surveyId: String) {
       NSLog("surveyCompleted")
    }
}
