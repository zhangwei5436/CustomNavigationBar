//
//  NSBundle+BundlleCategory.h
//  CustomNavigationBar
//
//  Created by 张威 on 2018/1/15.
//

#import <Foundation/Foundation.h>

@interface NSBundle (BundlleCategory)
/**
 获取指定的Bundle包
 
 @param bundleName Bundle名称
 @param bundleClass 同framework的Class
 */
+ (NSBundle *)core_myLibraryBundle: (NSString *)bundleName forClass: (Class)bundleClass;


/**
 获取指定Bundle的URL
 */
+ (NSURL *)core_LibraryBundleURL: (NSString *)bundleName forClass: (Class)bundleClass;
@end
