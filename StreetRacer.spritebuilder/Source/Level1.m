//
//  Level1.m
//  StreetRacer
//
//  Created by Nam Trung on 12/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//
#import "GamePlay.h"
#import "Level1.h"
#import "Car.h"
#import "CarProvider.h"

#define ARC4RANDOM_MAX      0x100000000
@implementation Level1
{
    
    CCNode *streetFrame1;
    CCNode *streetFrame2;
    CCNode *streetFrame3;
    CCNode *streetFrame4;
    CCNode *streetFrame5;
    CCNode *streetFrame6;
    CCNode *streetFrame7;
    
    NSMutableArray *_otherCars;
    NSMutableArray *_vetXes;
    NSMutableArray *_banhXes;
    NSMutableArray *_bottles;
    NSMutableArray *_cautions;
    NSMutableArray *_lights;
    NSMutableArray *_boms;
}
- (void)didLoadFromCCB {
    /*
    
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
  //  [[CCTextureCache sharedTextureCache] addImage:@"BG/BG2.png"];
   // [[CCTextureCache sharedTextureCache] addImage:@"BG/BG3.png"];
   // [[CCTextureCache sharedTextureCache] addImage:@"BG/BG4.png"];
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
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Effects/eff23.plist"];
*/
    self.userInteractionEnabled = false;

    NSInteger rand=((double)arc4random() / ARC4RANDOM_MAX)*12;
    NSString* path=nil;
    
    if(rand<=3)
        path= @"BG/BG1.png";
  
    
   // else if(rand==3)
    //    path= @"BG/BG5.png";
    
    else if(rand==4)
        path= @"BG/BG6.png";
    
   // else if(rand<=6)
   //     path= @"BG/BG7.png";
    
   // else if(rand<=6)
     //   path= @"BG/BG8.png";
    
    else
        path= @"BG/BG1.png";

    [((CCSprite*)streetFrame1) setTexture:[[CCTextureCache sharedTextureCache] addImage:path]];
    [((CCSprite*)streetFrame2) setTexture:[[CCTextureCache sharedTextureCache] addImage:path]];
    [((CCSprite*)streetFrame3) setTexture:[[CCTextureCache sharedTextureCache] addImage:path]];
    [((CCSprite*)streetFrame4) setTexture:[[CCTextureCache sharedTextureCache] addImage:path]];
    [((CCSprite*)streetFrame5) setTexture:[[CCTextureCache sharedTextureCache] addImage:path]];
    [((CCSprite*)streetFrame6) setTexture:[[CCTextureCache sharedTextureCache] addImage:path]];
    [((CCSprite*)streetFrame7) setTexture:[[CCTextureCache sharedTextureCache] addImage:path]];
    
    streetFrame1.position = ccp(streetFrame1.position.x , 0);
    streetFrame2.position = ccp(streetFrame1.position.x , streetFrame1.position.y+streetFrame1.contentSize.height*streetFrame1.scaleY);
    streetFrame3.position = ccp(streetFrame2.position.x , streetFrame2.position.y+streetFrame2.contentSize.height*streetFrame2.scaleY);
    streetFrame4.position = ccp(streetFrame3.position.x , streetFrame3.position.y+streetFrame3.contentSize.height*streetFrame3.scaleY);
    streetFrame5.position = ccp(streetFrame4.position.x , streetFrame4.position.y+streetFrame4.contentSize.height*streetFrame4.scaleY);
    streetFrame6.position = ccp(streetFrame5.position.x , streetFrame5.position.y+streetFrame5.contentSize.height*streetFrame5.scaleY);
    streetFrame7.position = ccp(streetFrame6.position.x , streetFrame6.position.y+streetFrame6.contentSize.height*streetFrame6.scaleY);
    

    
    _otherCars = [NSMutableArray array];
    _vetXes = [NSMutableArray array];
    _banhXes = [NSMutableArray array];
    _bottles = [NSMutableArray array];
    _cautions = [NSMutableArray array];
     _lights = [NSMutableArray array];
    _boms = [NSMutableArray array];

    [self schedule:@selector(genNewOtherCars) interval:2.5f ];
    [self schedule:@selector(genNewVetXes) interval:2.5f ];
    [self schedule:@selector(genNewBanhXes) interval:2.5f ];
    [self schedule:@selector(genNewBottles) interval:2.5f ];
    [self schedule:@selector(genNewCautions) interval:2.5f ];
    [self schedule:@selector(genNewLights) interval:2.5f ];
    [self schedule:@selector(genNewBoms) interval:2.5f ];
    
    self.zOrder=[[GamePlay instance] getHero].zOrder-2;
}


