
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
@interface RCT_EXTERN_MODULE(SurvicateBindings, RCTEventEmitter)

RCT_EXTERN_METHOD(enterScreen:(NSString *)screenName)
RCT_EXTERN_METHOD(leaveScreen:(NSString *)screenName)
RCT_EXTERN_METHOD(invokeEvent:(NSString *)eventName)
RCT_EXTERN_METHOD(setUserId:(NSString *)userId)
RCT_EXTERN_METHOD(setUserTrait:(NSString *)traitName value:(NSString *)value)
RCT_EXTERN_METHOD(initialize)
RCT_EXTERN_METHOD(reset)
RCT_EXTERN_METHOD(startSurveyListeners)

@end
