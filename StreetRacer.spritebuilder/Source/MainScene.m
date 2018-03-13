//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#define ARC4RANDOM_MAX      0x100000000
@implementation MainScene
{
    
    CCNode *_car1;
    CCNode *_car2;
    CCNode *_car3;
    CCNode *_car4;
    CCNode *_car5;
    CGFloat carOrgX1;
    CGFloat carOrgX2;
    CGFloat carOrgX3;
    CGFloat carOrgX4;
    CGFloat carOrgX5;
    
    NSInteger CarNo1;
    NSInteger CarNo2;
    NSInteger CarNo3;
    NSInteger CarNo4;
    NSInteger CarNo5;
    
    CCNode *_BtnContinue;
    CCNode *_devBy;
}
- (void)didLoadFromCCB {
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"BG.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"CarBig.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car01.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car02.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car03.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car04.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car05.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car06.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car07.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car08.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car09.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car10.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car11.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car12.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car13.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car14.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car15.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car16.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car17.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car18.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car19.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Cars/Car20.plist"];
    
   
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG1.png"];
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG2.png"];
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG3.png"];
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG4.png"];
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG5.png"];
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG6.png"];
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG7.png"];
    [[CCTextureCache sharedTextureCache] addImage:@"BG/BG8.png"];
    
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Numbers.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Others.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff1.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff4.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff5.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff6.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff8.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff10.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff11.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff12.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff13.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff14.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff15.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff16.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff17.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff18.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff20.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff21.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff22.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/Star.plist"];
    
  //  CCTime tt= [[CCDirector sharedDirector] animationInterval];
    //[[CCDirector sharedDirector] setAnimationInterval:1.0/70];
   // CCTime tt2= [[CCDirector sharedDirector] animationInterval];
    self.userInteractionEnabled = true;
    
    if([GamePlay heroNumber]==nil)
        [GamePlay setHeroNumber:3];
    
    CarNo2=[GamePlay heroNumber]-1;
    if(CarNo2<1)
        CarNo2=20;
   
    CarNo1=CarNo2-1;
    if(CarNo1<1)
        CarNo1=20;
    
    CarNo3=[GamePlay heroNumber];
  
    CarNo4=CarNo3+1;
    if(CarNo4>20)
        CarNo4=1;
    
    CarNo5=CarNo4+1;
    if(CarNo5>20)
        CarNo5=1;
    
    ((CCSprite*)_car1).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo1]];
    ((CCSprite*)_car2).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo2]];
    ((CCSprite*)_car3).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo3]];
    ((CCSprite*)_car4).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo4]];
    ((CCSprite*)_car5).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo5]];
    
    _car1.anchorPoint =ccp(0.5f,0.5f);
    _car2.anchorPoint =ccp(0.5f,0.5f);
    _car3.anchorPoint =ccp(0.5f,0.5f);
    _car4.anchorPoint =ccp(0.5f,0.5f);
    _car5.anchorPoint =ccp(0.5f,0.5f);
 /*
    _car1.scaleX =0.7f;
    _car1.scaleY =0.7f;
    _car2.scaleX =0.7f;
    _car2.scaleY =0.7f;
    _car3.scaleX =0.7f;
    _car4.scaleY =0.7f;
    _car4.scaleX =0.7f;
    _car4.scaleY =0.7f;
    _car5.scaleX =0.7f;
    _car5.scaleY =0.7f;
    */
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    _car3.position = ccp(s.width/2 , 0.47);
    _car2.position = ccp(_car3.position.x-_car3.contentSize.width/2 - _car2.contentSize.width/2, 0.47);
    _car4.position = ccp(_car3.position.x+_car3.contentSize.width/2 + _car4.contentSize.width/2, 0.47);
    _car1.position = ccp(_car2.position.x-_car2.contentSize.width/2 - _car1.contentSize.width/2, 0.47);
    _car5.position = ccp(_car4.position.x+_car4.contentSize.width/2 + _car5.contentSize.width/2, 0.47);
    
    
    [((CCSprite*)_car1) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    [((CCSprite*)_car2) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    [((CCSprite*)_car3) setColor: [CCColor colorWithRed:1 green:1 blue:1] ];
    [((CCSprite*)_car4) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    [((CCSprite*)_car5) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    
    
    if([GamePlay isMusicOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio stopEverything];
        CGFloat randSong=((double)arc4random() / ARC4RANDOM_MAX)*4;
        if( randSong <=1)
        {
            [audio playBg:@"Sounds/Music/GAME_MUSIC_1.mp3" volume:1.f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/GAME_MUSIC_1.mp3"];
        }
        else if( randSong <=2)
        {
            [audio playBg:@"Sounds/Music/GAME_MUSIC_2.mp3" volume:1.f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/GAME_MUSIC_2.mp3"];
        }
        else if( randSong <=3)
        {
            [audio playBg:@"Sounds/Music/BONUS_MUSIC.mp3" volume:1.f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/BONUS_MUSIC.mp3"];
        }
        else
        {
            [audio playBg:@"Sounds/Music/MENU_MUSIC.mp3" volume:1.f pan:0 loop:true];
            [GamePlay setBackgroundSong:@"Sounds/Music/MENU_MUSIC.mp3"];
        }
        
    }

    /*
     [(CCLabelTTF* ) ((CCButton*) _BtnContinue).label   setString:NSLocalizedString(@"Continue", nil)];
    
     [((CCLabelTTF*) _devBy) setString:NSLocalizedString(@"DevBy", nil)];
     */
}

CGPoint beginPoint;
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [touch locationInWorld];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    beginPoint=touchLocation;
    
    carOrgX1=_car1.position.x;
    carOrgX2=_car2.position.x;
    carOrgX3=_car3.position.x;
    carOrgX4=_car4.position.x;
    carOrgX5=_car5.position.x;
    
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    lastMovingPoint=touchLocation;
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    // if (abs(lastMovingPoint.x-beginPoint.x)>s.width*0.7f) {
    /*   if( lastMovingPoint.x<beginPoint.x)
     {
     carOrgX1= carOrgX1-_car1.contentSize.width;
     carOrgX2= carOrgX2-_car2.contentSize.width;
     carOrgX3= carOrgX3-_car3.contentSize.width;
     carOrgX4= carOrgX4-_car4.contentSize.width;
     carOrgX5= carOrgX5-_car5.contentSize.width;
     
     }else
     {
     carOrgX1= carOrgX1+_car1.contentSize.width;
     carOrgX2= carOrgX2+_car2.contentSize.width;
     carOrgX3= carOrgX3+_car3.contentSize.width;
     carOrgX4= carOrgX4+_car4.contentSize.width;
     carOrgX5= carOrgX5+_car5.contentSize.width;
     }
     */
    
    // CGFloat indd=(carOrgX1>=0 ? 1.f:-1.f);
   
    /*carOrgX1=s.width/2-floor(_car1.position.x/(_car1.contentSize.width))*(_car1.contentSize.width);//*(_car1.position.x>=s.width/2 ? 1.f:-1.f);
    carOrgX2=s.width/2-floor(_car2.position.x/(_car2.contentSize.width))*(_car2.contentSize.width);//*(_car2.position.x>=s.width/2 ? 1.f:-1.f);
    carOrgX3=s.width/2-floor(_car3.position.x/(_car3.contentSize.width))*(_car3.contentSize.width);//*(_car3.position.x>=s.width/2 ? 1.f:-1.f);
    carOrgX4=s.width/2-floor(_car4.position.x/(_car4.contentSize.width))*(_car4.contentSize.width);//*(_car4.position.x>=s.width/2 ? 1.f:-1.f);
    carOrgX5=s.width/2-floor(_car5.position.x/(_car5.contentSize.width))*(_car5.contentSize.width);//*(_car5.position.x>=s.width/2 ? 1.f:-1.f);
    // }
    
    [_car1 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(carOrgX1,_car1.position.y)]];
    [_car2 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(carOrgX2,_car2.position.y)]];
    [_car3 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(carOrgX3,_car3.position.y)]];
    [_car4 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(carOrgX4,_car4.position.y)]];
    [_car5 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(carOrgX5,_car5.position.y)]];
    */
    CGFloat centerPoint = 100000;
    
    int iCurrentCar=-1;
    
    if(fabs(_car1.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car1.position.x-s.width/2);
        iCurrentCar=1;
    }
    
    if(fabs(_car2.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car2.position.x-s.width/2);
        iCurrentCar=2;
    }
    if(fabs(_car3.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car3.position.x-s.width/2);
        iCurrentCar=3;
    }
    
    if(fabs(_car4.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car4.position.x-s.width/2);
        iCurrentCar=4;
    }
    if(fabs(_car5.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car5.position.x-s.width/2);
        iCurrentCar=5;
    }
    
    if(iCurrentCar==1)
    {
         [GamePlay setHeroNumber:CarNo1];
        [_car1 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2, 0.47)]];
        [_car2 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2+1*_car1.contentSize.width, 0.47)]];
      
        _car3.position =ccp(s.width/2+2*_car1.contentSize.width, 0.47);
        _car4.position =ccp(s.width/2-2*_car1.contentSize.width, 0.47);

        [_car5 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2-1*_car1.contentSize.width, 0.47)]];
    
    }else if(iCurrentCar==2)
    {
         [GamePlay setHeroNumber:CarNo2];
        [_car2 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2, 0.47)]];
        [_car3 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2+1*_car1.contentSize.width, 0.47)]];
        
        _car4.position =ccp(s.width/2+2*_car1.contentSize.width, 0.47);
        _car5.position =ccp(s.width/2-2*_car1.contentSize.width, 0.47);
        [_car1 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2-1*_car1.contentSize.width, 0.47)]];
        
    }else if(iCurrentCar==3)
    {
        [GamePlay setHeroNumber:CarNo3];
        [_car3 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2, 0.47)]];
        [_car4 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2+1*_car1.contentSize.width, 0.47)]];
        
        _car5.position =ccp(s.width/2+2*_car1.contentSize.width, 0.47);
        _car1.position =ccp(s.width/2-2*_car1.contentSize.width, 0.47);
   
        [_car2 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2-1*_car1.contentSize.width, 0.47)]];
       
    }else if(iCurrentCar==4)
    {
        [GamePlay setHeroNumber:CarNo4];
    
        [_car4 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2, 0.47)]];
        [_car5 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2+1*_car1.contentSize.width, 0.47)]];
        
        _car1.position =ccp(s.width/2+2*_car1.contentSize.width, 0.47);
        _car2.position =ccp(s.width/2-2*_car1.contentSize.width, 0.47);
      
        [_car3 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2-1*_car1.contentSize.width, 0.47)]];
        
    }else if(iCurrentCar==5)
    {
        [GamePlay setHeroNumber:CarNo5];

        [_car5 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2, 0.47)]];
        [_car1 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2+1*_car1.contentSize.width, 0.47)]];
        
        _car2.position =ccp(s.width/2+2*_car1.contentSize.width, 0.47);
        _car3.position =ccp(s.width/2-2*_car1.contentSize.width, 0.47);

        [_car4 runAction:[CCActionMoveTo actionWithDuration:0.3 position:ccp(s.width/2-1*_car1.contentSize.width, 0.47)]];
       
    }
    
    if(iCurrentCar==1)
    {
       
        CarNo2=CarNo1+1;
        if(CarNo2>20)
            CarNo2=1;
        
        CarNo3=CarNo2+1;
        if(CarNo3>20)
            CarNo3=1;
        
        CarNo5=CarNo1-1;
        if(CarNo5<1)
            CarNo5=20;
        
        CarNo4=CarNo5-1;
        if(CarNo4<1)
            CarNo4=20;
        
    }else if(iCurrentCar==2)
    {
       
        CarNo3=CarNo2+1;
        if(CarNo3>20)
            CarNo3=1;
        
        CarNo4=CarNo3+1;
        if(CarNo4>20)
            CarNo4=1;
        
        CarNo1=CarNo2-1;
        if(CarNo1<1)
            CarNo1=20;
        
        CarNo5=CarNo1-1;
        if(CarNo5<1)
            CarNo5=20;
        
    }else if(iCurrentCar==3)
    {
       
        CarNo4=CarNo3+1;
        if(CarNo4>20)
            CarNo4=1;
        
        CarNo5=CarNo4+1;
        if(CarNo5>20)
            CarNo5=1;
        
        CarNo2=CarNo3-1;
        if(CarNo2<1)
            CarNo2=20;
        
        CarNo1=CarNo2-1;
        if(CarNo1<1)
            CarNo1=20;
        
    }else if(iCurrentCar==4)
    {
        
       CarNo5=CarNo4+1;
        if(CarNo5>20)
            CarNo5=1;
        
        CarNo1=CarNo5+1;
        if(CarNo1>20)
            CarNo1=1;
        
        
        CarNo3=CarNo4-1;
        if(CarNo3<1)
            CarNo3=20;
        
        
        CarNo2=CarNo3-1;
        if(CarNo2<1)
            CarNo2=20;
        
    }else if(iCurrentCar==5)
    {
        CarNo1=CarNo5+1;
        if(CarNo1>20)
            CarNo1=1;
        
        CarNo2=CarNo1+1;
        if(CarNo2>20)
            CarNo2=1;
        
        CarNo4=CarNo5-1;
        if(CarNo4<1)
            CarNo4=20;
        
        CarNo3=CarNo4-1;
        if(CarNo3<1)
            CarNo3=20;
    }
    
    ((CCSprite*)_car1).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo1]];
    ((CCSprite*)_car2).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo2]];
    ((CCSprite*)_car3).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo3]];
    ((CCSprite*)_car4).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo4]];
    ((CCSprite*)_car5).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo5]];
    
}

