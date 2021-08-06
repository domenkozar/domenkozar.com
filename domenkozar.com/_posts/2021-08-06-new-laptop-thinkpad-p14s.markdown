---
categories: english, nix, nixos, gentoo
author: Domen Kožar
date: 2021/08/06 09:00:00
title: "New laptop - Thinkpad P14s"
draft: false
---

~4.5 years ago I bought Dell XPS 15. It was a powerhorse without a match for that size/price.

I must admit that I wasn't happy about it:

- Webcam is positioned below the screen, recording my typing fingers instead of my face.
- Battery getting swollen (and being forced to fly that way wasn't fun), after replacing it happened again.
- The CPU fan is loud and throttles a lot.
- There's only one company in Slovenia that does warranty repairs and takes the law-specified 40 working days to finish their job (replacing a battery, for example).
- Too heavy (over 2kg)

I've decided to go back to Thinkpads, as they are unmatched by the overall experience and quality to run Linux.


# Requirements


Inspired by [Ben Gamari's post](https://bgamari.github.io/posts/2020-08-22-what-i-want-in-a-laptop.html), I've figured out I have the following requirements for the new laptop:

- A bright screen (400 nits or possibly more), so I can work outside.

- A high-resolution screen (UHD), so that I can reasonably split the screen vertically.

- 14" or 15" screen, I've still not made up my mind but both of these work well for me.

- Light-weight (less than 2kg) so that I can travel light (and hold the laptop with one hand if I have to move a few meters).

- 32 GB of RAM, so that I don't have to worry about hitting the limit (I don't even configure swap these days).

- No discrete GPU, to make it less convenient to play video games and there's less power drain from the battery.

- Quiet fans, I haven't bothered with this before. XPS was really loud and I'm getting older.

- Best CPU possible, as I'm [frequently compiling Haskell](https://cachix.org).

- Good battery life (ideally 8h or more), so that I can do my day of work without worrying about a plug.

- Fast repair turnaround, I get that with Lenovo in Slovenia with about a day (if they have spare parts).

- At least 2 years of warranty, possibly 3.


# Thinkpad P14s

I've bought a [Thinkpad P14s](https://www.lenovo.com/us/en/coming-soon/P14s-AMD-G2/p/22WSP144SA2):

    Processor:
    AMD Ryzen 7 PRO 5850U Octa Core (8 Cores / 16 Threads)
    1.90 - 4.40 GHz, 4 MB L2 and 16 MB L3 cache

    RAM:
    32 GB DDR4-3200 MHz (16GB soldered)
    (no slot free, max.48GB )

    Hard disk:
    1 TB SSD M.2 PCIe 3.0 x4 NVMe OPAL2

    Display:
    14 "UHD (3840x2160) IPS, Dolby Vision
    500 nits, 16: 9, 1500: 1 contrast, 170 °, anti-glare
    100% DCI-P3 gamut

    Graphics card:
    AMD Radeon RX Vega 8

    Network / communication:
    10/100/1000 Mbit RJ45 Ethernet
    Realtek WLAN RTL8852AE 11ax, 2x2
    Bluetooth 5.2
    IR webcam 720p with ThinkShutter prepared for Windows Hello
    WWAN / LTE-A, module optionally available

    Interfaces:
    2x USB 3.2 Gen1 (1x powered)
    2x USB-C 3.2 Gen 2 (DisplayPort 1.4a, Power Delivery 3.0)
    1x HDMI 2.0
    1x SideDocking Port (CS18)
    1x 3.5mm Mic-In / Audio-Out combined
    1x MicroSD Card Reader
    1x SmartCard Reader

    Security:
    - Match-On Touch FingerPrint Reader
    - TPM 2.0 Security Chip
    - Kensington Port

    input devices:
    6 rows Precision Keyboard German with backlighting
    UltraNav / UltraNav Touch 3 + 3 Button Design

    Battery:
    3 cell lithium-polymer battery (50Wh) internal. Run time up to 10 hours.
    RapidCharge: 65W USB-C adapter 80% in 1 hour.

    Size and weight:
    329 x 227 x 17.9 mm, 1.47 kg 

    Other:
    65W USB-C power supply

    Warranty:
    3 years bring-in manufacturer warranty
    1 year on battery


CPU benchmarks claim I'm going from [6945](https://www.cpubenchmark.net/cpu.php?cpu=Intel+Core+i7-7700HQ+%40+2.80GHz&id=2906) to 
[19504](https://www.cpubenchmark.net/cpu.php?cpu=AMD+Ryzen+7+PRO+5850U&id=4198) CPU marks (for comparison, Apple M1 has 15139). Quite impressive!

After a few days of using it, it's noticeable faster.

Even with the fan at 4500 RPM, it's completely quiet.

Overall it meets all my requirements except for the battery (while I haven't tested it, I expect it to last below 8h).

Having a German keyboard is a price I pay for the current [chip shortage](https://en.wikipedia.org/wiki/2020%E2%80%9321_global_chip_shortage),
as it's hard to get a hold of P14s model with US/UK keyboard (also Brexit). Is there some kind of keys replacements service?


# NixOS Setup

As [NixOS doesn't yet support Secure Boot](https://github.com/NixOS/nixpkgs/issues/42127), the first thing you need to do is boot into BIOS and disable it.

I've written [Building bootable ISO image tutorial](https://nix.dev/tutorials/building-bootable-iso-image) and 
[nixos-hardware support for Thinkad P14s](https://github.com/NixOS/nixos-hardware/blob/master/lenovo/thinkpad/p14s/amd/gen2/default.nix) to be able to boot with an ISO
image that has wifi card support.

Installation of NixOS is almost identical to official instructions with [a twist of encrypted root partition](https://gist.github.com/domenkozar/c1da433406807255f9aa835d72976470).

Wifi works ([although there are issues with speed](https://github.com/lwfinger/rtw89/issues/30)), Bluetooth works, brightness control works, webcam works, trackpad works, suspend works.

Happy.
