//
//  DBUtils.h
//  BaDemo
//
//  Created by libra on 11-1-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.


#import <Foundation/Foundation.h>
#import "sqlite3.h"

#define kFilename		@"docLaika.db"
#define kDataKey		@"Data"
@class ShopCar;
@interface DBUtils : NSObject {

	sqlite3	*database;
}

-(BOOL)initDB;
-(BOOL)insertOrUpdateSQL:(ShopCar *)shopCar;
-(NSMutableArray *)getGoodsList;
+(NSString *)getOrderSN;
-(NSMutableArray *)getGoodsList;
@end
