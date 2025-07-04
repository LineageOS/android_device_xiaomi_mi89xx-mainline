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
