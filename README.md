# Samsung Galaxy A14 5G (SM-A146M / SM-A146B) — LineageOS 22.1

Unified device tree for Samsung Galaxy A14 5G (SM-A146M / SM-A146B), codename `a14x`, based on the Samsung Exynos 1330 (`s5e8535`) platform for LineageOS 22.1 (Android 15).

## Device Specifications

| Feature | Specification |
|:---|:---|
| **SoC** | Samsung Exynos 1330 (`s5e8535`) |
| **CPU** | 2x 2.4 GHz Cortex-A78 + 6x 2.0 GHz Cortex-A55 |
| **GPU** | ARM Mali-G68 MP2 (`valhall-r38p1`) |
| **Memory** | 4 GB / 6 GB / 8 GB LPDDR4X |
| **Storage** | 64 GB / 128 GB UFS 2.2 |
| **Display** | 6.6" 1080x2408 PLS LCD, 90Hz (450 DPI) |
| **Battery** | 5000 mAh Li-Po |
| **Main Camera** | 50 MP (Samsung S5KJN1) + 2 MP macro + 2 MP depth |
| **Front Camera** | 13 MP (Hynix HI1336) |
| **Audio** | Realtek RT5691 / AW882XX amp |

## Partition Scheme
- Dynamic Partitions (A-only, EROFS): `system`, `system_ext`, `vendor`, `product`, `odm`, `vendor_dlkm`, `system_dlkm`
- Super partition size: `8,287,944,704` bytes
- Boot image: Boot Header v4 with generic GKI support (`init_boot` + `vendor_boot`)

## Compilation
To compile LineageOS 22.1 for `a14x`:
```bash
source build/envsetup.sh
lunch lineage_a14x-userdebug
mka bacon
```