- (void)genNewOtherCars{
    
    OtherCar* car= [CarProvider GenRandomCar:[[GamePlay getHero] position].x];
    car.zOrder=[[GamePlay instance] getHero].zOrder-1;
    [_otherCars addObject:car];
    [self.parent addChild:car];
    
    
    [self unschedule:@selector(genNewOtherCars)];
    if([[GamePlay getHero] getSpeed]>0)
        
        [self schedule:@selector(genNewOtherCars) interval:155/ [[GamePlay getHero] getSpeed] ];//155
    else
        [self schedule:@selector(genNewOtherCars) interval:1.f ];
    
}


- (void)genNewVetXes{
    
    for(int i=1;i<=3;i++)
    {
        CCSprite *vetxe;
        NSInteger rand=((double)arc4random() / ARC4RANDOM_MAX)*9;
        if(rand<=1)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/VetXe1.png"];
        }else if(rand==2)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/VetXe2.png"];
        }else if(rand==3)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/VetXe3.png"];
        }else if(rand==4)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/VetXe4.png"];
        }else if(rand==5)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/VetXe5.png"];
        }else if(rand==6 && i==3)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/OGa1.png"];
        }else if(rand==7 && i==2)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/Oga2.png"];
        }else if( i==1)
        {
            vetxe= [CCSprite spriteWithImageNamed:@"Others/Oga3.png"];
        }
        
        if(vetxe!=nil)
        {
            CGSize s = [CCDirector sharedDirector].viewSize;
            CGFloat minX=(s.width-[[GamePlay instance]getStreetWidth] )/2;
            CGFloat maxX=((s.width+[[GamePlay instance]getStreetWidth] )/2 ) - vetxe.contentSize.width;
            
            CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
            CGFloat newX = random * s.width;
            while ((newX<=minX)|| (newX>=maxX )) {
                random = ((double)arc4random() / ARC4RANDOM_MAX);
                newX = random * s.width;
            }
            
            vetxe.position = ccp(newX,s.height+20*i);
            vetxe.zOrder=[[GamePlay instance] getHero].zOrder-1;
            vetxe.anchorPoint=ccp(0,0);
            [self.parent addChild:vetxe];
            
            [_vetXes addObject:vetxe];
        }
    }
    [self unschedule:@selector(genNewVetXes)];
    if([[GamePlay getHero] getSpeed]>0)
        [self schedule:@selector(genNewVetXes) interval:200/ [[GamePlay getHero] getSpeed] ];
}



