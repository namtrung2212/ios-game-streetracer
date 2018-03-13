//
//  OtherCar.h
//  StreetRacer
//
//  Created by Nam Trung on 12/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

#import "Car.h"


@interface OtherCar : CCSprite
- (void)setRandomPosition: (CGFloat) heroPosX ;

- (void)setRandomSpeed;

-(void)TurnLeft ;
-(void)TurnRight ;
-(void)StopTurnLeftRight ;
-(void) setCar:(NSInteger) carNo;
-(void) setSpeed:(CGFloat)_speed;
-(void) setNumber:(NSInteger) num;
-(void) setDirection:(BOOL) _isUpToDown;
-(BOOL) getDirection;
-(CGFloat) getSpeed;
-(void) genCollisionExplore;
-(void) doExplore;
-(BOOL) getExplored;
@end
