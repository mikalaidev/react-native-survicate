package com.survicate.react;

import android.support.annotation.Nullable;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.survicate.surveys.Survicate;
import com.survicate.surveys.SurvicateEventListener;
import com.survicate.surveys.traits.UserTrait;

public class SurvicateBindingsModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    private void sendEvent(ReactApplicationContext reactContext, String eventName, @Nullable WritableMap params) {
        reactContext
            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
            .emit(eventName, params);
    }

    public SurvicateBindingsModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "SurvicateBindings";
    }

    @ReactMethod
    public void enterScreen(String screenName) {
        Survicate.enterScreen(screenName);
    }

    @ReactMethod
    public void leaveScreen(String screenName) {
        Survicate.leaveScreen(screenName);
     }

     @ReactMethod
    public void invokeEvent(String eventName) {
        Survicate.invokeEvent(eventName);
    }

    @ReactMethod
    public void setUserId(String userId) {
        Survicate.setUserTrait(new UserTrait.UserId(userId));
    }

    @ReactMethod
    public void setUserTrait(String userTrait, String value) {
        Survicate.setUserTrait(new UserTrait(userTrait, value));
    }

    @ReactMethod
    public void initialize() {
        Survicate.init(reactContext);
    }

    @ReactMethod
    public void reset() {
        Survicate.reset();
    }

    @ReactMethod
    public void startSurveyListeners() {
        Survicate.setEventListener(new SurvicateEventListener() {
            @Override
            public void onSurveyDisplayed(String surveyId) {
                WritableMap params = Arguments.createMap();
                params.putString("surveyId", surveyId);
                sendEvent(reactContext, "onSurveyDisplayed", params);
            }

            @Override
            public void onSurveyClosed(String surveyId) {
                WritableMap params = Arguments.createMap();
                params.putString("surveyId", surveyId);
                sendEvent(reactContext, "onSurveyClosed", params);
            }

            @Override
            public void onQuestionAnswered(@NonNull String surveyId, long questionId, SurvicateAnswer answer) {
                WritableMap params = Arguments.createMap();
                params.putString("surveyId", surveyId);
                params.putString("questionId", questionId);
                params.putString("answer", answer);
                sendEvent(reactContext, "onQuestionAnswered", params);
            }
        });
    }
}
