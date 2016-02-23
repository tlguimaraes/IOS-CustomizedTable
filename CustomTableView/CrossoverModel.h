//
//  CrossoverModel.h
//  CrossoverNodeApp
//
//  Created by Thiago Guimaraes on 11/10/15.
//  Copyright (c) 2015 ThiagoGuimaraes. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CrossoverModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface CrossoverModel : NSObject <NSURLConnectionDataDelegate>


@property (nonatomic, weak) id<CrossoverModelProtocol> delegate;

- (void)downloadItems;

@end