- (void)genNewBanhXes{
    for(int i=1;i<=2;i++)
    {
        CCSprite *banhxe;
        CGFloat rand=((double)arc4random() / ARC4RANDOM_MAX)*2;
        if(rand<=1)
        {
            banhxe= (CCSprite*)[CCBReader load:@"BanhXe1"];
            banhxe.scaleX=0.7f;
            banhxe.scaleY=0.7f;
        }else
        {
            banhxe= (CCSprite*)[CCBReader load:@"BanhXe2"];
            banhxe.scaleX=0.5f;
            banhxe.scaleY=0.5f;
        }
        
        banhxe.physicsBody.collisionType = @"banhxe";
        banhxe.physicsBody.sensor = FALSE;
        //  [banhxe.physicsBody setCollisionCategories:[NSArray arrayWithObjects:@"banhxe", nil]];
        [banhxe.physicsBody setCollisionMask:[NSArray arrayWithObjects:@"othercar",@"hero", nil]];
        
        CGSize s = [CCDirector sharedDirector].viewSize;
        CGFloat minX=(s.width-[[GamePlay instance]getStreetWidth] )/2-10;
        CGFloat maxX=((s.width+[[GamePlay instance]getStreetWidth] )/2 )+10 - banhxe.contentSize.width;
        
        CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
        CGFloat newX = random * s.width;
        while ((newX<=minX)|| (newX>=maxX )) {
            random = ((double)arc4random() / ARC4RANDOM_MAX);
            newX = random * s.width;
        }
        
        banhxe.position = ccp(newX,s.height+20 + ((double)arc4random() / ARC4RANDOM_MAX)*550);
        banhxe.zOrder=[[GamePlay instance] getHero].zOrder-1;
        banhxe.anchorPoint=ccp(0,0);
        [self.parent addChild:banhxe];
        
        [_banhXes addObject:banhxe];
        
    }
    [self unschedule:@selector(genNewBanhXes)];
    if([[GamePlay getHero] getSpeed]>0)
        [self schedule:@selector(genNewBanhXes) interval:1000/ [[GamePlay getHero] getSpeed] ];
}



- (void)genNewBoms{
  
        CCSprite *bom;
        bom= (CCSprite*)[CCBReader load:@"Eff22"];
        bom.scaleX=0.7f;
        bom.scaleY=0.7f;
        
        bom.physicsBody.collisionType = @"bom";
        bom.physicsBody.sensor = FALSE;
        [bom.physicsBody setCollisionMask:[NSArray arrayWithObjects:@"othercar",@"hero", nil]];
        
        CGSize s = [CCDirector sharedDirector].viewSize;
        CGFloat minX=(s.width-[[GamePlay instance]getStreetWidth] )/2+10;
        CGFloat maxX=((s.width+[[GamePlay instance]getStreetWidth] )/2 )-10 ;
        
        CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
        CGFloat newX = random * s.width;
        while ((newX<=minX)|| (newX>=maxX )) {
            random = ((double)arc4random() / ARC4RANDOM_MAX);
            newX = random * s.width;
        }
        
        bom.position = ccp(newX,s.height+20 + ((double)arc4random() / ARC4RANDOM_MAX)*550);
        bom.zOrder=[[GamePlay instance] getHero].zOrder-1;
        bom.anchorPoint=ccp(0,0);
        [self.parent addChild:bom];
        
        [_boms addObject:bom];
        
    
    [self unschedule:@selector(genNewBoms)];
    if([[GamePlay getHero] getSpeed]>0)
        [self schedule:@selector(genNewBoms) interval:1000/ [[GamePlay getHero] getSpeed] ];
}

- (void)genNewBottles{
    
    BOOL isLeft=((double)arc4random() / ARC4RANDOM_MAX) * 2 >1;
    int maxI=((double)arc4random() / ARC4RANDOM_MAX) * 3+3;
    for(int i=1;i<=maxI;i++)
    {
        CCSprite *obj;
        CGFloat rand=((double)arc4random() / ARC4RANDOM_MAX)*2;
        if(rand<=1)
        {
            obj= (CCSprite*)[CCBReader load:@"Bottle1"];
        }else
        {
            obj= (CCSprite*)[CCBReader load:@"Bottle2"];
        }
        obj.scaleX=0.7f;
        obj.scaleY=0.7f;
        obj.physicsBody.collisionType = @"bottle";
        obj.physicsBody.sensor = FALSE;
        [obj.physicsBody setCollisionMask:[NSArray arrayWithObjects:@"othercar",@"hero", nil]];
        
        CGSize s = [CCDirector sharedDirector].viewSize;
        CGFloat minX=(s.width-[[GamePlay instance]getStreetWidth] )/2-10;
        CGFloat maxX=((s.width+[[GamePlay instance]getStreetWidth] )/2 )+10 - obj.contentSize.width;
        
        CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
        CGFloat newX = random * s.width;
        while ((newX<=minX)|| (newX>=maxX)
               || (newX>=minX+30 && isLeft )
               || (newX<=maxX-30 && !isLeft )) {
            random = ((double)arc4random() / ARC4RANDOM_MAX);
            newX = random * s.width;
        }
        
        obj.position = ccp(newX,s.height+20 + ((double)arc4random() / ARC4RANDOM_MAX)*5);
        obj.zOrder=[[GamePlay instance] getHero].zOrder-1;
        obj.anchorPoint=ccp(0,0);
        [self.parent addChild:obj];
        
        [_bottles addObject:obj];
        
    }
    [self unschedule:@selector(genNewBottles)];
    if([[GamePlay getHero] getSpeed]>0)
        [self schedule:@selector(genNewBottles) interval:1000/ [[GamePlay getHero] getSpeed] ];
}


