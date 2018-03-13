//
//  HeroCar.m
//  StreetRacer
//
//  Created by Nam Trung on 12/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "HeroCar.h"
#import "GamePlay.h"

#define ARC4RANDOM_MAX      0x100000000
@implementation HeroCar
{
    NSInteger CarNo;
    BOOL isMovingLeft;
    BOOL isMovingRight;
    CGFloat turnSpeed;
    CGFloat turnSpeedMax;
    BOOL isRotateLeft;
    BOOL isRotateRight;
    
    
    CCNode *shadow;
    CCSprite *number;
    CCSprite *mainCar;
    
    CGFloat speed;
    
    BOOL isUptoDown;
    
    NSMutableArray *_smokes;
    NSMutableArray *_crashes;
    
    
    NSInteger blood;
}


- (void)didLoadFromCCB {
    _smokes = [NSMutableArray array];
    _crashes= [NSMutableArray array];
    
    speed = 30.f;
    turnSpeedMax=5.f;
    isUptoDown=false;
    
    isMovingLeft=false;
    isMovingRight=false;
    
    isRotateLeft=false;
    isRotateRight=false;
    
    [self schedule:@selector(genFuelSmoke) interval:7/speed];
    
    [self setSpeed:160.f];
    [self setDirection:false];
    
    CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
    [self setCar:[GamePlay heroNumber]];
    [self setNumber:random*12+1];
    
    self.physicsBody.collisionType = @"hero";
    self.physicsBody.sensor = FALSE;
    [self.physicsBody setCollisionCategories:[NSArray arrayWithObjects:@"hero", nil]];
    [self.physicsBody setCollisionMask:[NSArray arrayWithObjects:@"othercar",@"banhxe",@"bom", nil]];
    
    blood=10;
    
    if([GamePlay isSoundOn])
    {
        OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
        [audio playEffect:@"Sounds/Car/ENGINE_REV.mp3" volume:0.3f pitch:1.f pan:0 loop:false];
    }
}

-(void) decreaseBlood:(NSInteger) value{
    if(blood<=0)
        return;
    
    blood-=value;
    if (blood<0)
        blood=0;
    
    
    if(blood==8)
    {
        NSString* path=[NSString stringWithFormat:@"Cars/Car%02d/Car%02d_02.png",CarNo,CarNo];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
        mainCar.spriteFrame=imageframe;
        
    }else  if(blood==4)
    {
        NSString* path=[NSString stringWithFormat:@"Cars/Car%02d/Car%02d_08.png",CarNo,CarNo];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
        mainCar.spriteFrame=imageframe;
    }else if(blood<=0)
    {
        NSString* path=[NSString stringWithFormat:@"Cars/Car%02d/Car%02d_14.png",CarNo,CarNo];
        CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
        mainCar.spriteFrame=imageframe;
       // [self setSpeed:0.f];
        
        CCNode* smoke3= (CCNode*)[CCBReader load:@"Eff11"];
        smoke3.position=ccp(0,35);
        smoke3.scaleX=0.6f;
        smoke3.scaleY=0.6f;
        smoke3.opacity=0.2f;
        [self addChild:smoke3];
        [_smokes addObject:smoke3];
        
        [self schedule:@selector(clearSmokes) interval:0.1f ];
        
        [[GamePlay instance] gameOver];
    }
    
    
    if(blood!=0)
    {
        
        CCNode* crash1= (CCNode*)[CCBReader load:@"Eff6"];
        while (abs(crash1.position.x)<=1 || abs(crash1.position.y)<=1)
            crash1.position=ccp( ((double)arc4random() / ARC4RANDOM_MAX)*6-2,((double)arc4random() / ARC4RANDOM_MAX)*6-2);
        crash1.position=[self convertToWorldSpace:crash1.position];
        crash1.scaleX=0.6f;
        crash1.scaleY=0.6f;
        crash1.zOrder=self.zOrder;
        [self.parent addChild:crash1];
        [_crashes addObject:crash1];
        
        CCNode* crash2= (CCNode*)[CCBReader load:@"Eff8"];
        while (abs(crash2.position.x)<=1 || abs(crash2.position.y)<=1)
            crash2.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*6-3, ((double)arc4random() / ARC4RANDOM_MAX)*5-2);
        crash2.position=[self convertToWorldSpace:crash2.position];
        crash2.scaleX=0.6f;
        crash2.scaleY=0.6f;
        crash2.zOrder=self.zOrder;
        [self.parent addChild:crash2];
        [_crashes addObject:crash2];
        
        CCNode* crash3= (CCNode*)[CCBReader load:@"Eff20"];
        while (abs(crash3.position.x)<=1 || abs(crash3.position.y)<=1)
            crash3.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*5-2,((double)arc4random() / ARC4RANDOM_MAX)*5-3);
        crash3.position=[self convertToWorldSpace:crash3.position];
        crash3.scaleX=0.6f;
        crash3.scaleY=0.6f;
        crash3.zOrder=self.zOrder;
        [self.parent addChild:crash3];
        [_crashes addObject:crash3];
        
        CCNode* crash4= (CCNode*)[CCBReader load:@"Eff13"];
        while (abs(crash4.position.x)<=1 || abs(crash4.position.y)<=1)
            crash4.position=ccp(((double)arc4random() / ARC4RANDOM_MAX)*5-3,((double)arc4random() / ARC4RANDOM_MAX)*5-2);
        crash4.position=[self convertToWorldSpace:crash4.position];
        crash4.scaleX=0.6f;
        crash4.scaleY=0.6f;
        crash4.zOrder=self.zOrder;
        [self.parent addChild:crash4];
        [_crashes addObject:crash4];
        
    }else
    {
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
    
}
-(NSInteger) getBlood
{
    return blood;
}


