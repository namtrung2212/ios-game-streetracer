//
//  CarProvider.h
//  StreetRacer
//
//  Created by Nam Trung on 12/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Car.h"
#import "OtherCar.h"

@interface CarProvider : NSObject 
+ (OtherCar*) GenRandomCar:(CGFloat) heroPosY;

@end