- (void)genNewCautions{
    for(int i=1;i<=1;i++)
    {
        CCSprite *obj;
        CGFloat rand=((double)arc4random() / ARC4RANDOM_MAX)*2;
        if(rand<=1)
        {
            obj= (CCSprite*)[CCBReader load:@"Caution"];
            obj.scaleX=0.7f;
            obj.scaleY=0.7f;
        }else
        {
            obj= (CCSprite*)[CCBReader load:@"Caution"];
            obj.scaleX=0.7f;
            obj.scaleY=0.7f;
        }
        
        obj.physicsBody.collisionType = @"caution";
        obj.physicsBody.sensor = FALSE;
        [obj.physicsBody setCollisionMask:[NSArray arrayWithObjects:@"othercar",@"hero", nil]];
        
        CGSize s = [CCDirector sharedDirector].viewSize;
        CGFloat minX=(s.width-[[GamePlay instance]getStreetWidth] )/2-10;
        CGFloat maxX=((s.width+[[GamePlay instance]getStreetWidth] )/2 )+10 - obj.contentSize.width;
        
        CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
        CGFloat newX = random * s.width;
        while ((newX<=minX)|| (newX>=maxX)
               || (newX>=minX+30 && newX<maxX-30)
               || (newX<=maxX-30 && newX>minX+30)) {
            
            random = ((double)arc4random() / ARC4RANDOM_MAX);
            newX = random * s.width;
        }
        
        obj.position = ccp(newX,s.height+20 + ((double)arc4random() / ARC4RANDOM_MAX)*150);
        obj.zOrder=[[GamePlay instance] getHero].zOrder-1;
        obj.anchorPoint=ccp(0,0);
        [self.parent addChild:obj];
        
        [_bottles addObject:obj];
        
    }
    [self unschedule:@selector(genNewCautions)];
    if([[GamePlay getHero] getSpeed]>0)
        [self schedule:@selector(genNewCautions) interval:900/ [[GamePlay getHero] getSpeed] ];
}


- (void)genNewLights{
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    CGFloat newY=s.height+20; //+ ((double)arc4random() / ARC4RANDOM_MAX)*150;
   
    for(int i=1;i<=2;i++)
    {
        CCSprite *obj;
        if(i==1)
        {
            obj= (CCSprite*)[CCBReader load:@"Light1"];
            obj.scaleX=0.33f;
            obj.scaleY=0.33f;
        }else
        {
            obj= (CCSprite*)[CCBReader load:@"Light2"];
            obj.scaleX=0.33f;
            obj.scaleY=0.33f;
        }
        
        obj.physicsBody.collisionType = @"light";
        obj.physicsBody.sensor = FALSE;
        [obj.physicsBody setCollisionMask:[NSArray arrayWithObjects:@"othercar",@"hero", nil]];
        
        CGFloat minX=((s.width-[[GamePlay instance]getStreetWidth] )/2)-15;
        CGFloat maxX=((s.width+[[GamePlay instance]getStreetWidth] )/2 )+15;
        CGFloat newX =i==1? minX:maxX;
       
        obj.position = ccp(newX,newY);
        obj.zOrder=[[GamePlay instance] getHero].zOrder-1;
        [self.parent addChild:obj];
        
        [_lights addObject:obj];
        
    }
    
    [self unschedule:@selector(genNewLights)];
    if([[GamePlay getHero] getSpeed]>0)
        [self schedule:@selector(genNewLights) interval:300/ [[GamePlay getHero] getSpeed] ];
}

