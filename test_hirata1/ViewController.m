//
//  ViewController.m
//  test_hirata1
//
//  Created by 力丸 玲嘉 on 2015/04/09.
//  Copyright (c) 2015年 reika.rikimaru. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    UIPickerView *picker;
    NSArray *_ar1;
    NSArray *_ar2;
    NSArray *_ar3;
    int num;
    int num1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     num = 1;
     num1 = 1;
    
    // UIPickerのインスタンス化
    picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    [self.view addSubview:picker];
    
    //ピッカーに文字列を格納する
    _ar1 = [NSArray arrayWithObjects:@"国語", @"算数", @"理科", @"社会", @"英語", nil];
    _ar2 = [NSArray arrayWithObjects:@"標準", @"予習", @"模試", @"復習", @"再復習", nil];
    _ar3 = [NSArray arrayWithObjects:@"中学一年", @"中学二年", @"中学三年", nil];
    
}

/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}


/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 3.0;
            break;
        case 1: // 2列目
            switch (num) {
                case 1: //1列目
                    return 2.0;
                    break;
                case 2:  //1列目
                    return 4.0;
                    break;
                case 3: //1列目
                    return 5.0;
                    break;
                    
                default:
                    break;
            }
            
        case 2: // 3列目
            switch (num1) {
                case 1:
                    return 2.0;
                    break;
                case 2:
                    return 3.0;
                    break;
                case 3:
                    return 5.0;
                    break;
                default:
                    break;
            }
         
            default:
            return 0;
            break;
    }
}

/**
 * 行のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 125.0;
            break;
            
        case 1: // 2列目
            return 85.0;
            break;
            
        case 2: // 3列目
            return 85.0;
            break;
            
        default:
            return 0;
            break;
    }
}




/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component){
        case 0: // 1列目
            return [_ar3 objectAtIndex: row];
            break;
            
        case 1: // 2列目
            return [_ar1 objectAtIndex: row];
            break;
            
        case 2: // 3列目
            return [_ar2 objectAtIndex: row];
            break;
            
        default:
            return 0;
            break;
    }
}
                    
                    
/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    NSInteger val0 = [pickerView selectedRowInComponent:0];
    num = val0 + 1;
    num1 = val0 + 1;
    
    NSLog(@"num:%d%d", num,num1);
    [picker reloadComponent:1];
    [picker reloadComponent:2];
}


@end

