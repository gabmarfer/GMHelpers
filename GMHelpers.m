//
//  GMHelpers.m
//
//
//  Created by Gabi Martelo on 28/10/13.
//  Copyright (c) 2013 Startcapps. All rights reserved.
//

#import "GMHelpers.h"

// Load and return an image from resources bundle
UIImage *loadImageWithName(NSString *name)
{
    NSString *path = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],name];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

/**
 * Load a path from disk
 *
 * @param filename a name of a file on disk
 * @return a path to the file
 */
NSString *pathInDocumentDirectory(NSString *fileName)
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:fileName];
}

/**
 * Load a path from cache directory
 *
 * @param filename a name of a file on disk
 * @return a path to the file
 */
NSString *pathInLibraryCacheDirectory(NSString *fileName)
{
    NSArray *cacheDirectories = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [cacheDirectories objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:fileName];
}

/**
 * Load a path from tmp directory
 *
 * @param filename a name of a file on disk
 * @return a path to the file
 */
NSString *pathInTmpDirectory(NSString *fileName)
{
    NSString *resultPath;
    NSString *tmpDirectory = NSTemporaryDirectory();
    if (tmpDirectory)
        resultPath = [tmpDirectory stringByAppendingPathComponent:fileName];
    else
        resultPath = pathInLibraryCacheDirectory(fileName);
    return resultPath;
}

/**
 * Exclude a file from backup to iCloud
 *
 * @discussion This method applies only to URLs for file system resources.
 * @param
 * @return
 */
BOOL addSkipBackupAttributeToItemAtURL(NSURL *URL)
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success) {
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    
    return success;
}