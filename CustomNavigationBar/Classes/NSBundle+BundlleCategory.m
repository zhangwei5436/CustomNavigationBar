//
//  NSBundle+BundlleCategory.m
//  CustomNavigationBar
//
//  Created by 张威 on 2018/1/15.
//

#import "NSBundle+BundlleCategory.h"

@implementation NSBundle (BundlleCategory)
+ (NSBundle *)core_myLibraryBundle: (NSString *)bundleName forClass: (Class)bundleClass{
    NSURL *bundleURL = [self core_LibraryBundleURL: bundleName forClass: bundleClass];
    if (bundleURL) {
        return [self bundleWithURL:bundleURL];
    }
    return nil;
}

+ (NSURL *)core_LibraryBundleURL: (NSString *)bundleName forClass: (Class)bundleClass{
    NSBundle *bundle = [NSBundle bundleForClass:bundleClass];
    return [bundle URLForResource: bundleName withExtension:@"bundle"];
}
@end
