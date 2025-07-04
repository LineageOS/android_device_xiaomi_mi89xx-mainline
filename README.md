# Android device tree for Xiaomi devices with MSM89xx SoC running mainline kernel

## Kernel repositories

|  Target  |              Path             |                    URL                    | Branch |
|----------|-------------------------------|-------------------------------------------|--------|
| mi8916   | kernel/xiaomi/mi8916-mainline | https://github.com/msm8916-mainline/linux | wip/msm8916/v6.16-rc4 |
| mi8953_a | kernel/xiaomi/mi8953-mainline | https://github.com/msm8953-mainline/linux | 6.15/main |
| mi89x7   | kernel/xiaomi/mi89x7-mainline | https://github.com/msm89x7-mainline/linux | msm89x7/6.15 |

## Kernel patches

- `ANDROID: usb: gadget: configfs: Add Uevent to notify userspace` (Fixes USB in normal mode)
- `Revert "staging: remove ashmem"` (Fixes media codec)
- `Revert "dm: fix copying after src array boundaries"` (Fixes kernel crash during APEX mount on 6.15+)
- `Revert "dm: always update the array size in realloc_argv on success"` (Fixes kernel crash during APEX mount on 6.15+)

## Notes for `mi8916` target

- The target may boot only on Redmi 2 (`wt88047`) as of now.
- The target uses SD card for `/data` mountpoint. Make sure to have a SD card with 2 GB size at minimum inserted.

## Notes for `mi89x7` target

- The target uses tinyhal audio HAL by default, however not all devices has tinyhal configuration file yet. To boot on the unsupported devices, run `export TARGET_AUDIO_HAL=default-aidl`.
- The target uses Swiftshader graphics by default, due to the fact that Mesa does not work on devices with Adreno 505 GPU. To get smoother graphics experience on devices with Adreno 306 GPU, run `export TARGET_GRAPHICS=mesa`.