- (void)update:(CCTime)delta {
    
    [self updateStreetGrounds:delta];
    [self updateOtherCars:delta];
    [self updateVetXes:delta];
    [self updateBanhXes:delta];
    [self updateBottles:delta];
    [self updateCautions:delta];
    [self updateLights:delta];
    [self updateBoms:delta];
}


- (void)updateOtherCars:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    CGFloat heroSpeed=[[GamePlay getHero] getSpeed];
    if(heroSpeed<=0)
        heroSpeed=70.f;
    
    NSMutableArray *offScreenOtherCars = nil;
    for (OtherCar* car in _otherCars) {
        if(![car getExplored])
            car.position = ccp(car.position.x , car.position.y- ((car.getSpeed*car.getDirection+heroSpeed) *delta));
        else
            car.position = ccp(car.position.x , car.position.y- ((car.getSpeed*car.getDirection+[[GamePlay getHero] getSpeed]) *delta));
        
        CGPoint carWorldPos = [self convertToWorldSpace:car.position];
        
        if (carWorldPos.y < -50){//||carWorldPos.y >s.height) {
            if (!offScreenOtherCars) {
                offScreenOtherCars = [NSMutableArray array];
            }
            [offScreenOtherCars addObject:car];
        }
    }
    
    for (CCNode *carToRemove in offScreenOtherCars) {
        [carToRemove removeFromParent];
        [_otherCars removeObject:carToRemove];
        // [self genNewOtherCars];
         if(![GamePlay isGameOver])
             [GamePlay increaseScores:1];
             
    }
    /*
     for (OtherCar* car1 in _otherCars) {
     
     CGFloat minDistance=MAXFLOAT;
     CGFloat car2X=-1;
     CGFloat car2Y=-1;
     for (OtherCar* car2 in _otherCars) {
     
     if(car1!=car2 && car2.position.y <car1.position.y)
     {
     if(abs(car1.position.x-car2.position.x)<50)//car1.contentSize.width)
     {
     if(abs(car1.position.y-car2.position.y)<minDistance)
     {
     minDistance=abs(car1.position.y-car2.position.y);
     car2X=car2.position.x;
     car2Y=car2.position.y;
     }
     }
     }
     }
     
     if(minDistance<60&&minDistance>20)
     {
     if(car1.position.x>s.width/2)
     [car1 TurnLeft];
     else
     [car1 TurnRight];
     }
     }
     */
}

- (void)updateStreetGrounds:(CCTime)delta {
    
    CGFloat groundSpeed=[[GamePlay getHero] getSpeed];
    if(  groundSpeed>0)
    {
        int increaseY=(groundSpeed *delta);
        streetFrame1.position = ccp(streetFrame1.position.x , streetFrame1.position.y+ increaseY);
        streetFrame2.position = ccp(streetFrame2.position.x , streetFrame2.position.y+ increaseY);
        streetFrame3.position = ccp(streetFrame3.position.x , streetFrame3.position.y+ increaseY);
        streetFrame4.position = ccp(streetFrame4.position.x , streetFrame4.position.y+ increaseY);
        streetFrame5.position = ccp(streetFrame5.position.x , streetFrame5.position.y+ increaseY);
        streetFrame6.position = ccp(streetFrame6.position.x , streetFrame6.position.y+ increaseY);
        streetFrame7.position = ccp(streetFrame7.position.x , streetFrame7.position.y+ increaseY);
        
        CGSize s = [CCDirector sharedDirector].viewSize;
        
        if (streetFrame1.position.y > s.height) {
            streetFrame1.position = ccp(streetFrame1.position.x, streetFrame2.position.y - streetFrame1.contentSize.height*streetFrame1.scaleY);
        }
        if (streetFrame2.position.y > s.height) {
            streetFrame2.position = ccp(streetFrame2.position.x, streetFrame3.position.y - streetFrame2.contentSize.height*streetFrame2.scaleY);
        }
        if (streetFrame3.position.y > s.height) {
            streetFrame3.position = ccp(streetFrame3.position.x, streetFrame4.position.y - streetFrame3.contentSize.height*streetFrame3.scaleY);
        }
        if (streetFrame4.position.y > s.height) {
            streetFrame4.position = ccp(streetFrame4.position.x, streetFrame5.position.y - streetFrame4.contentSize.height*streetFrame4.scaleY);
        }
        if (streetFrame5.position.y > s.height) {
            streetFrame5.position = ccp(streetFrame5.position.x, streetFrame6.position.y - streetFrame5.contentSize.height*streetFrame5.scaleY);
        }
        if (streetFrame6.position.y > s.height) {
            streetFrame6.position = ccp(streetFrame6.position.x, streetFrame7.position.y - streetFrame6.contentSize.height*streetFrame6.scaleY);
        }
        if (streetFrame7.position.y > s.height) {
            streetFrame7.position = ccp(streetFrame7.position.x, streetFrame1.position.y - streetFrame7.contentSize.height*streetFrame7.scaleY);
        }
        
    }
    
}



