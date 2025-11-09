# Android device tree for Xiaomi devices with MSM89xx SoC running mainline kernel

## Kernel repositories

|         Target         |              Path             |                    URL                    |         Branch         |
|------------------------|-------------------------------|-------------------------------------------|------------------------|
| mi8916                 | kernel/xiaomi/mi8916-mainline | https://github.com/msm8916-mainline/linux | wip/msm8916/v6.18-rc4  |
| mi8953_a               | kernel/xiaomi/mi8953-mainline | https://github.com/msm8953-mainline/linux | 6.17.7/main            |
| mi89x7, tiare_mainline | kernel/xiaomi/mi89x7-mainline | https://github.com/msm89x7-mainline/linux | barni2000/6.17-develop |

## Kernel patches

| Commit name | Purpose | Source |
|-------------|---------|--------|
| `ANDROID: usb: gadget: configfs: Add Uevent to notify userspace` | Fixes USB in normal mode | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-usb-gadget-configfs-Add-Uevent-to-notify-userspace.patch |
| `Revert "staging: remove ashmem"` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/Revert-staging-remove-ashmem.patch |
| `Revert "dm: fix copying after src array boundaries"` | Fixes kernel crash during APEX mount on 6.15+ | `git revert f1aff4bc199cb92c055668caed65505e3b4d2656` |
| `Revert "dm: always update the array size in realloc_argv on success"` | Fixes kernel crash during APEX mount on 6.15+ | `git revert 5a2a6c428190f945c5cbf5791f72dbea83e97f66` |
| `Revert "remoteproc: qcom_wcnss: Fix on platforms without fallback regulators"` | Fixes qcom-wcnss-pil probe error on 6.15+ | `git revert 4ca45af0a56d00b86285d6fdd720dca3215059a7` |
| `Revert "remoteproc: qcom_wcnss: Handle platforms with only single power domain"` | Fixes qcom-wcnss-pil probe error on 6.15+ | `git revert 65991ea8a6d1e68effdc01d95ebe39f1653f7b71` |
| `Revert "usb: dwc3: remove unused sg struct member"` | Fixes USB Gadget data transfer on 6.13+ on msm8953 | `git revert 686d4a2c26b49eaf6e817f16b7cb6c4b961aa7a7` |
| `Revert "usb: dwc3: gadget: Remove dwc3_request->needs_extra_trb"` | Fixes USB Gadget data transfer on 6.13+ on msm8953 | `git revert f5313c8b418c2efb9c0581d8066c5ae8c60c47de` |
| `Revert "usb: dwc3: gadget: Cleanup SG handling"` | Fixes USB Gadget data transfer on 6.13+ on msm8953 | `git revert 61440628a4ffe0639c4f69a6ffa46c3a0bead3d5` |
| `Revert "drm/msm/dpu: move scaling limitations out of the hw_catalog"` | Fixes tearing display on 6.13+ | [Patch](.kernel-patches/0001-Revert-drm-msm-dpu-move-scaling-limitations-out-of-t.patch) |

## Notes for `mi8916` target

- The target may boot only on Redmi 2 (`wt88047`) as of now.
- The target uses SD card for `/data` mountpoint. Make sure to have a SD card with 2 GB size at minimum inserted.

## Notes for `tiare_mainline` target

- The device has `recovery` partition sized at 25 MB which is too small to hold `recovery.img` built from the target. To boot the `recovery.img`, flash the image to `boot` partition and continue with normal boot.
- The target is 32-bit, which requires the following changes to be made in AOSP tree in order to boot:
  1. On `packages/modules/Connectivity/bpf/loader/NetBpfLoad.cpp`, locate to the next line of the line containing `[Arm] 64-bit userspace required on 6.2+ kernels (%d).` (which should be `return 1;`), remove the line.
  2. On `system/netd/server/XfrmController.cpp`, in function `validateResponse`, replace the `return` statement containing `Error netlink message` with `return netdutils::status::ok;`.
