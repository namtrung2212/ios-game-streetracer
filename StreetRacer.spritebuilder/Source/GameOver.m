//
//  GameOver.m
//  StreetRacer
//
//  Created by Nam Trung on 12/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameOver.h"

#import "GamePlay.h"
@implementation GameOver
{
    // CCNode*  _removeAdsBtn;
    
    
    
    CCNode*  _scoreLeftLabel;
    CCNode*  _bestScoreLeftLabel;
    
    CCNode*  _scoreLabel;
    CCNode*  _bestScoreLabel;
    CCNode*  _tryAgainBtn;
    CCNode*  _goToGarageBtn;
    BOOL _isPro;
}

- (void) Replay {
    [self BeforeQuit];
    [GamePlay setGameOver:false];
    
    CCScene *gameplayScene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
    
   // [[CCTextureCache sharedTextureCache] dumpCachedTextureInfo];
}
- (void) GoToGarage {
    
    //[GamePlay setGameOver:false];
    [self BeforeQuit];
    CCScene *scene = [CCBReader loadAsScene:@"MainScreen"];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}

-(void) BeforeQuit
{
   
    NSString* currentScoreStr=[NSString stringWithFormat:@"%d", [GamePlay getScores]];
    
    NSString* bestScoreStr=[[NSUserDefaults standardUserDefaults ] objectForKey:@"bestScore"];
    if(bestScoreStr==nil)
        bestScoreStr=@"0";
    
    if([GamePlay getScores]>=[bestScoreStr integerValue])
    {
        [[NSUserDefaults standardUserDefaults ]  setObject:currentScoreStr forKey:@"bestScore"];
        bestScoreStr=[[NSUserDefaults standardUserDefaults ]  objectForKey:@"bestScore"];
    }
}
- (void) RemoveAds {
    
}


- (void)didLoadFromCCB {
    
    _isPro=true;
    
    
    //[(CCLabelTTF*) _gameOverLabel   setString:NSLocalizedString(@"GameOver", nil)];
    /*
    [(CCLabelTTF* ) ((CCButton*) _tryAgainBtn).label   setString:NSLocalizedString(@"TryAgain", nil)];
    [(CCLabelTTF* ) ((CCButton*) _goToGarageBtn).label   setString:NSLocalizedString(@"Garage", nil)];
    [((CCLabelTTF* ) _scoreLeftLabel)  setString:NSLocalizedString(@"Score", nil)];
    [((CCLabelTTF* ) _bestScoreLeftLabel) setString:NSLocalizedString(@"BestScore", nil)];
     */
    ((CCLabelTTF* ) ((CCButton*) _tryAgainBtn).label).position = ccp(-10,0);
    ((CCLabelTTF* ) ((CCButton*) _goToGarageBtn).label).position = ccp(-10,0);
  
}



- (void)refreshScores {
  
    NSString* currentScoreStr=[NSString stringWithFormat:@"%d", [GamePlay getScores]];
    
    NSString* bestScoreStr=[[NSUserDefaults standardUserDefaults ]  objectForKey:@"bestScore"];
    if(bestScoreStr==nil)
        bestScoreStr=@"0";
    
    [(CCLabelTTF*)_scoreLabel setString:currentScoreStr];
    [(CCLabelTTF*)_bestScoreLabel setString:bestScoreStr];
   
   
}
@end
