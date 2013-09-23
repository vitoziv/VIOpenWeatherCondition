//
//  VIOpenWeatherCondition.m
//  VIOpenWeatherCondition
//
//  Created by Vito on 13-9-23.
//  Copyright (c) 2013年 Vito. All rights reserved.
//

#import "VIOpenWeatherCondition.h"

@interface VIOpenWeatherCondition()

@property (nonatomic, strong) NSDictionary *conditionTypesDic;

@end

@implementation VIOpenWeatherCondition

+ (void)setupWithCityName:(NSString *)cityName appid:(NSString *)appid {
    [VIOpenWeatherCondition sharedCondition].cityName = cityName;
    [VIOpenWeatherCondition sharedCondition].appId = appid;
}

+ (instancetype)sharedCondition {
    static VIOpenWeatherCondition *_sharedCondition = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedCondition = [[VIOpenWeatherCondition alloc] init];
        _sharedCondition.conditionTypesDic = @{
                                               @800: @(ConditionTypeSkyIsClear),
                                               @801: @(ConditionTypeFewClouds),
                                               @802: @(ConditionTypeScatteredClouds),@803: @(ConditionTypeScatteredClouds),
                                               @804: @(ConditionTypeBrokenClouds),
                                               @300: @(ConditionTypeShowerRain),@301: @(ConditionTypeShowerRain),@302: @(ConditionTypeShowerRain),@310: @(ConditionTypeShowerRain),@311: @(ConditionTypeShowerRain),@312: @(ConditionTypeShowerRain),@321: @(ConditionTypeShowerRain),@520: @(ConditionTypeShowerRain),@521: @(ConditionTypeShowerRain),@522: @(ConditionTypeShowerRain),
                                               @500: @(ConditionTypeRain),@501: @(ConditionTypeRain),@502: @(ConditionTypeRain),@503: @(ConditionTypeRain),@504: @(ConditionTypeRain),
                                               @600: @(ConditionTypeSnow),@601: @(ConditionTypeSnow),@602: @(ConditionTypeSnow),@611: @(ConditionTypeSnow),@621: @(ConditionTypeSnow),@511: @(ConditionTypeSnow),
                                               @201: @(ConditionTypeThunderstorm),@202: @(ConditionTypeThunderstorm),@211: @(ConditionTypeThunderstorm),@212: @(ConditionTypeThunderstorm),@200: @(ConditionTypeThunderstorm),@210: @(ConditionTypeThunderstorm),@221: @(ConditionTypeThunderstorm),@230: @(ConditionTypeThunderstorm),@231: @(ConditionTypeThunderstorm),@232: @(ConditionTypeThunderstorm),
                                               @701: @(ConditionTypeMist),@711: @(ConditionTypeMist),@721: @(ConditionTypeMist),@731: @(ConditionTypeMist),@741: @(ConditionTypeMist),
                                               @900: @(ConditionTypeExtreme), @901: @(ConditionTypeExtreme), @902: @(ConditionTypeExtreme), @905: @(ConditionTypeExtreme), @903: @(ConditionTypeExtreme), @904: @(ConditionTypeExtreme), @906: @(ConditionTypeExtreme)};
    });
    
    return _sharedCondition;
}

- (void)getWeatherConditionCompletion:(void(^)(ConditionType conditionType))completion {
    if (self.cityName) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            ConditionType conditionType = ConditionTypeUnknown;
            
            NSString *url = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@", self.cityName, self.appId];
            NSLog(@"url: %@", url);
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            NSDictionary *resultJSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if (resultJSON && [resultJSON[@"weather"] isKindOfClass:[NSArray class]]) {
                NSArray *weathers = resultJSON[@"weather"];
                if (weathers.count > 0) {
                    NSUInteger conditionCode = [weathers[0][@"id"] integerValue];
                    conditionType = [self.conditionTypesDic[@(conditionCode)] integerValue];
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) completion(conditionType);
            });
        });
    }
}

@end
