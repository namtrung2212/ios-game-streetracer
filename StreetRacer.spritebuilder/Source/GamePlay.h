//
//  GamePlay.h
//  StreetRacer
//
//  Created by Nam Trung on 12/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#include "CCTextureCache.h"
#import "Car.h"
#import "HeroCar.h"

@interface GamePlay : CCNode<CCPhysicsCollisionDelegate>
+ (HeroCar*) getHero;
+ (GamePlay*) instance;


+ (NSInteger) heroNumber;
+ (void) setHeroNumber:(int) value;

- (HeroCar*) getHero;
- (CGFloat) getStreetWidth;

-(void) SoundClick;
-(void) MusicClick;


- (void) setScoreLabel;

+ (BOOL) isSoundOn;
+ (void) setSoundOn:(BOOL)value;

+ (BOOL) isMusicOn;
+ (void) setMusicOn:(BOOL)value;


+ (BOOL) isGameOver;
+ (void) setGameOver:(BOOL)value;

+ (NSInteger) getScores;
+ (void) setScores:(NSInteger)value;

+ (void) increaseScores:(NSInteger)increasevalue;

+ (NSString*) getBackgroundSong;
+ (void) setBackgroundSong:(NSString*)value;


- (void)gameOver ;

@end