CGPoint lastMovingPoint;
- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
    lastMovingPoint=touchLocation;
    
    if( lastMovingPoint.x<beginPoint.x)
    {
        _car1.position=ccp(carOrgX1-(beginPoint.x-lastMovingPoint.x)*1.75f,_car1.position.y);
        _car2.position=ccp(carOrgX2-(beginPoint.x-lastMovingPoint.x)*1.75f,_car2.position.y);
        _car3.position=ccp(carOrgX3-(beginPoint.x-lastMovingPoint.x)*1.75f,_car3.position.y);
        _car4.position=ccp(carOrgX4-(beginPoint.x-lastMovingPoint.x)*1.75f,_car4.position.y);
        _car5.position=ccp(carOrgX5-(beginPoint.x-lastMovingPoint.x)*1.75f,_car5.position.y);
    }else
    {
        _car1.position=ccp(carOrgX1+(lastMovingPoint.x-beginPoint.x)*1.75f,_car1.position.y);
        _car2.position=ccp(carOrgX2+(lastMovingPoint.x-beginPoint.x)*1.75f,_car2.position.y);
        _car3.position=ccp(carOrgX3+(lastMovingPoint.x-beginPoint.x)*1.75f,_car3.position.y);
        _car4.position=ccp(carOrgX4+(lastMovingPoint.x-beginPoint.x)*1.75f,_car4.position.y);
        _car5.position=ccp(carOrgX5+(lastMovingPoint.x-beginPoint.x)*1.75f,_car5.position.y);
        
    }
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    CGFloat centerPoint = 100000;
    int iCurrentCar=-1;
    
    if(fabs(_car1.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car1.position.x-s.width/2);
        iCurrentCar=1;
    }
    
    if(fabs(_car2.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car2.position.x-s.width/2);
        iCurrentCar=2;
    }
    if(fabs(_car3.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car3.position.x-s.width/2);
        iCurrentCar=3;
    }
    
    if(fabs(_car4.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car4.position.x-s.width/2);
        iCurrentCar=4;
    }
    if(fabs(_car5.position.x-s.width/2)<centerPoint){
        centerPoint=fabs(_car5.position.x-s.width/2);
        iCurrentCar=5;
    }
    
    
    [((CCSprite*)_car1) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    [((CCSprite*)_car2) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    [((CCSprite*)_car3) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    [((CCSprite*)_car4) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    [((CCSprite*)_car5) setColor: [CCColor colorWithRed:0.25 green:0.25 blue:0.25] ];
    
    if(iCurrentCar==1)
    {
      
        [((CCSprite*)_car1) setColor: [CCColor colorWithRed:1 green:1 blue:1] ];
      
        _car2.position =ccp(_car1.position.x+1*_car1.contentSize.width, 0.47);
        _car3.position =ccp(_car1.position.x+2*_car1.contentSize.width, 0.47);
        _car4.position =ccp(_car1.position.x-2*_car1.contentSize.width, 0.47);
        _car5.position =ccp(_car1.position.x-1*_car1.contentSize.width, 0.47);
        
        CarNo2=CarNo1+1;
        if(CarNo2>20)
            CarNo2=1;
        
        CarNo3=CarNo2+1;
        if(CarNo3>20)
            CarNo3=1;
    
        CarNo5=CarNo1-1;
        if(CarNo5<1)
            CarNo5=20;
        
        CarNo4=CarNo5-1;
        if(CarNo4<1)
            CarNo4=20;

    }else if(iCurrentCar==2)
    {
     
        [((CCSprite*)_car2) setColor: [CCColor colorWithRed:1 green:1 blue:1] ];
       
        _car3.position =ccp(_car2.position.x+1*_car1.contentSize.width, 0.47);
        _car4.position =ccp(_car2.position.x+2*_car1.contentSize.width, 0.47);
        _car5.position =ccp(_car2.position.x-2*_car1.contentSize.width, 0.47);
        _car1.position =ccp(_car2.position.x-1*_car1.contentSize.width, 0.47);
       
        
        CarNo3=CarNo2+1;
        if(CarNo3>20)
            CarNo3=1;
        
        CarNo4=CarNo3+1;
        if(CarNo4>20)
            CarNo4=1;
        
        CarNo1=CarNo2-1;
        if(CarNo1<1)
            CarNo1=20;
        
        CarNo5=CarNo1-1;
        if(CarNo5<1)
            CarNo5=20;
     
    }else if(iCurrentCar==3)
    {
      
        [((CCSprite*)_car3) setColor: [CCColor colorWithRed:1 green:1 blue:1] ];
     
        _car4.position =ccp(_car3.position.x+1*_car1.contentSize.width, 0.47);
        _car5.position =ccp(_car3.position.x+2*_car1.contentSize.width, 0.47);
        _car1.position =ccp(_car3.position.x-2*_car1.contentSize.width, 0.47);
        _car2.position =ccp(_car3.position.x-1*_car1.contentSize.width, 0.47);
        
        CarNo4=CarNo3+1;
        if(CarNo4>20)
            CarNo4=1;

        CarNo5=CarNo4+1;
        if(CarNo5>20)
            CarNo5=1;
     
        CarNo2=CarNo3-1;
        if(CarNo2<1)
            CarNo2=20;
        
        CarNo1=CarNo2-1;
        if(CarNo1<1)
            CarNo1=20;

    }else if(iCurrentCar==4)
    {
       
        [((CCSprite*)_car4) setColor: [CCColor colorWithRed:1 green:1 blue:1] ];
        
        _car5.position =ccp(_car4.position.x+1*_car1.contentSize.width, 0.47);
        _car1.position =ccp(_car4.position.x+2*_car1.contentSize.width, 0.47);
        _car2.position =ccp(_car4.position.x-2*_car1.contentSize.width, 0.47);
        _car3.position =ccp(_car4.position.x-1*_car1.contentSize.width, 0.47);
       
        CarNo5=CarNo4+1;
        if(CarNo5>20)
            CarNo5=1;
        
        CarNo1=CarNo5+1;
        if(CarNo1>20)
            CarNo1=1;
        
        
        CarNo3=CarNo4-1;
        if(CarNo3<1)
            CarNo3=20;
        
        
        CarNo2=CarNo3-1;
        if(CarNo2<1)
            CarNo2=20;
        
    }else if(iCurrentCar==5)
    {
      
        [((CCSprite*)_car5) setColor: [CCColor colorWithRed:1 green:1 blue:1] ];
        
        _car1.position =ccp(_car5.position.x+1*_car1.contentSize.width, 0.47);
        _car2.position =ccp(_car5.position.x+2*_car1.contentSize.width, 0.47);
        _car3.position =ccp(_car5.position.x-2*_car1.contentSize.width, 0.47);
        _car4.position =ccp(_car5.position.x-1*_car1.contentSize.width, 0.47);
        
        CarNo1=CarNo5+1;
        if(CarNo1>20)
            CarNo1=1;
        
        CarNo2=CarNo1+1;
        if(CarNo2>20)
            CarNo2=1;
     
        CarNo4=CarNo5-1;
        if(CarNo4<1)
            CarNo4=20;
        
        CarNo3=CarNo4-1;
        if(CarNo3<1)
            CarNo3=20;
    }
    
    
    ((CCSprite*)_car1).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo1]];
    ((CCSprite*)_car2).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo2]];
    ((CCSprite*)_car3).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo3]];
    ((CCSprite*)_car4).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo4]];
    ((CCSprite*)_car5).spriteFrame= [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CarBig/Car%02d.png",CarNo5]];
    

}

