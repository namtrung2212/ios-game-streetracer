//
//  GamePlay.m
//  StreetRacer
//
//  Created by Nam Trung on 12/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GamePlay.h"
#import "OtherCar.h"
#import "GameOver.h"

#define ARC4RANDOM_MAX      0x100000000
@implementation GamePlay
{
    CCPhysicsNode *physicNode;
    
    HeroCar *hero;
    
    CGFloat streetWidth;
    
    CGPoint beginPoint;
    
    CCNode* _score;
    
    CCNode* _soundBtn;
    
    CCNode* _musicBtn;
    
    CCNode* _star1;
    
    CCNode* _star2;
    
    CCNode* _star3;
    
    CCNode* _carGray;
    
    CCNode* _letgoLabel;
    
    GameOver* gameover;
    
    NSMutableArray *_objects;
}

static GamePlay* _gamePlay;
static NSInteger _heroNo;

+ (GamePlay*) instance
{
    return _gamePlay;
}


+ (HeroCar*) getHero
{
    return [_gamePlay getHero];
}


+ (NSInteger) heroNumber
{
    return _heroNo;
}
+ (void) setHeroNumber:(int) value
{
    _heroNo=value;
}


- (HeroCar*) getHero
{
    return hero;
}


- (CGFloat) getStreetWidth
{
    return streetWidth;
}


static BOOL _isSoundOn=true;
static BOOL _isMusicOn=true;
static NSInteger _points;
static NSString* _backgroundSong;


+ (NSString*) getBackgroundSong
{
    return _backgroundSong;
}
+ (void) setBackgroundSong:(NSString*)value
{
    _backgroundSong=value;
}



+ (BOOL) isSoundOn
{
    return _isSoundOn;
}
+ (void) setSoundOn:(BOOL)value
{
    _isSoundOn=value;
    if(!value)
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio stopAllEffects];
    }
}

+ (BOOL) isMusicOn
{
    return _isMusicOn;
}
+ (void) setMusicOn:(BOOL)value
{
    _isMusicOn=value;
    if(!value)
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio stopBg];
    }else if(![GamePlay isGameOver])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio playBg:[GamePlay getBackgroundSong] volume:0.6f pan:0 loop:true];
    }
}

static BOOL _gameOver=false;
+ (BOOL) isGameOver
{
    return _gameOver;
}
+ (void) setGameOver:(BOOL)value
{
    _gameOver=value;
}


+ (NSInteger) getScores
{
    return _points;
}
+ (void) setScores:(NSInteger)value
{
    _points=value;
    [[GamePlay instance] setScoreLabel];
}
+ (void) increaseScores:(NSInteger)increasevalue
{
    _points+=increasevalue;
    [[GamePlay instance] setScoreLabel];
    if(GamePlay.isSoundOn )
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        //  [audio playEffect:@"ScoreSound.mp3"volume:0.3f pitch:1.f pan:0 loop:false];
    }
}

