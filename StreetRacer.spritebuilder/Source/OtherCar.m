//
//  OtherCar.m
//  StreetRacer
//
//  Created by Nam Trung on 12/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "OtherCar.h"
#import "GamePlay.h"    

#define ARC4RANDOM_MAX      0x100000000

@implementation OtherCar
{
    NSInteger CarNo;
    BOOL isMovingLeft;
    BOOL isMovingRight;
    CGFloat turnSpeed;
    
    BOOL isRotateLeft;
    BOOL isRotateRight;
    
    
    CCNode *shadow;
    CCSprite *number;
    CCSprite *mainCar;
    
    CGFloat speed;
    
    BOOL isUptoDown;
    BOOL isExplored;
    
    NSMutableArray *_smokes;
    NSMutableArray *_crashes;
}


- (void)didLoadFromCCB {
    _smokes = [NSMutableArray array];
    _crashes = [NSMutableArray array];
    isExplored=FALSE;
    
    speed = 200.f;
    isUptoDown=false;
    
    isMovingLeft=false;
    isMovingRight=false;
    
    isRotateLeft=false;
    isRotateRight=false;
    
    [self schedule:@selector(genFuelSmoke) interval:70/speed];
    
    CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
    [self setSpeed:random * 15 + 20];
    
    [self setCar:random*19+1];
    [self setNumber:random*12+1];
    
    [self setDirection:true];
    
    self.physicsBody.collisionType = @"othercar";
    self.physicsBody.sensor = FALSE;
   // [self.physicsBody setCollisionCategories:[NSArray arrayWithObjects:@"othercar", nil]];
    [self.physicsBody setCollisionMask:[NSArray arrayWithObjects:@"hero",@"banhxe",@"bom", nil]];

}

-(void) setCar:(NSInteger) _no{
    
    NSString* path=[NSString stringWithFormat:@"Cars/Car%02d/Car%02d_01.png",_no,_no];
    CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
    mainCar.spriteFrame=imageframe;
    CarNo=_no;
}

-(void) setNumber:(NSInteger) num{
    
    NSString* path=[NSString stringWithFormat:@"Numbers/No_%02d.png",num];
    CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
    number.spriteFrame=imageframe;
    
}

-(void) setDirection:(BOOL) _isUpToDown{
    isUptoDown=_isUpToDown;
    if(isUptoDown)
        self.scaleY=-1;
    else
        self.scaleY=1;
}
-(BOOL) getDirection
{
    return isUptoDown;
}
-(void) setSpeed:(CGFloat) _speed{
    speed=_speed;
}

-(CGFloat) getSpeed{
    return speed;
}

-(void) genFuelSmoke{
    
    if(speed==0)
        return;
    
    CCNode* smoke= (CCNode*)[CCBReader load:@"Eff1"];
    smoke.position=ccp(0,-5);
    
    smoke.scaleX=0.6f;
    smoke.scaleY=0.6f;
    smoke.opacity=0.1f;
    
    [self addChild:smoke];
    [_smokes addObject:smoke];
    
    if(isMovingLeft||isMovingRight)
    {
        CCNode* smoke2= (CCNode*)[CCBReader load:@"Eff1"];
        smoke2.position=ccp(0,5);
        smoke2.scaleX=1.2f;
        smoke2.scaleY=1.2f;
        smoke2.opacity=0.1f;
        [self addChild:smoke2];
        [_smokes addObject:smoke2];
    }
}


-(void) genFuelSmokeLand{
    CCNode* smoke= (CCNode*)[CCBReader load:@"Eff11"];
    smoke.position=ccp(0,10);
    smoke.scaleX=1.5f;
    smoke.scaleY=1.5f;
    smoke.opacity=0.2f;
    [self addChild:smoke];
    [_smokes addObject:smoke];
}


-(void) genCollisionExplore{
    CCNode* smoke= (CCNode*)[CCBReader load:@"Eff11"];
    smoke.position=ccp(0,30);
    smoke.scaleX=0.6f;
    smoke.scaleY=0.6f;
    smoke.opacity=0.8f;
    [self addChild:smoke];
    [_smokes addObject:smoke];
}