-(void) Continue
{
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    CGFloat mindistance = CGFLOAT_MAX;
    
    int iCurrentCar=-1;
    
    if(fabs(_car1.position.x-s.width/2)<mindistance){
        mindistance=fabs(_car1.position.x-s.width/2);
        iCurrentCar=CarNo1;
    }
    
    if(fabs(_car2.position.x-s.width/2)<mindistance){
        mindistance=fabs(_car2.position.x-s.width/2);
        iCurrentCar=CarNo2;
    }
    if(fabs(_car3.position.x-s.width/2)<mindistance){
        mindistance=fabs(_car3.position.x-s.width/2);
        iCurrentCar=CarNo3;
    }
    
    if(fabs(_car4.position.x-s.width/2)<mindistance){
        mindistance=fabs(_car4.position.x-s.width/2);
        iCurrentCar=CarNo4;
    }
    if(fabs(_car5.position.x-s.width/2)<mindistance){
        mindistance=fabs(_car5.position.x-s.width/2);
        iCurrentCar=CarNo5;
    }
    
    [GamePlay setHeroNumber:iCurrentCar];
    
    if([GamePlay isSoundOn])
    {
      OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
     [audio playEffect:@"Sounds/Car/ENGINE_REVOUT_3.mp3" volume:1.f pitch:1.f pan:0 loop:false];
    }
    [GamePlay setGameOver:false];
   
    
    CCScene *gameplayScene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
    
}


@end
