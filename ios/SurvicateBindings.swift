//
//  SurvicateBindings.swift
//  SurvicateBindings
//
//  Created by Valery Piniazik on 8.02.21.
//

import Foundation
import Survicate

@objc(SurvicateBindings)
class SurvicateBindings: RCTEventEmitter {
  private var rnSurvicateDelegate: RNSurvicateDelegate?
  @objc(enterScreen)
  func enterScreen(screenName: String) {
    Survicate.shared.enterScreen(value: screenName)
  }
  @objc(leaveScreen)
  func leaveScreen(screenName: String) {
    Survicate.shared.leaveScreen(value: screenName)
  }
  @objc(invokeEvent)
  func invokeEvent(eventName: String) {
    Survicate.shared.invokeEvent(name: eventName)
  }
  @objc(setUserId)
  func setUserId(userId: String) {
    Survicate.shared.setUserTrait(UserTrait.userId(value: userId))
  }
  @objc(setUserTrait)
  func setUserTrait(userTrait: String, value: String) {
    Survicate.shared.setUserTrait(UserTrait(withName: userTrait, value: value))
  }
  @objc(setUserTrait)
  func setUserTrait(userTrait: String, value: String) {
    Survicate.shared.setUserTrait(UserTrait(withName: userTrait, value: value))
  }
  @objc(initialize)
  func initialize() {
    Survicate.shared.initialize()
  }
  @objc(reset)
  func reset() {
    Survicate.shared.reset()
  }
  @objc(startSurveyListeners)
  func startSurveyListeners() {
    self.rnSurvicateDelegate = RNSurvicateDelegate()
    Survicate.shared.delegate = self.survicateDelegate
  }
}

class RNSurvicateDelegate : SurvicateDelegate {
    private var emitter: RCTEventEmitter!
    init(emitter: RCTEventEmitter) {
        self.emitter = emitter
    }
    public func surveyDisplayed(surveyId: String) {
        emitter.sendEvent(withName: "surveyDisplayed", body: "test")
    }

    public func questionAnswered(surveyId: String, questionId: Int, answer: SurvicateAnswer) {
        emitter.sendEvent(withName: "questionAnswered", body: "test")
    }

    public func surveyCompleted(surveyId: String) {
        emitter.sendEvent(withName: "surveyCompleted", body: "test")
    }

    public func surveyClosed(surveyId: String) {
        emitter.sendEvent(withName: "surveyClosed", body: "test")
    }
}
