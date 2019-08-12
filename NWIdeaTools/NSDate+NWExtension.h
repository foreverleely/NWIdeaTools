//
//  NSDate+NWExtension.h
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (NWExtension)

#pragma mark - base

- (NSUInteger)nw_day;
+ (NSUInteger)nw_day:(NSDate *)date;
- (NSUInteger)nw_month;
+ (NSUInteger)nw_month:(NSDate *)date;
- (NSUInteger)nw_year;
+ (NSUInteger)nw_year:(NSDate *)date;
- (NSUInteger)nw_hour;
+ (NSUInteger)nw_hour:(NSDate *)date;
- (NSUInteger)nw_minute;
+ (NSUInteger)nw_minute:(NSDate *)date;
- (NSUInteger)nw_second;
+ (NSUInteger)nw_second:(NSDate *)date;

- (BOOL)nw_isLeapYear;
+ (BOOL)nw_isLeapYear:(NSDate *)date;

- (NSInteger)nw_daysInMonth:(NSUInteger)month;
+ (NSUInteger)nw_daysInMonth:(NSDate *)date month:(NSUInteger)month;

- (NSInteger)nw_weekday;
+ (NSInteger)nw_weekday:(NSDate *)date;

- (NSString *)nw_monthString;
+ (NSString *)nw_monthString:(NSInteger)month;

- (NSString *)nw_weekdayString;
+ (NSString *)nw_weekdayString:(NSDate *)date;

#pragma mark - Constellation

+ (NSString *)getConstellationByMonthIndex:(NSInteger)monthIndex
                                  dayIndex:(NSInteger)dayIndex;

#pragma mark - Jan 1st. 1970

- (NSString *)nw_getMonDayYearString;
+ (NSString *)nw_getMonDayYearString:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
