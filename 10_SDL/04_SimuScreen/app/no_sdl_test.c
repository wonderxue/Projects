#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    printf("开始测试...\n");
    
    // 测试内存分配
    int *test = malloc(sizeof(int) * 100);
    if (!test) {
        printf("内存分配失败\n");
        return 1;
    }
    printf("内存分配成功\n");
    
    // 测试memset
    memset(test, 0, sizeof(int) * 100);
    printf("memset成功\n");
    
    // 测试free
    free(test);
    printf("free成功\n");
    
    printf("测试完成\n");
    
    return 0;
}
