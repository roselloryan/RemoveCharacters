//
//  main.m
//  RemoveCharacters


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *line = @"Hello World, ao";
        
        NSArray *componentsArray = [line componentsSeparatedByString:@", "];
        
        NSMutableArray *mutArrayOfWords = [[[componentsArray objectAtIndex:0] componentsSeparatedByString:@" "] mutableCopy];
        
        NSString *lettersToRemoveString = [componentsArray objectAtIndex:1];
        
        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        
        for (NSString *word in mutArrayOfWords) {
            
            NSMutableArray *wordMutArray = [[NSMutableArray alloc]init];
            NSInteger j = 0;
            for (j = 0; j < word.length; j++) {
                NSString *letterAtIndex = [NSString stringWithFormat:@"%c", [word characterAtIndex:j]];
                [wordMutArray addObject:letterAtIndex];
                
                NSInteger i = 0;
                for (i = 0; i < lettersToRemoveString.length; i++) {
                    NSString *letterToDelete = [NSString stringWithFormat:@"%c", [lettersToRemoveString characterAtIndex:i]];
                    [wordMutArray removeObject:letterToDelete];
                }
            }
            NSInteger k = 0;
            for (k = 0; k < wordMutArray.count; k++) {
                NSString *letter = [NSString stringWithFormat:@"%@", [wordMutArray objectAtIndex:k]];
                [solutionString appendString:letter];
            }
            NSString *space = @" ";
            [solutionString appendString:space];
        }
        NSRange lastSpaceRange = NSMakeRange(solutionString.length - 1, 1);
        [solutionString deleteCharactersInRange:lastSpaceRange];
        
        NSLog(@"%@", solutionString);

    }
    return 0;
}

# pragma mark - Works, but gnu disallows string method containsString:
//NSString *line = @"Hello World, aol";
//
//NSArray *componentsArray = [line componentsSeparatedByString:@", "];
//
//NSMutableString *lineString = [[componentsArray objectAtIndex:0] mutableCopy];
//
//NSString *lettersToRemoveString = [componentsArray objectAtIndex:1];
//
//NSInteger i = 0;
//for (i = 0; i < lettersToRemoveString.length; i++) {
//    
//    // get each letter to remove from string
//    NSString *letter = [NSString stringWithFormat:@"%c", [lettersToRemoveString characterAtIndex:i]];
//    while ([lineString containsString:letter]) {
//        [lineString deleteCharactersInRange:[lineString rangeOfString:letter]];
//    }
//}
//NSLog(@"\nlineString: %@\n\n", lineString);