-(BOOL) getExplored
{
    return  isExplored;
}
-(void) doExplore{
    
        if(isExplored)
            return;
    
        isExplored=TRUE;
    
        NSString* path=[NSString stringWithFormat:@"Cars/Car%02d/Car%02d_08.png",CarNo,CarNo];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
        mainCar.spriteFrame=imageframe;
        speed-=50;
        if(speed<0)
            speed=0;
    
        CCNode* smoke3= (CCNode*)[CCBReader load:@"Eff11"];
        smoke3.position=ccp(0,35);
        smoke3.scaleX=0.6f;
        smoke3.scaleY=0.6f;
        smoke3.opacity=0.05f;
        [self addChild:smoke3];
        [_smokes addObject:smoke3];
    
        [self schedule:@selector(clearSmokes) interval:1.5f ];

        
        CCNode* crash1= (CCNode*)[CCBReader load:@"Eff6"];
        while (abs(crash1.position.x)<=1 || abs(crash1.position.y)<=1)
            crash1.position=ccp( ((double)arc4random() / ARC4RANDOM_MAX)*6-5,((double)arc4random() / ARC4RANDOM_MAX)*6-2);
        crash1.position=[self convertToWorldSpace:crash1.position];
        crash1.scaleX=0.5f;
        crash1.scaleY=0.5f;
        crash1.zOrder=self.zOrder;
        [self.parent addChild:crash1];
        [_crashes addObject:crash1];
        
        CCNode* crash2= (CCNode*)[CCBReader load:@"Eff20"];
        while (abs(crash2.position.x)<=1 || abs(crash2.position.y)<=1)
            crash2.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*6-5, ((double)arc4random() / ARC4RANDOM_MAX)*5-2);
        crash2.position=[self convertToWorldSpace:crash2.position];
        crash2.scaleX=0.5f;
        crash2.scaleY=0.5f;
        crash2.zOrder=self.zOrder;
        [self.parent addChild:crash2];
        [_crashes addObject:crash2];
        
        CCNode* crash3= (CCNode*)[CCBReader load:@"Eff10"];
        while (abs(crash3.position.x)<=1 || abs(crash3.position.y)<=1)
            crash3.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*5-4,((double)arc4random() / ARC4RANDOM_MAX)*5-3);
        crash3.position=[self convertToWorldSpace:crash3.position];
        crash3.scaleX=0.5f;
        crash3.scaleY=0.5f;
        crash3.zOrder=self.zOrder;
        [self.parent addChild:crash3];
        [_crashes addObject:crash3];
        
    
        CCNode* crash4= (CCNode*)[CCBReader load:@"Eff13"];
        while (abs(crash4.position.x)<=1 || abs(crash4.position.y)<=1)
            crash4.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*5-3,((double)arc4random() / ARC4RANDOM_MAX)*5-2);
        crash4.position=[self convertToWorldSpace:crash4.position];
        crash4.scaleX=0.5f;
        crash4.scaleY=0.5f;
        crash4.zOrder=self.zOrder;
        [self.parent addChild:crash4];
        [_crashes addObject:crash4];
        
   /*
        CCNode* crash5= (CCNode*)[CCBReader load:@"Eff14"];
        while (abs(crash5.position.x)<=1 || abs(crash5.position.y)<=1)
            crash5.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*5-2,((double)arc4random() / ARC4RANDOM_MAX)*5-3);
        crash5.position=[self convertToWorldSpace:crash5.position];
        crash5.scaleX=0.8f;
        crash5.scaleY=0.8f;
        crash5.zOrder=self.zOrder;
        [self.parent addChild:crash5];
        [_crashes addObject:crash5];
        
        CCNode* crash6= (CCNode*)[CCBReader load:@"Eff15"];
        while (abs(crash6.position.x)<=1 || abs(crash6.position.y)<=1)
            crash6.position=ccp(-((double)arc4random() / ARC4RANDOM_MAX)*6-2,((double)arc4random() / ARC4RANDOM_MAX)*6-3);
        crash6.position=[self convertToWorldSpace:crash6.position];
        crash6.scaleX=0.8f;
        crash6.scaleY=0.8f;
        crash6.zOrder=self.zOrder;
        [self.parent addChild:crash6];
        [_crashes addObject:crash6];
        */
        CCNode* crash7= (CCNode*)[CCBReader load:@"Eff16"];
        while (abs(crash7.position.x)<=1 || abs(crash7.position.y)<=1)
            crash7.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*6-3,-((double)arc4random() / ARC4RANDOM_MAX)*5-2);
        crash7.position=[self convertToWorldSpace:crash7.position];
        crash7.scaleX=0.8f;
        crash7.scaleY=0.8f;
        crash7.zOrder=self.zOrder;
        [self.parent addChild:crash7];
        [_crashes addObject:crash7];
    

    
}



-(void)clearSmokes {
    
    if(_smokes.count<=0)
        return;
    
    CCNode *lastSmoke=_smokes[0];
    
    if (_smokes.count>1) {
        
        for(int i=_smokes.count-1;i>0;i--)
            [_smokes[i] removeFromParent];
        
        [_smokes removeAllObjects];
        [_smokes addObject:lastSmoke];
    }
}


