# Samsung Galaxy A14 5G (SM-A146M/DS — a14x)

Device tree, persistence modules, kernel fragments, and unbrick releases for Samsung Galaxy A14 5G (`a14x`) on Exynos 1330 (`s5e8535`).

## Device Specifications
- **Model**: SM-A146M/DS (a14x)
- **SoC**: Samsung Exynos 1330 (`s5e8535`) (2× Cortex-A78 + 6× Cortex-A55)
- **PDA / AP**: `A146MUBSDDZE1`
- **CP**: `A146MUBSDDZD1`
- **CSC**: `A146MOWODDZE1` (OWO / LATAM)
- **Android**: 15 / One UI 7 (Security Patch: 2026-05-05)
- **Binary**: D
- **Kernel Baseline**: `5.15.180` (KMI GKI)
- **Recovery Partition Size**: `100663296` bytes (96 MB), Boot Header v2
- **Boot Partition Size**: `67108864` bytes (64 MB), Boot Header v4
- **Init Boot Partition Size**: `16777216` bytes (16 MB)

## Unbrick Procedure (Brokkr / Odin)
In case of soft brick or recovery/boot corruption:
1. Put the device into Download Mode (`Vol -` + `Vol +` while connecting USB cable to PC or another Android device running Brokkr).
2. Download the release assets from [Release unbrick-dze1](https://github.com/multi-forge/android_device_samsung_a14x/releases/tag/unbrick-dze1):
   - `unbrick-dze1-recovery.tar` (flashes `/dev/block/by-name/recovery`)
   - `unbrick-dze1-boot.tar` (flashes `/dev/block/by-name/boot` and `init_boot`)
3. Flash via Brokkr OTG or Odin.

## Checksums (Stock DZE1 baseline)
```
05fdc90b152966526553dca7bdbf21a0e35464d4905221adf49ee9677b732e32  recovery-stock.img
7659b2fd80a7d8537fba98073179f338bf205fb1694abe81b2134690754a2545  boot-current.img
2c0b60b7c93a184029d590ff508d920a5c205787ba248f423af348ca1553f423  init_boot-current.img
19c06b501ef7e0cfdd33d513078da98eaaecda7d4ab56bc83dcbb4fe81031015  dtbo-stock.img
9824851c3fda31a911ccc4fc6e134306e6f0ac502218375d7b3bd2a2289cec15  vbmeta-stock.img
cecc9b258175e228fc80c2237b8ba9baa66b93be4540cc5c8728d60f8718163f  config.gz
4bdf87b9274fb1e31c4aab5bc2fa871498a69b5499c6cb91b6011a722835af3f  unbrick-dze1-recovery.tar
0c388562d71dc648134fe43d4a501dd339cc7998106b49125c19f9daacd71cab  unbrick-dze1-boot.tar
```
