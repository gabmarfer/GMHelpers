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