-(void)update:(CCTime)delta {
    
    [self updateCar:delta];
    [self updateSmokes:delta];
    [self updateCrashes:delta];
}


-(void)updateSmokes:(CCTime)delta {
    NSMutableArray *offScreenSmokes = nil;
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    for (CCNode* smoke in _smokes) {
        
        smoke.position = ccp(smoke.position.x , smoke.position.y- (speed *delta));
        
        CGPoint spriteWorldPos = [self convertToWorldSpace:smoke.position];
        // CGPoint spriteScreenPos = [self convertToNodeSpace:spriteWorldPos];
        if (spriteWorldPos.y < -50||spriteWorldPos.y >s.height) {
            if (!offScreenSmokes) {
                offScreenSmokes = [NSMutableArray array];
            }
            [offScreenSmokes addObject:smoke];
        }
    }
    
    for (CCNode *smokeToRemove in offScreenSmokes) {
        [smokeToRemove removeFromParent];
        [_smokes removeObject:smokeToRemove];
    }
    
}


-(void)updateCrashes:(CCTime)delta {
    NSMutableArray *offScreenCrashes = nil;
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    
    for (CCNode* crash in _crashes) {
        
        CGPoint oldPos = [self convertToNodeSpace:crash.position];
        
        if( sqrt(oldPos.x*oldPos.x + oldPos.y*oldPos.y)<20)
        {
            crash.position = [self convertToWorldSpace:ccp((oldPos.x*1.5),(oldPos.y*1.5))];
        }
        else
        {
            crash.position = ccp(crash.position.x , crash.position.y- ([[GamePlay getHero]getSpeed] *delta));
           
        }
        
        CGPoint spriteWorldPos = [self convertToWorldSpace:crash.position];
        if (spriteWorldPos.y < -50||spriteWorldPos.y >s.height) {
            if (!offScreenCrashes) {
                offScreenCrashes = [NSMutableArray array];
            }
            [offScreenCrashes addObject:crash];
        }
    }
    
    for (CCNode *crashToRemove in offScreenCrashes) {
        [crashToRemove removeFromParent];
        [_crashes removeObject:crashToRemove];
    }
    
}

-(void)updateCar:(CCTime)delta {
    CGSize s = [CCDirector sharedDirector].viewSize;
    if(isExplored)
    {
         speed-=5;
         if(speed<0)
             speed=0;
    }
    
    if(isMovingLeft)
    {
        turnSpeed+=2.2f;
        if(turnSpeed>5.f)
            turnSpeed=5.f;
        
        if(self.position.x >(s.width-[[GamePlay instance]getStreetWidth] )/2)
            self.position = ccp(self.position.x -turnSpeed , self.position.y);
        else
            [self StopTurnLeftRight];
        
    }
    if(isMovingRight)
    {
        turnSpeed+=0.2f;
        if(turnSpeed>5.f)
            turnSpeed=5.f;
        
        if(self.position.x <(s.width+[[GamePlay instance]getStreetWidth])/2 )
            self.position = ccp(self.position.x + turnSpeed, self.position.y);
        else
            [self StopTurnLeftRight];
        
    }
    
    if(self.position.x >=s.width/2)
        shadow.position= ccp((self.position.x -s.width/2)/30 +2.5f, shadow.position.y);
    if(self.position.x <s.width/2)
        shadow.position= ccp((self.position.x -s.width/2)/30 -1.5f, shadow.position.y);
    
}


-(void)TurnLeft {
    isMovingLeft=true;
    isMovingRight=false;
    turnSpeed=4;
    
    if(!isUptoDown)
    {
        id action=[CCActionRotateTo actionWithDuration:0.5 angle:-15];
        [self runAction:action];
    }else
    {
        id action=[CCActionRotateTo actionWithDuration:0.5 angle:15];
        [self runAction:action];
    }
    
}

-(void)TurnRight {
    isMovingLeft=false;
    isMovingRight=true;
    turnSpeed=4;
    
    if(!isUptoDown)
    {
        id action=[CCActionRotateTo actionWithDuration:0.5 angle:15];
        [self runAction:action];
    }else
    {
        id action=[CCActionRotateTo actionWithDuration:0.5 angle:-15];
        [self runAction:action];
    }
    
}

-(void) StopTurnLeftRight {
    
    if(isMovingLeft||isMovingRight)
    {
        id action=[CCActionRotateTo actionWithDuration:0.5 angle:0];
        [self runAction:action];
    }
    isMovingLeft=false;
    isMovingRight=false;
    turnSpeed=0;
    
}



- (void)setRandomSpeed {
    
    CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
    [self setSpeed:random * 10 + 10];
}


@end
