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
  @objc(enterScreen:)
  func enterScreen(screenName: String) {
    Survicate.shared.enterScreen(value: screenName)
  }
  @objc(leaveScreen:)
  func leaveScreen(screenName: String) {
    Survicate.shared.leaveScreen(value: screenName)
  }
  @objc(invokeEvent:)
  func invokeEvent(eventName: String) {
    Survicate.shared.invokeEvent(name: eventName)
  }
  @objc(setUserId:)
  func setUserId(userId: String) {
    Survicate.shared.setUserTrait(UserTrait(withName: "user_id", value: userId))
  }
  @objc(setUserTrait::)
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
    self.rnSurvicateDelegate = RNSurvicateDelegate(emitter: self)
    Survicate.shared.delegate = self.rnSurvicateDelegate
  }
  override func supportedEvents() -> [String]! {
    return ["questionAnswered", "surveyDisplayed", "surveyCompleted", "surveyClosed"]
  }
}

class RNSurvicateDelegate : SurvicateDelegate {
    private var emitter: RCTEventEmitter!
    init(emitter: RCTEventEmitter) {
        self.emitter = emitter
    }
    public func surveyDisplayed(surveyId: String) {
        let arguments = ["surveyId": surveyId]
        emitter.sendEvent(withName: "surveyDisplayed", body: arguments)
    }

    public func questionAnswered(surveyId: String, questionId: Int, answer: SurvicateAnswer) {
        let answerMap = ["type": answer.type as Any, "id": answer.id as Any , "ids": answer.ids as Any , "value" : answer.value as Any] as [String : Any]
        let arguments = ["surveyId": surveyId, "questionId": questionId, "answer": answerMap] as [String : Any]
        emitter.sendEvent(withName: "questionAnswered", body: arguments)
    }

    public func surveyCompleted(surveyId: String) {
        let arguments = ["surveyId": surveyId]
        emitter.sendEvent(withName: "surveyCompleted", body: arguments)
    }

    public func surveyClosed(surveyId: String) {
        let arguments = ["surveyId": surveyId]
        emitter.sendEvent(withName: "surveyClosed", body: arguments)
    }
}
