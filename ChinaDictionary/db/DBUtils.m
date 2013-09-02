//
//  DBUtils.m
//  BaDemo
//
//  Created by libra on 11-1-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.


#import "DBUtils.h"
//#import "SmokeEntry.h"
//#import "ShopCar.h"
@interface DBUtils(hidden)
// 得到数据库文件路径
- (NSString *)dataFilePath;
// 打开数据库
-(BOOL)openDB;

@end


@implementation DBUtils

-(NSString *)dataFilePath
{
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

-(BOOL)openDB{
	NSString *defaultDBPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:kFilename];
    NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *path = [self dataFilePath];
    BOOL find = [fileManager fileExistsAtPath:defaultDBPath];
//	NSLog(@"数据库:ding%@",path);
	
    //找到数据库文件
    if (find) {
//        NSLog(@"Database file have already existed.");
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK) {
            sqlite3_close(database);
//            NSLog(@"Error: open database file.");
            return NO;
        }
        return YES;
    }
    if(sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        //bFirstCreate_ = YES;
        return YES;
    } else {
        sqlite3_close(database);
        return NO;
    }
    return NO;
	
}

-(BOOL)initDB{
	
	if (![self openDB]) {
		return NO;
	}
	// 错误信息
	char *errorMsg;
	
	// 信息表
//	NSString *createShopCar = [NSString stringWithFormat:
//							   @"CREATE TABLE IF NOT EXISTS lInfo (%@,%@,%@,%@);",
//							   //@"ORDER_SN TEXT",
//							   @"id INTEGER PRIMARY KEY",// 订单号
//							   @"lAreaId INTEGER",						    //作者
//							   @"lTypeId INTEGER",							//创建时间
//							   @"info TEXT"					    //诗名
//							   //@"PRIMARY KEY(ORDER_SN,GOODS_ID)"
//							   ];
	
	NSString *createInfo = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS personInfo (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@);",
							@"personId INTEGER PRIMARY KEY",//id 
							 @"stature TEXT",
							 @"avoirdupois TEXT",
							@"jean TEXT",
							@"clothing TEXT",
							@"bra TEXT",
							@"breeches TEXT",
							@"caestus TEXT",
							@"shoes TEXT",
							@"ring TEXT",
							@"kids TEXT",
							@"kidshoes TEXT",
							@"statureText TEXT",
							@"avoirdupoisText TEXT",
							@"jeanText TEXT",
							@"clothingText TEXT",
							@"braText TEXT",
							@"breechesText TEXT",
							@"caestusText TEXT",
							@"shoesText TEXT",
							@"ringText TEXT",
							@"kidsText TEXT",
							@"kidshoesText TEXT",
							@"pNAME TEXT",
							@"sex TEXT",
							@"PRIMARY KEY(personId)"];
	
	if (sqlite3_exec (database, [createInfo  UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK) {
		sqlite3_close(database);
		NSAssert1(0, @"Error creating table: %s", errorMsg);
		return NO;
	}
	
	return YES;
	
}


-(NSMutableArray *)getGoodsList{
	
	if (![self openDB]) {
		return nil;
	}
	
	NSMutableArray *goods = [[[NSMutableArray alloc]init]autorelease];
	
	NSString *query = @"SELECT * FROM lArea";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2( database, [query UTF8String],
                           -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
			//char *ordersn = (char *)sqlite3_column_text(statement, 0);
//            char *customerId = (char *)sqlite3_column_text(statement, 2);
//			char *goodsId = (char *)sqlite3_column_text(statement, 1);
//			int goodsCount = sqlite3_column_int(statement, 0);
//			char *goodName = (char *)sqlite3_column_text(statement, 3);
			
//			NSLog(@"%@,%@,%@,%@",
//				  [[NSString alloc] initWithUTF8String:customerId],
//				  [[NSString alloc] initWithUTF8String:goodsId],
//				  // [[NSString alloc] initWithUTF8String:goodsCount],
//				  [[NSString alloc] initWithUTF8String:goodName]);
			//char *goodSn = (char *)sqlite3_column_text(statement, 4);
//			char *goodPrice = (char *)sqlite3_column_text(statement, 5);
//			
//			int goodImgBytes = sqlite3_column_bytes(statement, 6);
//			const void *goodImgValue = sqlite3_column_blob(statement, 6);
//			
//			char *goodWeight = (char *)sqlite3_column_text(statement, 7);
//            char *goodsTar = (char *)sqlite3_column_text(statement, 8);
//			char *goodsCarbon = (char *)sqlite3_column_text(statement, 9);
//			char *goodsNicotine = (char *)sqlite3_column_text(statement, 10);
//			char *goodsImgUrl = (char *)sqlite3_column_text(statement, 11);
			
			//SmokeEntry *smoke = [[SmokeEntry alloc]init];
//			smoke.good_id = [[NSString alloc] initWithUTF8String:goodsId];
//			smoke.good_name = [[NSString alloc] initWithUTF8String:goodName];
//			smoke.good_sn = [[NSString alloc] initWithUTF8String:goodSn];
//			smoke.good_price = [[NSString alloc] initWithUTF8String:goodPrice];
//			
//			
//			if( goodImgValue != NULL && goodImgBytes != 0 ){
//				NSData *data = [NSData dataWithBytes:goodImgValue length:goodImgBytes];
//				smoke.smImg =[UIImage imageWithData:data];
//				
//			}
//			
//			smoke.good_weight = [[NSString alloc] initWithUTF8String:goodWeight];
//			smoke.goods_tar = [[NSString alloc] initWithUTF8String:goodsTar];
//			smoke.goods_carbon = [[NSString alloc] initWithUTF8String:goodsCarbon];
//			smoke.goods_nicotine = [[NSString alloc] initWithUTF8String:goodsNicotine];
//			smoke.good_img = [[NSString alloc] initWithUTF8String:goodsImgUrl];
//			
//            ShopCar *sc = [[ShopCar alloc]init];
//			sc.smoke = smoke;
//			//sc.ordersn = [[NSString alloc] initWithUTF8String:ordersn];
//			sc.customerId = [[NSString alloc] initWithUTF8String:customerId];
//			sc.goodsCount = goodsCount;
//			//			NSLog(@"aaaaaaa%d",goodsCount);
//			//			NSLog(@"aaaaaaa%@",smoke.good_name);
//			[goods addObject:sc];
//			[smoke release];
//			[sc release];
				
        }
        sqlite3_finalize(statement);
    } 
	
	sqlite3_close(database);
	return goods;
	
}
@end
