//
//  PenSoundDao.h
//  LearningMachine0.1
//
//  Created by Jenson on 11-2-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "HZPYData.h"
#import "HZBSData.h"
#import "HZData.h"
@class UserData;
@interface PenSoundDao : BaseDao {

}

+ (PenSoundDao *)sharedPenSoundDao;
-(NSMutableArray*)selectHZBSBIHUA;//搜索汉字笔画列表
-(NSMutableArray*)selectHZBSALL:(NSString *)bihuaarg;//收缩全部汉字部首表
-(NSMutableArray*)selectHZPY4Zi:(NSString*)ziarg;//根据字搜索
-(NSMutableArray*)selectHZPY4py:(NSString*)pyarg;//根据拼音搜索
-(HZData *)selectHZ4hz:(NSString*)pyarg;  //根据汉字搜索详解
//
////增加
//-(void)insertUserData:(UserData*)usData;
////查询
//-(NSMutableArray *)selectUserData;
////更新
//-(void)updateUserData:(UserData*)usData;
////删除
//-(void)deleteUserData;

//-(void)setUserSecret:(NSString*)secretStr;
//-(void)setUserEmail:(NSString*)email;
//-(BOOL)checkUserSecret:(NSString*)secretStr;
//-(NSArray*)selectCategoryList;
//-(void)isnertNewCategory:(NSString*)cateName;
//-(NSMutableArray*)selectPassInfoList;
//-(void)isnertNewPassinfo:(NSString*)passName passAccount:(NSString*)passAccount passPassword:(NSString*)passWord;
//-(void)delPassInfo:(int)passId;
//-(void)updatePassinfo:(NSString*)passName passAccount:(NSString*)passAccount passPassword:(NSString*)passWord passId:(int)passId;
//-(NSString*)selectUserEmail;
//-(UserData*)selectUseSecret;
//-(void)updateEmail:(NSString*)email secret:(NSString*)secret;
@end
