LOCAL_PATH := $(call my-dir)

###########################
# 1. Подключаем саму SDL2
###########################
include $(CLEAR_VARS)
LOCAL_MODULE := SDL2
# Путь к папке с ядром SDL2, которую ты скачал
include $(LOCAL_PATH)/SDL2/Android.mk

###########################
# 2. Подключаем SDL2_image
###########################
include $(CLEAR_VARS)
LOCAL_MODULE := SDL2_image
# Путь к папке SDL2_image
include $(LOCAL_PATH)/SDL2_image/Android.mk

###########################
# 3. Подключаем SDL2_mixer
###########################
include $(CLEAR_VARS)
LOCAL_MODULE := SDL2_mixer
include $(LOCAL_PATH)/SDL2_mixer/Android.mk

###########################
# 4. Подключаем SDL2_ttf
###########################
include $(CLEAR_VARS)
LOCAL_MODULE := SDL2_ttf
include $(LOCAL_PATH)/SDL2_ttf/Android.mk

###########################
# 5. Твоя игра (основной код)
###########################
include $(CLEAR_VARS)

LOCAL_MODULE := main

# Твой файл с кодом
LOCAL_SRC_FILES := src/main.cxx

# Пути к заголовочным файлам (чтобы работали #include)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/SDL2/include \
                    $(LOCAL_PATH)/SDL2_image \
                    $(LOCAL_PATH)/SDL2_mixer \
                    $(LOCAL_PATH)/SDL2_ttf

# Список библиотек, которые нужно прилинковать к игре
LOCAL_SHARED_LIBRARIES := SDL2 SDL2_image SDL2_mixer SDL2_ttf

# Системные библиотеки Android (графика, лог, звук)
LOCAL_LDLIBS := -lGLESv1_CM -lGLESv2 -llog -landroid

include $(BUILD_SHARED_LIBRARY)

