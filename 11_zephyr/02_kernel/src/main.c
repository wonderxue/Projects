#include <zephyr/kernel.h>
#include <zephyr/sys/printk.h>

#define STACK_SIZE 1024

/* 定义堆栈空间 */
K_THREAD_STACK_DEFINE(thread1_stack, STACK_SIZE);
K_THREAD_STACK_DEFINE(thread2_stack, STACK_SIZE);

struct k_thread thread1_data;
struct k_thread thread2_data;

void thread1()
{
	while (1) {
        printk("Dynamic Thread 1\n");
        k_sleep(K_MSEC(100));
    }
}

void thread2()
{
	while (1) {
        printk("Dynamic Thread 2\n");
        k_sleep(K_MSEC(100));
    }

}

int main()
{
	k_thread_create(&thread1_data,thread1_stack,K_THREAD_STACK_SIZEOF(thread1_stack),
					thread1,NULL,NULL,NULL,50,0,K_NO_WAIT);
	k_thread_create(&thread2_data,thread2_stack,K_THREAD_STACK_SIZEOF(thread2_stack),
					thread2,NULL,NULL,NULL,50,0,K_MSEC(10000));
	while (1) {
        printk("main Thread\n");
        k_sleep(K_MSEC(1500));
    }
}