- (void)didLoadFromCCB {
    beginPoint=hero.position;
    
    _gamePlay=self;
    
    streetWidth=200.f;
    
    self.userInteractionEnabled = TRUE;
       physicNode.collisionDelegate = self;
    
    if([GamePlay isMusicOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio stopEverything];
        CGFloat randSong=((double)arc4random() / ARC4RANDOM_MAX)*9;
        if( randSong <=1)
        {
            [audio playBg:@"Sounds/Music/GAME_MUSIC_1.mp3" volume:0.6f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/GAME_MUSIC_1.mp3"];
        }
        else if( randSong <=2)
        {
            [audio playBg:@"Sounds/Music/GAME_MUSIC_2.mp3" volume:0.6f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/GAME_MUSIC_2.mp3"];
        }
        else if( randSong <=3)
        {
            [audio playBg:@"Sounds/Music/BONUS_MUSIC.mp3" volume:0.6f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/BONUS_MUSIC.mp3"];
        }
        else if( randSong <=6)
        {
            [audio playBg:@"Sounds/Music/MENU_MUSIC.mp3" volume:0.6f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/MENU_MUSIC.mp3"];
        }else
        {
            [audio playBg:@"Sounds/Music/HighWayStar.mp3" volume:0.5f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/HighWayStar.mp3"];
        }
        
        
    }
    [self schedule:@selector(speedUpTimer) interval:15.f];
    [self schedule:@selector(speedDownTimer) interval:0.5f];
    [GamePlay setScores:0];
    
    NSString* path=[NSString stringWithFormat:@"CarBig/Car%02d.png",[hero getCarNo]];
    CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
    ((CCSprite*)_carGray).spriteFrame=imageframe;
    ((CCSprite*)_carGray).scaleX=0.4f;
    ((CCSprite*)_carGray).scaleY=0.4f;
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    gameover = (GameOver*)[CCBReader load:@"GameOver"];
    gameover.position=ccp(s.width/2,s.height/2);
    gameover.scaleX=0.5f;
    gameover.scaleY=0.5f;
  
    [self addChild:gameover];
    gameover.visible=false;
    
    _objects = [NSMutableArray array];
    
    //[((CCLabelTTF*) _letgoLabel) setString:NSLocalizedString(@"LetGo", nil)];
    hero.position=ccp(s.width/2,hero.position.y);
}


-(void) speedUpTimer
{
    if ([hero getBlood]>0)
        [hero setSpeed:[hero getSpeed] + 5];//20
}

-(void) speedDownTimer
{
    if ([hero getBlood]<=0 && [hero getSpeed]>0)
        [hero setSpeed:[hero getSpeed] - 25];//20
}
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [touch locationInWorld];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    beginPoint=touchLocation;
    lastMovingPoint=touchLocation;
    
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    
    
    if([hero isTurnLeft]||[hero isTurnRight])
    {
        id action=[CCActionRotateTo actionWithDuration:0.5 angle:0];
        [hero runAction:action];
    }
    
    [hero StopTurnLeftRight];
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    beginPoint=touchLocation;
    lastMovingPoint=touchLocation;
}

CGPoint lastMovingPoint;
- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    if(hero!=nil&& touchLocation.x<lastMovingPoint.x)// && ![hero isTurnLeft] )
    {
        CGFloat subSpeed=0;
        if([hero isTurnRight])
            subSpeed=-20.f;
        
        [hero StopTurnLeftRight];
        if(hero.position.x>=touchLocation.x)
            [hero TurnLeft:(hero.position.x-touchLocation.x + subSpeed)];
        else
            [hero TurnLeft:(touchLocation.x-hero.position.x+ subSpeed)];
        
        lastMovingPoint=touchLocation;
    }
    if(hero!=nil&& touchLocation.x>lastMovingPoint.x)// && ![hero isTurnRight] )
    {
        CGFloat subSpeed=0;
        if([hero isTurnLeft])
            subSpeed=-20.f;
        
        [hero StopTurnLeftRight];
        if(hero.position.x>=touchLocation.x)
            [hero TurnRight:(hero.position.x-touchLocation.x+ subSpeed)];
        else
            [hero TurnRight:(touchLocation.x-hero.position.x+ subSpeed)];
        
        lastMovingPoint=touchLocation;
    }
    
    
}


- (BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair othercar:(OtherCar *)othercar1 othercar:(OtherCar *)othercar2 {
    
    
    //   [othercar1 genCollisionExplore];
    // [othercar2 genCollisionExplore];
    
    if(othercar1.position.x<othercar2.position.x)
    {
        id action1=[CCActionRotateBy actionWithDuration:0.8 angle:-10];
        [othercar1 runAction:action1];
        
        id action2=[CCActionRotateBy actionWithDuration:0.8 angle:10];
        [othercar2 runAction:action2];
        
    }else
    {
        id action=[CCActionRotateBy actionWithDuration:0.8 angle:10];
        [othercar1 runAction:action];
        
        id action2=[CCActionRotateBy actionWithDuration:0.8 angle:-10];
        [othercar2 runAction:action2];
    }
    
    if(!([othercar1 getExplored] && [othercar2 getExplored]))
    {
        if([GamePlay isSoundOn])
        {
            OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
            CGFloat ratioSound=1;
            if([[GamePlay getHero]getSpeed]<=0  )
                ratioSound=0.7;
            
            CGFloat random=((double)arc4random() / ARC4RANDOM_MAX)*2;
            if(  random<=1)
            {
                [audio playEffect:@"Sounds/Crash/CRASH_1.mp3" volume:0.125f*ratioSound pitch:1.f pan:0 loop:false];
            }
            else
            {
                [audio playEffect:@"Sounds/Crash/CRASH_2.mp3" volume:0.125f*ratioSound pitch:1.f pan:0 loop:false];
                
            }
        }
    }
    
    [othercar1 doExplore];
    [othercar2 doExplore];
    
    
    return YES;
    
}


- (BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair hero:(HeroCar *)hero banhxe:(CCSprite *)banhxe {
    
    return  YES;
}

- (BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair hero:(HeroCar *)hero othercar:(OtherCar *)othercar {
    
    [othercar genCollisionExplore];
    
    if(othercar.position.x<hero.position.x)
    {
        id action=[CCActionRotateBy actionWithDuration:0.8 angle:-45];
        [othercar runAction:action];
        // [hero TurnRight];
    }else
    {
        
        id action=[CCActionRotateBy actionWithDuration:0.8 angle:45];
        [othercar runAction:action];
        //[hero TurnLeft];
    }
    
    
    OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
    
    if([GamePlay isSoundOn] && (hero.getBlood >0))
    {
        CGFloat random=((double)arc4random() / ARC4RANDOM_MAX)*2;
        if(  random<=1)
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/CRASH_1.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/CRASH_1.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
        else
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/CRASH_2.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/CRASH_2.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
    }
   
   
    [othercar doExplore];
    if([GamePlay isSoundOn])
    {
        if([hero getBlood]==1)
            
            [audio playEffect:@"Sounds/Crash/Explore.mp3" volume:1.5f pitch:1.f pan:0 loop:false];
    }
    [hero decreaseBlood:1];
    
    if([hero getBlood]==0 && [hero getSpeed]>50.f)
      [hero setSpeed:100.f];
    _star3.visible =[hero getBlood]>8;
    _star2.visible =[hero getBlood]>4;
    _star1.visible =[hero getBlood]>0;
    return TRUE;
}


- (BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair hero:(HeroCar *)hero bottle:(CCSprite *)bottle {
    
    CCBAnimationManager* animationManager = bottle.userObject;
    if( ![animationManager.runningSequenceName isEqualToString:@"Fall"])
        
        [animationManager runAnimationsForSequenceNamed:@"Fall"];
    [bottle.physicsBody applyImpulse:ccp(0, 15.f)];
    
    if([GamePlay isSoundOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        
        CGFloat randSong=((double)arc4random() / ARC4RANDOM_MAX)*3;
        if( randSong <=1)
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_1.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_1.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
        else if( randSong <=2)
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_2.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_2.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }else
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_3.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_3.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
    }
    
    return  YES;
}


- (BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair othercar:(OtherCar *)othercar bottle:(CCSprite *)bottle {
    
    CCBAnimationManager* animationManager = bottle.userObject;
    if( ![animationManager.runningSequenceName isEqualToString:@"Fall"])
        [animationManager runAnimationsForSequenceNamed:@"Fall"];
    [bottle.physicsBody applyImpulse:ccp(0, -15.f)];
    
    if([GamePlay isSoundOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        CGFloat randSong=((double)arc4random() / ARC4RANDOM_MAX)*3;
        if( randSong <=1)
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_1.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_1.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
        else if( randSong <=2)
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_2.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_2.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }else
        {
            if([hero getBlood]>0)
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_3.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
            else
                [audio playEffect:@"Sounds/Crash/METAL_BARREL_3.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
        
    }
    return  YES;
}



- (BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair hero:(HeroCar *)hero bom:(CCSprite *)bom {
   
    CCNode* crash1= (CCNode*)[CCBReader load:@"Eff5"];
    crash1.position=bom.position;
    crash1.scaleX=0.6f;
    crash1.scaleY=0.6f;
    crash1.zOrder=bom.zOrder+1;
   
    [bom.parent addChild:crash1];
    [_objects addObject:crash1];
    [bom removeFromParent];
    [hero decreaseBlood:100];
   // [hero setSpeed:50.f];
    if([GamePlay isSoundOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio playEffect:@"Sounds/Crash/Explore.mp3" volume:1.2f pitch:1.f pan:0 loop:false];
    }
    
    _star3.visible =[hero getBlood]>8;
    _star2.visible =[hero getBlood]>4;
    _star1.visible =[hero getBlood]>0;
    
    return  YES;
}


- (BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair othercar:(OtherCar *)othercar bom:(CCSprite *)bom {
    
    CCNode* crash1= (CCNode*)[CCBReader load:@"Eff5"];
    crash1.position=bom.position;
    crash1.scaleX=0.6f;
    crash1.scaleY=0.6f;
    crash1.zOrder=bom.zOrder+1;
    [bom.parent addChild:crash1];
    [_objects addObject:crash1];
    [bom removeFromParent];
    if([GamePlay isSoundOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio playEffect:@"Sounds/Crash/Explore.mp3" volume:1.f pitch:1.f pan:0 loop:false];
    }
    
    if(othercar.position.x<bom.position.x)
    {
        id action=[CCActionRotateBy actionWithDuration:0.8 angle:-45];
        [othercar runAction:action];
    }else
    {
        
        id action=[CCActionRotateBy actionWithDuration:0.8 angle:45];
        [othercar runAction:action];
    }
    [othercar doExplore];
    
    
    return  YES;
}




-(void) SoundClick
{
    if([GamePlay isSoundOn])
    {
        [GamePlay setSoundOn:false];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/SoundOff.png"];
        [(CCButton*)_soundBtn setBackgroundSpriteFrame:imageframe forState:CCControlStateNormal ];
    }else
    {
        [GamePlay setSoundOn:true];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/SoundOn1.png"];
        [(CCButton*)_soundBtn setBackgroundSpriteFrame:imageframe forState:CCControlStateNormal ];
    }
}

-(void) MusicClick
{
    if([GamePlay isMusicOn])
    {
        [GamePlay setMusicOn:false];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/MusicOff.png"];
        [(CCButton*)_musicBtn setBackgroundSpriteFrame:imageframe forState:CCControlStateNormal ];
    }else
    {
        [GamePlay setMusicOn:true];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/MusicOn1.png"];
        [(CCButton*)_musicBtn setBackgroundSpriteFrame:imageframe forState:CCControlStateNormal ];
    }
}

- (void) setScoreLabel
{
    [(CCLabelTTF*)_score setString:[NSString stringWithFormat:@"%d", [GamePlay getScores]]];
}

-(void) gameOver
{
    [GamePlay setGameOver:true];
    [self setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    id delayAction = [CCActionInterval actionWithDuration:1.5f];
    CCAction * showGameOverA = [CCActionCallFunc actionWithTarget:self selector:@selector(showGameOver)];
    [self   runAction:[CCActionSequence actions: delayAction, showGameOverA, nil]];
    
}
-(void) showGameOver
{
   
    [gameover refreshScores];
    gameover.visible=true;
    
    CCBAnimationManager* animationManager = gameover.userObject;
    [animationManager runAnimationsForSequenceNamed:animationManager.runningSequenceName ];
    
   /* if(GamePlay.isMusicOn )
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio stopEverything ];
        [audio playEffect:@"Restart1.mp3"volume:1.f pitch:1.f pan:0 loop:false ];;
    }*/
}



-(void)update:(CCTime)delta {
    
    if(![GamePlay isMusicOn])
    {
        CCSpriteFrame* imageframe =  [(CCButton*)_musicBtn backgroundSpriteFrameForState:CCControlStateNormal ];
        if(![imageframe.textureFilename isEqualToString:@"Others/MusicOff.png"])
        {
            CCSpriteFrame* imageframe2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/MusicOff.png"];
            [(CCButton*)_musicBtn setBackgroundSpriteFrame:imageframe2 forState:CCControlStateNormal ];
        }
    }else
    {
        CCSpriteFrame* imageframe =  [(CCButton*)_musicBtn backgroundSpriteFrameForState:CCControlStateNormal ];
        if(![imageframe.textureFilename isEqualToString:@"Others/MusicOn1.png"])
        {
            CCSpriteFrame* imageframe2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/MusicOn1.png"];
            [(CCButton*)_musicBtn setBackgroundSpriteFrame:imageframe2 forState:CCControlStateNormal ];
        }
    }
    
    if(![GamePlay isSoundOn])
    {
        CCSpriteFrame* imageframe =  [(CCButton*)_soundBtn backgroundSpriteFrameForState:CCControlStateNormal ];
        if(![imageframe.textureFilename isEqualToString:@"Others/SoundOff.png"])
        {
            CCSpriteFrame* imageframe2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/SoundOff.png"];
            [(CCButton*)_soundBtn setBackgroundSpriteFrame:imageframe2 forState:CCControlStateNormal ];
        }
    }else
    {
        CCSpriteFrame* imageframe =  [(CCButton*)_soundBtn backgroundSpriteFrameForState:CCControlStateNormal ];
        if(![imageframe.textureFilename isEqualToString:@"Others/SoundOn1.png"])
        {
            CCSpriteFrame* imageframe2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Others/SoundOn1.png"];
            [(CCButton*)_soundBtn setBackgroundSpriteFrame:imageframe2 forState:CCControlStateNormal ];
        }
    }
    [self updateObjects:delta];

}


- (void)updateObjects:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    int increaseY=([[GamePlay getHero] getSpeed] *delta);
    
    NSMutableArray *offScreenOthers = nil;
    for (CCSprite* obj in _objects) {
        
        obj.position = ccp(obj.position.x , obj.position.y- increaseY);
        CGPoint carWorldPos = [self convertToWorldSpace:obj.position];
        if (carWorldPos.y <-obj.contentSize.height-30) {
            if (!offScreenOthers) {
                offScreenOthers = [NSMutableArray array];
            }
            [offScreenOthers addObject:obj];
        }
    }
    
    for (CCSprite *objToRemove in offScreenOthers) {
        [objToRemove removeFromParent];
        [_objects removeObject:objToRemove];
    }
}
@end
