
//  PenSoundDao.m
//  LearningMachine0.1
//
//  Created by Jenson on 11-2-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved. 
#import "PenSoundDao.h" 
#import "FMResultSet.h"
#import "FMDatabase.h"    

@implementation PenSoundDao 
static PenSoundDao *_sharedPenSoundDao = nil; 
/**
 数据库采用单例模式: 不必每个地方去管理
 */
+ (PenSoundDao *)sharedPenSoundDao{	if (!_sharedPenSoundDao) {		_sharedPenSoundDao = [[self alloc] init];} return _sharedPenSoundDao;}



//汉字部首
-(NSMutableArray*)selectHZBSBIHUA{
    
    [super getDatabase:DBNAME];
    NSString *sql = @"select BiHua from HanZiBuShou group by BiHua";
    
    //无参数模式
	FMResultSet *rs = [db executeQuery:sql];
    
	NSMutableArray *infoArr = [[[NSMutableArray alloc]init] autorelease];
    
	while ([rs next]) {
        HZPYData *hzd = [[HZPYData alloc]init];
         
        hzd.hzBh = [rs stringForColumn:@"BiHua"];
         
        [infoArr addObject:hzd];
        [hzd release];
	}
	[super closeDatabase];
	return infoArr;
}


-(NSMutableArray*)selectHZPY4py:(NSString*)pyarg{

    [super getDatabase:DBNAME];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM HanZiPinYin WHERE PinYin = '%@'",pyarg];
    NSLog(@"%@",sql);
    //无参数模式
	FMResultSet *rs = [db executeQuery:sql];

	NSMutableArray *infoArr = [[[NSMutableArray alloc]init] autorelease];

	while ([rs next]) {
        HZPYData *hzd = [[HZPYData alloc]init];
        

        hzd.hzId = [rs intForColumn:@"ID"];
        hzd.hzBh = [rs stringForColumn:@"BiHua"];
        hzd.hzZi = [rs stringForColumn:@"Zi"];
        hzd.hzPy = [rs stringForColumn:@"PinYin"];
        [infoArr addObject:hzd];
        [hzd release];
	}
	[super closeDatabase];
	return infoArr;
}

-(NSMutableArray*)selectHZPY4Zi:(NSString*)ziarg{
    
    [super getDatabase:DBNAME];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM HanZiPinYin WHERE Zi = '%@'",ziarg];
//    NSLog(@"%@",sql);
    //无参数模式
	FMResultSet *rs = [db executeQuery:sql];
    
	NSMutableArray *infoArr = [[[NSMutableArray alloc]init] autorelease];
    
	while ([rs next]) {
        HZPYData *hzd = [[HZPYData alloc]init];
        
        
        hzd.hzId = [rs intForColumn:@"ID"];
        hzd.hzBh = [rs stringForColumn:@"BiHua"];
        hzd.hzZi = [rs stringForColumn:@"Zi"];
        hzd.hzPy = [rs stringForColumn:@"PinYin"];
        [infoArr addObject:hzd];
        [hzd release];
	}
	[super closeDatabase];
	return infoArr;
}

//汉字部首
-(NSMutableArray*)selectHZBSALL:(NSString *)bihuaarg{
    
    [super getDatabase:DBNAME];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM HanZiBuShou WHERE BiHua = '%@'",bihuaarg];

    //无参数模式
	FMResultSet *rs = [db executeQuery:sql];
    
	NSMutableArray *infoArr = [[[NSMutableArray alloc]init] autorelease];
    
	while ([rs next]) {
        HZPYData *hzd = [[HZPYData alloc]init];
        
        
        hzd.hzId = [rs intForColumn:@"ID"];
        hzd.hzBh = [rs stringForColumn:@"BiHua"];
        hzd.hzZi = [rs stringForColumn:@"BuShou"];
        [infoArr addObject:hzd];
        [hzd release];
	}
	[super closeDatabase];
	return infoArr;
}


-(HZData *)selectHZ4hz:(NSString*)pyarg{
    
    [super getDatabase:DBNAME];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM HanZi WHERE Zi = '%@'",pyarg];
//    NSLog(@"%@",sql);
    //无参数模式
	FMResultSet *rs = [db executeQuery:sql];
    
    HZData *hzd = [[[HZData alloc]init] autorelease];
	while ([rs next]) {
        
        hzd.hzId = [rs intForColumn:@"ID"];
        hzd.hzBh = [rs stringForColumn:@"BiHua"];
        hzd.hzZi = [rs stringForColumn:@"Zi"];
        hzd.hzBs = [rs stringForColumn:@"BuShou"];
        hzd.hzPy = [rs stringForColumn:@"PinYin"];
        hzd.hzJj = [rs stringForColumn:@"JianJie"];
        hzd.hzXj = [rs stringForColumn:@"XiangJie"];
        hzd.hzWb = [rs stringForColumn:@"WuBi"];
    
	}
	[super closeDatabase];
	return hzd;
    
}

