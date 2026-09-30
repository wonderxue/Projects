#ifndef LV_CONF_H
#define LV_CONF_H

#include <stdint.h>

/*====================
   COLOR SETTINGS
 *====================*/
#define LV_COLOR_DEPTH       32
#define LV_COLOR_16_SWAP     0

/*=========================
   MEMORY SETTINGS
 *=========================*/
#define LV_MEM_CUSTOM        0
#define LV_MEM_SIZE          (64U * 1024U)
#define LV_MEM_ADR           0
#define LV_MEMCPY_MEMSET_STD 1

/*====================
   HAL SETTINGS
 *====================*/
#define LV_DISP_DEF_REFR_PERIOD  33
#define LV_INDEV_DEF_READ_PERIOD 30
#define LV_TICK_CUSTOM           0
#define LV_DPI_DEF               130

/*=======================
 * RENDERING
 *=======================*/
#define LV_DRAW_BUF_STRIDE_ALIGN 1
#define LV_DRAW_BUF_ALIGN        4

/*=======================
 * FEATURE CONFIGURATION
 *=======================*/
#define LV_DRAW_COMPLEX  1
#define LV_SHADOW_CACHE_SIZE  0
#define LV_IMG_CACHE_DEF_SIZE 1
#define LV_GRADIENT_MAX_STOPS 2

/*=====================
 * OPERATING SYSTEM
 *   LV_OS_NONE       = 0
 *   LV_OS_PTHREAD    = 1
 *   LV_OS_FREERTOS   = 2
 *   LV_OS_CMSIS_RTOS2= 3
 *   LV_OS_RTTHREAD   = 4
 *   LV_OS_WINDOWS    = 5
 *   LV_OS_MQX        = 6
 *   LV_OS_SDL2       = 7
 *   LV_OS_CUSTOM     = 8
 *=====================*/
#define LV_USE_OS  LV_OS_NONE

/*==================
 * THEMES
 *==================*/
#define LV_USE_THEME_DEFAULT  1
#define LV_USE_THEME_BASIC    1
#define LV_USE_THEME_MONO     1

/*==================
 * LAYOUTS
 *==================*/
#define LV_USE_FLEX  1
#define LV_USE_GRID  1

/*========================
 * FONT
 *========================*/
#define LV_FONT_MONTSERRAT_12    0
#define LV_FONT_MONTSERRAT_14    1
#define LV_FONT_MONTSERRAT_16    0
#define LV_FONT_DEFAULT          &lv_font_montserrat_14
#define LV_FONT_FMT_TXT_LARGE    0
#define LV_USE_FONT_PLACEHOLDER  1

/*====================
 * 3RD PARTY LIBRARIES
 *====================*/
#define LV_USE_FS_STDIO   0
#define LV_USE_FS_POSIX   0
#define LV_USE_FS_WIN32   0
#define LV_USE_FS_FATFS   0
#define LV_USE_PNG        0
#define LV_USE_BMP        0
#define LV_USE_SJPG       0
#define LV_USE_GIF        0
#define LV_USE_QRCODE     0
#define LV_USE_BARCODE    0
#define LV_USE_FREETYPE   0
#define LV_USE_BUILTIN_TTF 1
#define LV_USE_RLOTTIE    0

/*==================
 * OTHERS
 *==================*/
#define LV_USE_SNAPSHOT   0
#define LV_USE_SYSMON     0
#define LV_USE_PROFILER   0
#define LV_USE_MONKEY     0
#define LV_USE_GRIDNAV    0
#define LV_USE_FRAGMENT   0
#define LV_USE_IMGFONT    0
#define LV_USE_OBSERVER   1
#define LV_USE_SORT       1
#define LV_USE_MP3        0
#define LV_USE_POWER_MGMT 0

/*==================
 * EXTENSIONS
 *==================*/
#define LV_USE_EXTENSIONS_AUTO 1
#define LV_USE_EXTENSIONS      0

/*==================
 * WIDGETS
 *==================*/
#define LV_USE_ANIMIMG    1
#define LV_USE_ARC        1
#define LV_USE_BAR        1
#define LV_USE_BTN        1
#define LV_USE_BTNMATRIX  1
#define LV_USE_CANVAS     1
#define LV_USE_CHECKBOX   1
#define LV_USE_DROPDOWN   1
#define LV_USE_IMAGE      1
#define LV_USE_IMAGEBUTTON 0
#define LV_USE_KEYBOARD   1
#define LV_USE_LABEL      1
#define LV_USE_LED        1
#define LV_USE_LINE       1
#define LV_USE_LIST       1
#define LV_USE_MENU       1
#define LV_USE_MSGBOX     1
#define LV_USE_ROLLER     1
#define LV_USE_SCALE      1
#define LV_USE_SLIDER     1
#define LV_USE_SPAN       1
#define LV_USE_SPINBOX    1
#define LV_USE_SPINNER    1
#define LV_USE_SWITCH     1
#define LV_USE_TABLE      1
#define LV_USE_TABVIEW    1
#define LV_USE_TILEVIEW   1
#define LV_USE_WIN        1

#endif /*LV_CONF_H*/
