# Copyright 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

BUILD_KERNEL := false

ifeq ($(BUILD_KERNEL),false)

ifeq ($(BOARD_INCLUDE_DTB_IN_BOOTIMG), true)
    # AOSP will concatenate all these into a single dtb.img
    BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/common-kernel/$(TARGET_DEVICE)/
else
    dtb := "-dtb"
endif

LOCAL_KERNEL := $(KERNEL_PATH)/common-kernel/kernel$(dtb)-$(TARGET_DEVICE)

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
endif