- (void)updateVetXes:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    int increaseY=([[GamePlay getHero] getSpeed] *delta);
    
    NSMutableArray *offScreenOthers = nil;
    for (CCSprite* vetxe in _vetXes) {
        
        vetxe.position = ccp(vetxe.position.x , vetxe.position.y- increaseY);
        CGPoint carWorldPos = [self convertToWorldSpace:vetxe.position];
        if (carWorldPos.y <-vetxe.contentSize.height-30) {
            if (!offScreenOthers) {
                offScreenOthers = [NSMutableArray array];
            }
            [offScreenOthers addObject:vetxe];
        }
    }
    
    for (CCSprite *vetxeToRemove in offScreenOthers) {
        [vetxeToRemove removeFromParent];
        [_vetXes removeObject:vetxeToRemove];
    }
}



- (void)updateBanhXes:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    int increaseY=([[GamePlay getHero] getSpeed] *delta);
    
    NSMutableArray *offScreenOthers = nil;
    for (CCSprite* banhxe in _banhXes) {
        
        banhxe.position = ccp(banhxe.position.x , banhxe.position.y- increaseY);
        CGPoint carWorldPos = [self convertToWorldSpace:banhxe.position];
        if (carWorldPos.y <-banhxe.contentSize.height-30) {
            if (!offScreenOthers) {
                offScreenOthers = [NSMutableArray array];
            }
            [offScreenOthers addObject:banhxe];
        }
    }
    
    for (CCSprite *banhxeToRemove in offScreenOthers) {
        [banhxeToRemove removeFromParent];
        [_banhXes removeObject:banhxeToRemove];
    }
}


- (void)updateBottles:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    int increaseY=([[GamePlay getHero] getSpeed] *delta);
    
    NSMutableArray *offScreenOthers = nil;
    for (CCSprite* obj in _bottles) {
        
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
        [_bottles removeObject:objToRemove];
    }
}



- (void)updateCautions:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    int increaseY=([[GamePlay getHero] getSpeed] *delta);
    
    NSMutableArray *offScreenOthers = nil;
    for (CCSprite* obj in _cautions) {
        
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
        [_cautions removeObject:objToRemove];
    }
}


- (void)updateLights:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    int increaseY=([[GamePlay getHero] getSpeed] *delta);
    
    NSMutableArray *offScreenOthers = nil;
    for (CCSprite* obj in _lights) {
        
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
        [_lights removeObject:objToRemove];
    }
}


- (void)updateBoms:(CCTime)delta {
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    int increaseY=([[GamePlay getHero] getSpeed] *delta);
    
    NSMutableArray *offScreenOthers = nil;
    for (CCSprite* obj in _boms) {
        
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
        [_boms removeObject:objToRemove];
    }
}
@end