///**
// *
// * @Description: 设置用户的密钥 
// */
//-(void)setUserSecret:(NSString*)secretStr{
//    
//    [super getDOCDatabase:DBNAME];
////	//NSLog(@"%@",[PassUtil encrypt:secretStr]);
////	//NSLog(@"%@",[PassUtil getStringFromWChar:[PassUtil getWCharFromString:secretStr]]);
//	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET my_secret = '%@' where my_id = 1",@"myinfo",[PassUtil encrypt:secretStr]];
//    
//	[db executeUpdate:sql];
//	if ([db hadError]) {
////		//NSLog(@"更新错误 请到这里(setUserSecret:)断点测试");
//	}
//	[super closeDatabase];
//    
////    [self selectUseSecret];
//}
//
//-(BOOL)checkUserSecret:(NSString*)secretStr{
//    [self selectUseSecret];
//    NSString *secstr = [PassUtil encrypt:secretStr];
////    //NSLog(@"%@",[[UserData sharedInstance] secret]);
//    //验证秘要
//    if ([[[UserData sharedInstance] secret] isEqualToString:secstr]) {
//        return YES;
//    }
//    return NO;
//}
//
//-(NSString*)selectUserEmail{
//    
//    [super getDOCDatabase:DBNAME];
//    NSString *email;
//    //无参数模式
//	FMResultSet *rs = [db executeQuery:[self SQL:@"SELECT * FROM %@ where my_id = 1"
//										 inTable:@"myinfo"]];
//	
//    
//	while ([rs next]) {
//		
//		email = [rs stringForColumn:@"my_email"];//email
//        
//		break;
//	}
//	[super closeDatabase];
//    return [PassUtil decrypt:email];
//}
//
//-(UserData*)selectUseSecret{
//    
//    [super getDOCDatabase:DBNAME];
//    
//    //无参数模式
//	FMResultSet *rs = [db executeQuery:[self SQL:@"SELECT * FROM %@ where my_id = 1"
//										 inTable:@"myinfo"]];
//	
//	         UserData *us = [[[UserData alloc]init] autorelease];
//	while ([rs next]) {
//		//NSLog(@"查询到的email:%@ \n  密码:%@",[rs stringForColumn:@"my_email"],[rs stringForColumn:@"my_secret"]);
//
//		[us setEmail:[PassUtil decrypt:[rs stringForColumn:@"my_email"]]];//email
//        [us setSecret:[rs stringForColumn:@"my_secret"]]; //密钥
//		break;
//	}
//	[super closeDatabase];
//    return us;
//}
// 
//
//-(void)setUserEmail:(NSString*)email{
//    
//    [super getDOCDatabase:DBNAME];
//    //	//NSLog(@"%@",[PassUtil encrypt:secretStr]);
//    //	//NSLog(@"%@",[PassUtil getStringFromWChar:[PassUtil getWCharFromString:secretStr]]);
//	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET my_email = '%@' where my_id = 1",@"myinfo",[PassUtil encrypt:email]];
//    
//	[db executeUpdate:sql];
//	if ([db hadError]) {
//		//NSLog(@"更新错误 请到这里(setUserSecret:)断点测试");
//	}
//	[super closeDatabase];
//    
//    //    [self selectUseSecret];
//}
////修改email 和 secret
//-(void)updateEmail:(NSString*)email secret:(NSString*)secret{
//
//    [super getDOCDatabase:DBNAME];
//    //表名user(pass_name,pass_password,pass_account) VALUES ('%@','%@','%@')
//    NSString *sql = [NSString stringWithFormat:@"UPDATE  %@ SET my_email = '%@',my_secret= '%@'  where my_id = 1",@"myinfo",[PassUtil encrypt:email],[PassUtil encrypt:secret]];
//    
//    //NSLog(@"%@",sql);
//    [db executeUpdate:sql];
//    if ([db hadError]) {
//        //NSLog(@"添加错误 请到这里(isnertNewPassinfo:)断点测试");
//    }
//    [super closeDatabase];
//}
//
//-(NSArray*)selectCategoryList{
//    
//    [super getDOCDatabase:DBNAME]; 
//    //无参数模式
//	FMResultSet *rs = [db executeQuery:[self SQL:@"SELECT * FROM %@"
//										 inTable:@"category"]];
//	
//	NSMutableArray *infoArr = [[[NSMutableArray alloc]init] autorelease];
//	
//	while ([rs next]) {
//		
//		CategoryData *ctData = [[CategoryData alloc]init];
//        ctData.cateId = [rs intForColumn:@"cate_id"];
//        ctData.cateName = [rs stringForColumn:@"cate_name"];
//		[infoArr addObject:ctData];
//		[ctData release];
//		
//	}
//	[super closeDatabase];
//	return infoArr;
//
//}
//
//-(void)isnertNewCategory:(NSString*)cateName{
//    
//    	[super getDOCDatabase:DBNAME];
//                                                                                                    //表名user
//    	NSString *sql = [NSString stringWithFormat:@"INSERT INTO  %@ (cate_name) VALUES ('%@')",@"category",cateName];
//    //NSLog(@"%@",sql);
//    	[db executeUpdate:sql];
//    	if ([db hadError]) {
//    		//NSLog(@"添加错误 请到这里(isnertNewCategory:)断点测试");
//    	}
//    	[super closeDatabase];
//}
//
//-(void)isnertNewPassinfo:(NSString*)passName passAccount:(NSString*)passAccount passPassword:(NSString*)passWord{
//    
//    [super getDOCDatabase:DBNAME];
//    //表名user
//    NSString *sql = [NSString stringWithFormat:@"INSERT INTO  %@ (pass_name,pass_password,pass_account) VALUES ('%@','%@','%@')",@"passInfo",passName,passWord,passAccount];
////    //NSLog(@"%@",sql);
//    [db executeUpdate:sql];
//    if ([db hadError]) {
//        //NSLog(@"添加错误 请到这里(isnertNewPassinfo:)断点测试");
//    }
//    [super closeDatabase];
//}
//
//-(void)delPassInfo:(int)passId{
//    
//    [super getDOCDatabase:DBNAME];
//    
//	NSString *sql = [NSString stringWithFormat:@"DELETE FROM  %@ WHERE pass_id = '%d'",@"passInfo",passId];
//    
//	[db executeUpdate:sql];
//	if ([db hadError]) {
//		//NSLog(@"删除错误 请到这里(deleteUserData:)断点测试");
//	}
//	[super closeDatabase];
//    
//}
//
//-(void)delCategory:(NSString *)cateId{
//    
//    [super getDOCDatabase:DBNAME];
//    
//	NSString *sql = [NSString stringWithFormat:@"DELETE FROM  %@ WHERE cate_id = '%@'",@"category",cateId];
//    
//	[db executeUpdate:sql];
//	if ([db hadError]) {
//		//NSLog(@"删除错误 请到这里(deleteUserData:)断点测试");
//	}
//	[super closeDatabase];
//
//}
//
////密码帐户列表 
//-(NSMutableArray*)selectPassInfoList{
//        
//        [super getDOCDatabase:DBNAME];
//        //无参数模式
//        FMResultSet *rs = [db executeQuery:[self SQL:@"SELECT * FROM %@"
//                                             inTable:@"passInfo"]];
//        
//        NSMutableArray *infoArr = [[[NSMutableArray alloc]init] autorelease];
//        
//        while ([rs next]) {
//            
//            PassInfoData *ctData = [[PassInfoData alloc]init];
//            ctData.cateId = [rs intForColumn:@"cate_id"];
//            ctData.passName = [rs stringForColumn:@"pass_name"];
//            ctData.passPassword = [rs stringForColumn:@"pass_password"];
//            ctData.passAccount = [rs stringForColumn:@"pass_account"];
//            ctData.passId = [rs intForColumn:@"pass_id"];
//            [infoArr addObject:ctData];
//            [ctData release];
//            
//        }
//        [super closeDatabase];
//        return infoArr;
//}
//
//
//
//
//-(void)updatePassinfo:(NSString*)passName passAccount:(NSString*)passAccount passPassword:(NSString*)passWord passId:(int)passId{
//    
//    [super getDOCDatabase:DBNAME];
//    //表名user(pass_name,pass_password,pass_account) VALUES ('%@','%@','%@')
//    NSString *sql = [NSString stringWithFormat:@"UPDATE  %@ SET pass_name = '%@',pass_password= '%@',pass_account='%@' WHERE pass_id = '%d'",@"passInfo",passName,passWord,passAccount,passId];
//    //    //NSLog(@"%@",sql);
//    [db executeUpdate:sql];
//    if ([db hadError]) {
//        //NSLog(@"添加错误 请到这里(isnertNewPassinfo:)断点测试");
//    }
//    [super closeDatabase];
//}

////更新信息
//-(void)updateUserData:(UserData*)usData{
//
//	[super getDOCDatabase:DBNAME];
//	
//	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET password = '%@' WHERE username = '%@'",@"user",usData.password,usData.username];
//    
//	[db executeUpdate:sql];
//	if ([db hadError]) {
//		//NSLog(@"更新错误 请到这里(updateScore:)断点测试");
//	}
//	[super closeDatabase];
//}
//
////添加信息
//-(void)insertUserData:(UserData*)usData{
//	
//	[super getDOCDatabase:DBNAME];
//	
//	NSString *valus = [NSString stringWithFormat:@"'%@','%@'",usData.username,usData.password];
//                                                                                                //表名user
//	NSString *sql = [NSString stringWithFormat:@"INSERT INTO  %@ (username,password) VALUES (%@)",@"user",valus];
//    
//	[db executeUpdate:sql];
//	if ([db hadError]) {
//		//NSLog(@"添加错误 请到这里(insertUserData:)断点测试");
//	}
//	[super closeDatabase];
//	
//}
//
//-(void)deleteUserData{
//
//
//}
//
////查询
//-(NSMutableArray *)selectUserData{
//	
//}

@end