-(void)clearSmokes {
    
    if(_smokes.count<=0)
        return;
    
    CCNode *lastSmoke=_smokes[_smokes.count-1];
    
    if (_smokes.count>1) {
        
        for(int i=0;i<_smokes.count-1;i++)
            [_smokes[i] removeFromParent];
        
        [_smokes removeAllObjects];
        [_smokes addObject:lastSmoke];
    }
    
    
}


-(void) setCar:(NSInteger) _no{
    
    NSString* path=[NSString stringWithFormat:@"Cars/Car%02d/Car%02d_01.png",_no,_no];
    CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
    mainCar.spriteFrame=imageframe;
    
    CarNo=_no;
    
}
-(NSInteger) getCarNo
{
    return CarNo;
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
}

-(void) setSpeed:(CGFloat) _speed{
    speed=_speed;
}

-(CGFloat) getSpeed{
    return speed;
}


-(void) genFuelSmoke{
    
    if(speed<=0)
        return;
    
    
    CCNode* smoke= (CCNode*)[CCBReader load:@"Eff1"];
    smoke.position=ccp(0,0);
    smoke.position=[self convertToWorldSpace:smoke.position];
    smoke.zOrder=self.zOrder;
    smoke.scaleX=0.5f+0.1*abs(blood-11);
    smoke.scaleY=0.5f+0.1*abs(blood-11);
    smoke.opacity=0.8f;
    
    [self.parent addChild:smoke];
    [_smokes addObject:smoke];
    
    if(isMovingLeft||isMovingRight)
    {
        CCNode* smoke2= (CCNode*)[CCBReader load:@"Eff1"];
        if(speed>0)
            smoke2.position=ccp(0,5);
        else
            smoke2.position=ccp(0,-25);
        smoke2.position=[self convertToWorldSpace:smoke2.position];

        smoke2.scaleX=1.f+0.1*abs(blood-11);
        smoke2.scaleY=1.f+0.1*abs(blood-11);
        smoke2.opacity=0.5f;
        smoke2.zOrder=self.zOrder;
        [self.parent addChild:smoke2];
        [_smokes addObject:smoke2];
    }
    
    if(blood<=4 && blood>0)
    {
        CCNode* smoke3= (CCNode*)[CCBReader load:@"Eff5"];
        
        smoke3.zOrder=self.zOrder;
        if(speed>0)
            smoke3.position=ccp(0,35);
        else
            smoke3.position=ccp(0,-25);
        smoke3.position=[self convertToWorldSpace:smoke3.position];

        smoke3.scaleX=0.2f;//*(6-blood);
        smoke3.scaleY=0.2f;//*(6-blood);
        smoke3.opacity=0.03f;
        [self.parent addChild:smoke3];
        [_smokes addObject:smoke3];
        
        CCNode* smoke2= (CCNode*)[CCBReader load:@"Eff1"];
        if(speed>0)
            smoke2.position=ccp(0,45);
        else
            smoke2.position=ccp(0,-25);
        smoke2.position=[self convertToWorldSpace:smoke2.position];

        smoke2.scaleX=1.f+0.1*abs(blood-11);
        smoke2.scaleY=1.f+0.1*abs(blood-11);
        smoke2.opacity=0.5f;
        smoke2.zOrder=self.zOrder;
        [self.parent addChild:smoke2];
        [_smokes addObject:smoke2];
        
       /* if(blood==5)
        {
            CCNode* smoke4= (CCNode*)[CCBReader load:@"Eff5"];
            //  smoke4.zOrder=self.zOrder;
            if(speed>0)
                smoke4.position=ccp(0,5);
            else
            smoke4.position=ccp(0,-25);
            smoke4.position=[self convertToWorldSpace:smoke4.position];

            smoke4.scaleX=0.2f;//*(6-blood);
            smoke4.scaleY=0.2f;//*(6-blood);
            smoke4.opacity=0.03f;
            [self addChild:smoke4];
        }
        */
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

-(void)update:(CCTime)delta {
    
    [self updateCar:delta];
    [self updateSmokes:delta];
    [self updateCrashes:delta];
}


-(void)updateSmokes:(CCTime)delta {
    NSMutableArray *offScreenObjs = nil;
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    
    for (CCNode* obj in _smokes) {
        
        CGPoint oldPos = [self convertToNodeSpace:obj.position];
    
        obj.position = ccp(obj.position.x , obj.position.y- (speed *delta));
        
        //CGPoint spriteWorldPos = [self obj];
        if (obj.position.y < -50||obj.position.y >s.height) {
            if (!offScreenObjs) {
                offScreenObjs = [NSMutableArray array];
            }
            [offScreenObjs addObject:obj];
        }
    }

    
    for (CCNode *smokeToRemove in offScreenObjs) {
        [smokeToRemove removeFromParent];
        [_smokes removeObject:smokeToRemove];
    }
    
}
-(void)updateCrashes:(CCTime)delta {
    NSMutableArray *offScreenCrashes = nil;
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    
    for (CCNode* crash in _crashes) {
        
        CGPoint oldPos = [self convertToNodeSpace:crash.position];
        
        if(sqrt(oldPos.x*oldPos.x + oldPos.y*oldPos.y)<20)
        {
            crash.position = [self convertToWorldSpace:ccp((oldPos.x*1.5),(oldPos.y*1.5))];
        }
        else
        {
            crash.position = ccp(crash.position.x , crash.position.y- (speed *delta));
        }
        
        
        //CGPoint spriteWorldPos = [self convertToWorldSpace:crash.position];
        if (crash.position.y < -50||crash.position.y >s.height) {
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
    self.position = ccp(self.position.x , 0.35f);
    
    if(isMovingLeft)
    {
        turnSpeed+=(0.14f * speed/160);
        if(turnSpeed>turnSpeedMax)
            turnSpeed=turnSpeedMax;
        
        if(self.position.x >(s.width-[[GamePlay instance]getStreetWidth] )/2)
            self.position = ccp(self.position.x -turnSpeed, self.position.y);
        else
            [self StopTurnLeftRight];
        
    }
    if(isMovingRight)
    {
        turnSpeed+=(0.14f * speed/160);
        if(turnSpeed>turnSpeedMax)
            turnSpeed=turnSpeedMax;
        
        if(self.position.x <(s.width+[[GamePlay instance]getStreetWidth])/2 )
            self.position = ccp(self.position.x + turnSpeed, self.position.y);
        else
            [self StopTurnLeftRight];
        
    }
    
    CGFloat minX=(s.width-[[GamePlay instance]getStreetWidth] )/2;
    CGFloat maxX=(s.width+[[GamePlay instance]getStreetWidth] )/2;
    if(self.position.x <minX)
        self.position = ccp(minX, self.position.y);
    if(self.position.x >maxX)
        self.position = ccp(maxX, self.position.y);
    
    
    if(self.position.x >=s.width/2)
        shadow.position= ccp((self.position.x -s.width/2)/30 +2.5f, shadow.position.y);
    if(self.position.x <s.width/2)
        shadow.position= ccp((self.position.x -s.width/2)/30 -1.5f, shadow.position.y);
    
}


-(void)TurnLeft:(CGFloat)value {
    if(blood<=0)
        return;
    
    if(value<0)
        value=-value;
    CGFloat duration=0.5f;
    if(!isMovingLeft)
        duration=0.35f;
    
    if(!isUptoDown)
    {
        id action=[CCActionRotateTo actionWithDuration:duration angle:-20 * (turnSpeedMax+1)];
        [self runAction:action];
    }else
    {
        id action=[CCActionRotateTo actionWithDuration:duration angle:20 * (turnSpeedMax+1)];
        [self runAction:action];
    }
    
    if(!isMovingLeft)
    {
        if([GamePlay isSoundOn])
        {
            OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
            [audio playEffect:@"Sounds/Car/SndTurnaround2.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
        turnSpeedMax=0;
        turnSpeed=(value*0.2f);
        
    }
    isMovingLeft=true;
    isMovingRight=false;
    
    
    turnSpeedMax+=(value*0.06f);
    if(turnSpeedMax<turnSpeed)
        turnSpeedMax=turnSpeed;
    if(turnSpeedMax>2.5f)
        turnSpeedMax=2.5f;
    
    
}

-(void)TurnRight:(CGFloat)value
{
    if(blood<=0)
        return;
    
    if(value<0)
        value=-value;
    
    CGFloat duration=0.5f;
    if(!isMovingLeft)
        duration=0.35f;
    
    if(!isUptoDown)
    {
        id action=[CCActionRotateTo actionWithDuration:duration angle:20 * (turnSpeedMax+1)];
        [self runAction:action];
    }else
    {
        id action=[CCActionRotateTo actionWithDuration:duration angle:-20 * (turnSpeedMax+1)];
        [self runAction:action];
    }
    
    if(!isMovingRight)
    {
        if([GamePlay isSoundOn])
        {
            OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
            [audio playEffect:@"Sounds/Car/SndTurnaround2.mp3" volume:0.1f pitch:1.f pan:0 loop:false];
        }
        turnSpeedMax=0;
        turnSpeed=(value*0.2f);
        
    }
    
    isMovingLeft=false;
    isMovingRight=true;
    
    turnSpeedMax+=(value*0.06f);
    if(turnSpeedMax<turnSpeed)
        turnSpeedMax=turnSpeed;
    if(turnSpeedMax>2.5f)
        turnSpeedMax=2.5f;
}
-(BOOL)isTurnLeft
{
    return  isMovingLeft;
}
-(BOOL)isTurnRight
{
    return  isMovingRight;
}
-(void) StopTurnLeftRight {
    
    isMovingLeft=false;
    isMovingRight=false;
    turnSpeed=0;
    turnSpeedMax=0;
}

@end
