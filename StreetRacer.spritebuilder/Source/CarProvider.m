//
//  CarProvider.m
//  StreetRacer
//
//  Created by Nam Trung on 12/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CarProvider.h"
#import "GamePlay.h"
#define ARC4RANDOM_MAX      0x100000000

@implementation CarProvider


static CGFloat lastX=-1;

+ (OtherCar*) GenRandomCar:(CGFloat) heroPosX
{
    
    OtherCar* car= (OtherCar*)[CCBReader load:@"OtherCar"];
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    CGFloat minX=(s.width-[[GamePlay instance]getStreetWidth] )/2;
    CGFloat maxX=(s.width+[[GamePlay instance]getStreetWidth] )/2;
    
    
    CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
    CGFloat distance= random *10 + car.contentSize.height +3;
    
    CGFloat newX = random * s.width;
    while ((newX<=minX)|| (newX>=maxX )
           || (lastX!=-1 && heroPosX<= maxX && heroPosX>= minX
               && (newX-heroPosX)*(lastX-heroPosX)>=0 && abs(newX-heroPosX)>10)) {
               
               random = ((double)arc4random() / ARC4RANDOM_MAX);
               newX = random * s.width;
           }
    
    lastX=newX;
    
    CGFloat newY =s.height+distance;
    
    car.position = ccp(newX,newY);
    
    // if(newX>s.width/2)
    //   [car setDirection:FALSE];
    if([GamePlay isSoundOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        CGFloat ratioSound=1;
        if([[GamePlay getHero]getSpeed]<=0  )
            ratioSound=0.5;
        
        random=((double)arc4random() / ARC4RANDOM_MAX)*13;
        if(  random<=1)
        {
            [audio playEffect:@"Sounds/Car/ENGINE_ACCELERATE.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        }
        else if(  random<=2)
        {
            [audio playEffect:@"Sounds/Car/ENGINE_REVERSE.mp3" volume:1.1f*ratioSound pitch:1.f pan:0 loop:false];
            
        } else if(  random<=3)
        {
            [audio playEffect:@"Sounds/Car/ENGINE_REVOUT_1.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        } else if(  random<=4)
        {
            [audio playEffect:@"Sounds/Car/ENGINE_REVOUT_2.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        } else if(  random<=5)
        {
            [audio playEffect:@"Sounds/Car/ENGINE_REVOUT_3.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
            
        } else if(  random<=6)
        {
            [audio playEffect:@"Sounds/Car/FLYOVER.mp3" volume:0.9f*ratioSound pitch:1.f pan:0 loop:false];
            
        } else if(  random<=7)
        {
            [audio playEffect:@"Sounds/Police/FIRETRUCK_SIREN.mp3" volume:0.5f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=8)
        {
            [audio playEffect:@"Sounds/Police/COPCAR_SIREN.mp3" volume:0.3f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=9)
        {
            [audio playEffect:@"Sounds/Police/POWERUP_C130_2.mp3" volume:0.2f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=10)
        {
            [audio playEffect:@"Sounds/Police/PA_8.mp3" volume:0.3f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=11)
        {
            [audio playEffect:@"Sounds/Police/POWERUP_C130_1.mp3" volume:0.2f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=12)
        {
            [audio playEffect:@"Sounds/Car/TOWTRUCK_HORN.mp3" volume:0.1f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=13)
        {
            [audio playEffect:@"Sounds/Car/DIGGER_HORN.mp3" volume:0.2f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=14)
        {
            [audio playEffect:@"Sounds/Police/SndCorvette.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=15)
        {
            [audio playEffect:@"Sounds/Police/SndHarley.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=16)
        {
            [audio playEffect:@"Sounds/Police/SndHonk3.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=17)
        {
            [audio playEffect:@"Sounds/Car/SndLambo.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=18)
        {
            [audio playEffect:@"Sounds/Car/SndRaceBike.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        }else if(  random<=19)
        {
            [audio playEffect:@"Sounds/Car/SndSafeCar.mp3" volume:1.f*ratioSound pitch:1.f pan:0 loop:false];
        }
        
        
    }
    
    return car ;
}

@end
