//
//  Database.m
//  SQLiteSample
//
//  Created by wang xuefeng on 10-12-29.
//  Copyright 2010 www.5yi.com. All rights reserved.
//

#import "DB.h"


@interface DB(hidden)

- (BOOL)connDatabase:(NSString *)dbName;

@end


@implementation DB


- (BOOL)connDatabase:(NSString *)dbName
{
	BOOL success;
	NSError *error;
	NSFileManager *fm = [NSFileManager defaultManager];
	NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:dbName];
		
	success = [fm fileExistsAtPath:writableDBPath];
	
	if(!success){
		NSString *defaultDBPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:dbName];
//		NSLog(@"%@",defaultDBPath);
		success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if(!success){
//			NSLog(@"error: %@", [error localizedDescription]);
		}
		success = YES;
	}
	
	if(success){
		db = [[FMDatabase databaseWithPath:writableDBPath] retain];
		if ([db open]) {
			[db setShouldCacheStatements:YES];
		}else{
//			NSLog(@"Failed to open database.");
			success = NO;
		}
	}
	
	return success;
}

- (void)closeDatabase
{
	[db close];
}


- (FMDatabase *)getDatabase:(NSString *)dbName
{
	if ([self connDatabase:dbName]){
		return db;
	}
	
	return NULL;
}


- (void)dealloc
{
	[self closeDatabase];
	
	[db release];
	[super dealloc];
}

@end
