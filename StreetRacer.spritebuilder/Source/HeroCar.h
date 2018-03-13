//
//  HeroCar.h
//  StreetRacer
//
//  Created by Nam Trung on 12/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

#import "Car.h"
#import "CCAnimation.h"
  
@interface HeroCar : CCSprite
-(void)TurnLeft:(CGFloat)value ;
-(void)TurnRight:(CGFloat)value ;

-(BOOL)isTurnLeft ;
-(BOOL)isTurnRight ;
-(void)StopTurnLeftRight ;
-(void) setCar:(NSInteger) _no;
-(NSInteger) getCarNo;
-(void) setSpeed:(CGFloat)_speed;
-(void) setNumber:(NSInteger) num;
-(void) setDirection:(BOOL) _isUpToDown;

-(CGFloat) getSpeed;

-(void) decreaseBlood:(NSInteger) value;


-(NSInteger) getBlood;
@end
