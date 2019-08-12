//
//  NSDate+NWExtension.m
//  NWIdeaToolsDemo
//
//  Created by liyangly on 2019/8/12.
//  Copyright © 2019 liyang. All rights reserved.
//

#import "NSDate+NWExtension.h"

@implementation NSDate (NWExtension)

#pragma mark - base

- (NSUInteger)nw_day {
    return [NSDate nw_day:self];
}

- (NSUInteger)nw_month {
    return [NSDate nw_month:self];
}

- (NSUInteger)nw_year {
    return [NSDate nw_year:self];
}

- (NSUInteger)nw_hour {
    return [NSDate nw_hour:self];
}

- (NSUInteger)nw_minute {
    return [NSDate nw_minute:self];
}

- (NSUInteger)nw_second {
    return [NSDate nw_second:self];
}

+ (NSUInteger)nw_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
}

+ (NSUInteger)nw_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)nw_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)nw_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)nw_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)nw_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents second];
}

- (BOOL)nw_isLeapYear {
    return [NSDate nw_isLeapYear:self];
}

+ (BOOL)nw_isLeapYear:(NSDate *)date {
    NSUInteger year = [date nw_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSInteger)nw_daysInMonth:(NSUInteger)month {
    return [NSDate nw_daysInMonth:self month:month];
}

+ (NSUInteger)nw_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date nw_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSInteger)nw_weekday {
    return [NSDate nw_weekday:self];
}

+ (NSInteger)nw_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)nw_monthString {
    return [NSDate nw_monthString:self.nw_month];
}

+ (NSString *)nw_monthString:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

- (NSString *)nw_weekdayString {
    return [NSDate nw_weekdayString:self];
}

+ (NSString *)nw_weekdayString:(NSDate *)date {
    switch([date nw_weekday]) {
        case 1:
            return @"Sunday";
            break;
        case 2:
            return @"Monday";
            break;
        case 3:
            return @"Tuesday";
            break;
        case 4:
            return @"Wednesday";
            break;
        case 5:
            return @"Thursday";
            break;
        case 6:
            return @"Friday";
            break;
        case 7:
            return @"Saturday";
            break;
        default:
            break;
    }
    return @"";
}

#pragma mark - Constellation

+ (NSString *)getConstellationByMonthIndex:(NSInteger)monthIndex
                                  dayIndex:(NSInteger)dayIndex {
    
    NSArray *constellations = @[@"Capricorn", @"Aquarius", @"Pisces", @"Aries", @"Taurus", @"Gemini", @"Cancer", @"Leo", @"Virgo", @"Libra", @"Scorpio", @"Sagittarius", @"Capricorn"];
    NSInteger index;
    NSArray *conIndexs = @[@(22),@(20),@(19),@(21),@(20),@(21),@(22),@(23),@(23),@(23),@(24),@(23),@(22)];
    if ([[conIndexs objectAtIndex:monthIndex] integerValue] <= dayIndex + 1) {
        index = monthIndex;
    } else index = (monthIndex - 1 + 12) % 12;
    return [constellations objectAtIndex:index];
}

#pragma mark - Jan 1st. 1970

- (NSString *)nw_getMonDayYearString {
    
    return [NSDate nw_getMonDayYearString:self];
}

+ (NSString *)nw_getMonDayYearString:(NSDate *)date {
    
    NSString *monthStr = [NSDate nw_monthString:[date nw_month]];
    if (monthStr.length > 3) {
        monthStr = [monthStr substringToIndex:3];
    }
    NSInteger day = [date nw_day];
    NSString *dayStr = @"";
    if (day == 1) {
        dayStr = @"1st";
    } else if (day == 2) {
        dayStr = @"2nd";
    } else if (day == 3) {
        dayStr = @"3rd";
    } else {
        dayStr = [NSString stringWithFormat:@"%ldth", (long)day];
    }
    NSString *yearStr = @([date nw_year]).stringValue;
    return [NSString stringWithFormat:@"%@. %@ %@", monthStr, dayStr, yearStr];
}

@end
