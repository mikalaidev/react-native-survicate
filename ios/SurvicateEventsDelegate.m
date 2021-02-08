#import "SurvicateEventsDelegate.h"
@import Survicate;

@interface SurvicateEventsDelegate () <SurvicateDelegate>
@end


@implementation SurvicateEventsDelegate

- (id)init{
    self = [super init];
    return self;
}

- (void)questionAnsweredWithSurveyId:(NSString * _Nonnull)surveyId questionId:(NSInteger)questionId answer:(SurvicateAnswer * _Nonnull)answer {
    NSLog(@"questionAnsweredWithSurveyId");
}

- (void)surveyClosedWithSurveyId:(NSString * _Nonnull)surveyId {
    NSLog(@"surveyClosedWithSurveyId");
}

- (void)surveyCompletedWithSurveyId:(NSString * _Nonnull)surveyId {
    NSLog(@"surveyCompletedWithSurveyId");
}

- (void)surveyDisplayedWithSurveyId:(NSString * _Nonnull)surveyId {
    NSLog(@"surveyDisplayedWithSurveyId");
}

@end
