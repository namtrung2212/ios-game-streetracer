//
//  Car.m
//  StreetRacer
//
//  Created by Nam Trung on 12/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Car.h"
#import "GamePlay.h"
#define ARC4RANDOM_MAX      0x100000000
@implementation Car
{
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
    
    NSMutableArray *_smokes;
}


- (void)didLoadFromCCB {
    _smokes = [NSMutableArray array];
    
    speed = 200.f;
    isUptoDown=false;
    
    isMovingLeft=false;
    isMovingRight=false;
    
    isRotateLeft=false;
    isRotateRight=false;
   
    [self schedule:@selector(genFuelSmoke:) interval:40/speed];
    
}

-(void) setCar:(NSInteger) carNo{
    
    NSString* path=[NSString stringWithFormat:@"Cars/Car%02d/Car%02d_01.png",carNo,carNo];
    CCSpriteFrame* imageframe = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:path];
    mainCar.spriteFrame=imageframe;
    
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

-(void) genFuelSmoke: (id) sender{
    CCNode* smoke= (CCNode*)[CCBReader load:@"Eff1"];
    smoke.position=ccp(0,-5);
    smoke.scaleX=0.8f;
    smoke.scaleY=0.8f;
    smoke.opacity=0.8f;
    
    [self addChild:smoke];
    [_smokes addObject:smoke];
    
    if(isMovingLeft||isMovingRight)
    {
        CCNode* smoke2= (CCNode*)[CCBReader load:@"Eff1"];
        smoke2.position=ccp(0,5);
        smoke2.scaleX=1.2f;
        smoke2.scaleY=1.2f;
        smoke2.opacity=0.5f;
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

-(void)update:(CCTime)delta {
    
    [self updateCar:delta];
    [self updateSmokes:delta];
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

-(void)updateCar:(CCTime)delta {
    CGSize s = [CCDirector sharedDirector].viewSize;
    
    if(isMovingLeft)
    {
        turnSpeed+=0.2f;
        if(turnSpeed>5.f)
            turnSpeed=5.f;
        
        if(self.position.x >(s.width-[[GamePlay instance]getStreetWidth] )/2)
            self.position = ccp(self.position.x -turnSpeed, self.position.y);
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
    turnSpeed=2;
    
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
    turnSpeed=2;
    
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
@end
