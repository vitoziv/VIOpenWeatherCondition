//
//  VIOpenWeatherCondition.h
//  VIOpenWeatherCondition
//
//  Created by Vito on 13-9-23.
//  Copyright (c) 2013年 Vito. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Condition information from: http://bugs.openweathermap.org/projects/api/wiki/Weather_Condition_Codes **/
typedef NS_ENUM(NSUInteger, ConditionType) {
    ConditionTypeSkyIsClear = 0,
    ConditionTypeFewClouds,
    ConditionTypeScatteredClouds,
    ConditionTypeBrokenClouds,
    ConditionTypeShowerRain,
    ConditionTypeRain,
    ConditionTypeThunderstorm,
    ConditionTypeSnow,
    ConditionTypeMist,
    
    //Extreme include: tornado, tropical storm, hurricane, cold, hot, windy, hail
    ConditionTypeExtreme,
    
    //Unknown, No data get or something wrong...
    ConditionTypeUnknown
};

@interface VIOpenWeatherCondition : NSObject

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *appId;

+ (void)setupWithCityName:(NSString *)cityName appid:(NSString *)appid;
+ (instancetype)sharedCondition;
- (void)getWeatherConditionCompletion:(void(^)(ConditionType conditionType))completion;

@end
