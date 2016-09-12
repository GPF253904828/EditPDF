//
//  NSData+AES256.h
//
//  Created by Kok Chin Chan on 4/6/12.
//  All rights reserved. © Treasure Frontier System Sdn. Bhd.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)

- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;

- (NSData *)AES256EncryptWithKeyData:(NSData *)key;
- (NSData *)AES256DecryptWithKeyData:(NSData *)key;

@end
