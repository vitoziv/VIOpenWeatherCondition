//
//  ViewController.m
//  VIOpenWeatherConditionDemo
//
//  Created by Vito on 13-9-23.
//  Copyright (c) 2013年 Vito. All rights reserved.
//

#import "ViewController.h"
#import "VIOpenWeatherCondition.h"

@interface ViewController()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [VIOpenWeatherCondition setupWithCityName:@"xiamen" appid:nil];
}

- (IBAction)pressAction:(id)sender {
    
    [[VIOpenWeatherCondition sharedCondition] getWeatherConditionCompletion:^(ConditionType conditionType) {
        
        NSString *conditionResult = @"";
        switch (conditionType) {
            case ConditionTypeSkyIsClear:
                conditionResult = @"ConditionTypeSkyIsClear";
                break;
            case ConditionTypeFewClouds:
                conditionResult = @"ConditionTypeFewClouds";
                break;
            case ConditionTypeScatteredClouds:
                conditionResult = @"ConditionTypeScatteredClouds";
                break;
            case ConditionTypeBrokenClouds:
                conditionResult = @"ConditionTypeBrokenClouds";
                break;
            case ConditionTypeShowerRain:
                conditionResult = @"ConditionTypeShowerRain";
                break;
            case ConditionTypeRain:
                conditionResult = @"ConditionTypeRain";
                break;
            case ConditionTypeThunderstorm:
                conditionResult = @"ConditionTypeThunderstorm";
                break;
            case ConditionTypeSnow:
                conditionResult = @"ConditionTypeSnow";
                break;
            case ConditionTypeMist:
                conditionResult = @"ConditionTypeMist";
                break;
            case ConditionTypeExtreme:
                conditionResult = @"ConditionTypeExtreme";
                break;
            case ConditionTypeUnknown:
                conditionResult = @"ConditionTypeUnknown";
                break;
                
            default:
                break;
        }
        
        self.label.text = [NSString stringWithFormat:@"%@'s weather condition: %@",
                            [VIOpenWeatherCondition sharedCondition].cityName,
                            conditionResult];
    }];

}

@end
