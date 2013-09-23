VIOpenWeatherCondition
=============

This is a lightweight weather condition sdk for [OpenWeatherMap's Weather Condition Codes](http://bugs.openweathermap.org/projects/api/wiki/Weather_Condition_Codes).

![alt sky is clear](http://openweathermap.org/img/w/01d.png "sky is clear")
![alt few clouds](http://openweathermap.org/img/w/02d.png "few clouds")
![alt scattered clouds](http://openweathermap.org/img/w/03d.png "scattered clouds")
![alt broken clouds](http://openweathermap.org/img/w/04d.png "broken clouds")
![alt shower rain](http://openweathermap.org/img/w/09d.png "shower rain")
![alt Rain](http://openweathermap.org/img/w/10d.png "Rain")
![alt Thunderstorm](http://openweathermap.org/img/w/11d.png "Thunderstorm")
![alt snow](http://openweathermap.org/img/w/13d.png "snow")
![alt mist](http://openweathermap.org/img/w/50d.png "mist")

![alt sky is clear](http://openweathermap.org/img/w/01n.png "sky is clear")
![alt few clouds](http://openweathermap.org/img/w/02n.png "few clouds")
![alt scattered clouds](http://openweathermap.org/img/w/03n.png "scattered clouds")
![alt broken clouds](http://openweathermap.org/img/w/04n.png "broken clouds")
![alt shower rain](http://openweathermap.org/img/w/09n.png "shower rain")
![alt Rain](http://openweathermap.org/img/w/10n.png "Rain")
![alt Thunderstorm](http://openweathermap.org/img/w/11n.png "Thunderstorm")
![alt snow](http://openweathermap.org/img/w/13n.png "snow")
![alt mist](http://openweathermap.org/img/w/50n.png "mist")

----
Though you can use the API without **APPID**, but with **APPID** OpenWeatherMap will **guarantee availability and accuracy of weather data**.

See [how to work with API key](http://openweathermap.org/appid)


#Installation

Add all files upder ``VIOpenWeatherCondition/VIOpenWeatherCondition`` to your project.

#Useage

1. ``#import "VIOpenWeatherCondition.h"`` 
2. Before use api, set the **cityName** and **appId**

		- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
		{
    
    		[VIOpenWeatherCondition setupWithCityName:@"London" appid:@"[APPID]"];
    
    		return YES;
		}


3. Get weather condition type

		[[VIOpenWeatherCondition sharedCondition] getWeatherConditionCompletion:^(ConditionType conditionType) {
			// Get the conditionType.
			// 
			// Include:
			// ConditionTypeSkyIsClear,ConditionTypeFewClouds,ConditionTypeScatteredClouds,ConditionTypeBrokenClouds,ConditionTypeShowerRain,ConditionTypeRain,ConditionTypeThunderstorm,ConditionTypeSnow, ConditionTypeMist,ConditionTypeExtreme,ConditionTypeUnknown
		}];

#License

See the [MIT license](https://github.com/vitoziv/VIOpenWeatherCondition/blob/master/LICENSE).