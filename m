Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869B246766
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350992; cv=none; b=HODJn/NYRctlYoF3aa7FV+JdLPll0uD8JPS4NIN77VFbCdFETLzHrgHDn5RxZl/+XXCYIPDjv7oeeMzTH/P40ft0pXZhR2cdXmjpA74qLSXEtjQgLN55AQSCTSYoXSA2nj+bNj66FbJgZqqmh5HG0iCYTxrYpQz1hHVvtq1RSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350992; c=relaxed/simple;
	bh=Bi/NYeL7I3RHSt7Uzc6s/khlLFeELlcYGunWdocGh9s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TCWwy8WnLaANaa+mAK/i2pFVrDJtrOql9OInRaXj/td65KKGnNEbXi4IMNWxsCLZ/quTPBjTu8PPhT23XR6FTI6Jn6tV30At9UF77mpAqF4GY2IY156Keu77+f8RibeBdLeWtYrFz4YyCgGanl9GXTEyLkkFWb8+HQNw4T4HTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM/TwU/X; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM/TwU/X"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so1391576a12.1
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 02:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753350989; x=1753955789; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l2B5mDxlyjvA1ebxze690ymxdCJZQaY9uQyy1bSVFqM=;
        b=IM/TwU/XEC0Yf0+P//3gfgp/fF73YdvO8e3T4hCvu9bIBbF6fsCz6zfJhJ60cdEXlF
         gv/KLZMANfHtxEhYr5qSwX/Z289eK+sgQxKFC8lBiJqGQWS2xWSInT8ZZHWXo7M5Vgom
         6mVIK91JjJtYqBwzE9DC/4ylod1mJqqtml5gvX5IaByzL3uqNFCPFUu/ZW2XLMbdm0cn
         ZTQcba6+fPZa5G312Xqej/1HkzyKlWjn1wBUAM18ydPWWaTeWGSfo7pA7kOIFydbPLJW
         bhtO6/M65ojbPLCkwGFdCUReEx+jpmCAJGicNG2mErZuJ46bDhIFu+XdYRxp6azeyE3H
         YcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350989; x=1753955789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2B5mDxlyjvA1ebxze690ymxdCJZQaY9uQyy1bSVFqM=;
        b=XmnQrlAWKBH0JFRlFK0Pug3wAc+iAhusN8KuLxI57jFlSV6YOhzr8PhjcFbBgFOxBE
         man1ctzTcimYwrUBB68JV3Hmqtjh3bWKk80ScrJmb4MuO0fkLXH3u6WA3Gs+qThYMK0h
         We4WQqyG4dsbtXv9VG8D8RIsTjBR9DVQisU4KZyUaLvvorJl7hJ0p5XLkbo1mC4q+V0L
         LfaxZ4Zg8oCWIPR6odznSjBU3QJZNAxPeTIvcClDwqtwWuJx6OjG4bXeB3lg7TK4Zw11
         y8arV/plfihABBVHmK6hfpYhIeC5KHQbzNllzD6r/9vkp4JqgjtkuOhDgNUt8p0pTpEP
         nkMw==
X-Forwarded-Encrypted: i=1; AJvYcCXzzwuLk3HG5nxwS6ksbbrDEc/DxKN6LQ5oIJPCb79RyCb4fFfY6anppKR+kjVhqEDj8jeiytR3rA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjvAnK3mEQpv2+kN+kG0AYVjOZpOyPqEtcsAQs+Izyf+I5R8S6
	u0tsNXJSSaZR8EHllHtceR6oLeVpp0bUyo4N5oaDKfCQgq/sfWvx241tzHdvut9ElxmEtYPXRz6
	8fs345WLUwDfPbnGVtxAAUuASgtngCGJ6C6pCBVk=
X-Gm-Gg: ASbGncs3SHpiBZVv6kowXKT8ymr+KMctyQsjCTsLJ0E2306macQlbPe9S2rBFas7F5t
	HueYxzmwSrHoZSjXlADswYaB9NaquzH6tDw6kcwYmyj8/rLcKgVsc0dQwoRrgaIaVbcxe28DiJm
	7+JjFuCYMtFlIQw9PfdebWPcQMyBbMdDaO3zyVsUC0cttYrD3ibouEHvwcVxEhACw8afX7uqnGY
	4BInQADf6Uviqs=
X-Google-Smtp-Source: AGHT+IF5e+BbM/nB7ldSUTBx41ohGxkpwbKqgp3YlBa/usovcD3+aGG/mmDnAdXRxAmMDyv3P5tc87eUYf3KPuXlSHg=
X-Received: by 2002:a17:907:c16:b0:ae3:b94b:36f5 with SMTP id
 a640c23a62f3a-af2f885748cmr519117566b.34.1753350987762; Thu, 24 Jul 2025
 02:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 24 Jul 2025 15:26:10 +0530
X-Gm-Features: Ac12FXySJgpBOnCuKwBthXuJMrMGZyOE4iGBytp3LqBDqt3vrEuK4MvdudxfalU
Message-ID: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
Subject: spacemit: P1 PMIC support on Banana pi F3 testing
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: "open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thank you for your work on the P1 PMIC patch for Spacemit K1 SoC - Banana P=
i F3.

I've been testing your patch series for the Banana Pi F3 [0] to enable SD c=
ard
and eMMC functionality,

[0] https://patchew.org/linux/20250710175107.1280221-1-elder@riscstar.com/

While debugging, I cross-referenced the patch with the BPI-F3-V3 board
schematic [1]
and noticed several discrepancies in the power configuration:

[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view

Incorrect Voltage Ranges: The minimum and maximum voltage values for
multiple regulators
(including BUCKs, ALDOs, and DLDOs) In the patch, do not match the
specifications in
the schematic's power tree.

Missing/Incorrect Labels: Many regulators are missing accurate labels and n=
ames,
which makes mapping them to the hardware difficult.

Device Tree Mapping: To configure the power sources correctly, the k1
user names from
the schematic needs to be properly mapped to its corresponding device
tree nodes.

I=E2=80=99ve put together a set of local changes to better align the regula=
tor
definitions with the board schematic.
These adjustments help improve the hardware mapping to the PMIC
regulators, though some details
may still need refinement. If you find the changes helpful, please
consider incorporating them into
the next revision of the patch.

I=E2=80=99d be grateful if you could Cc me on any future communication
regarding testing.
as I didn=E2=80=99t receive this patch series in my inbox.

Thanks
-Anand

Here is the boot log [2] https://pastebin.com/cXybbVar

It's not working on my end., Neither the eMMC nor the SD card is
getting detected.
Please let me know if I missed any more driver changes.

:: Triggering uevents...
[   13.671598][    C3] sched: DL replenish lagged too much
[   19.061738][   T76] platform d4280000.sdh: deferred probe pending:
platform: wait for supplier /soc/i2c@d401d800/pmic@41/regulators/aldo1
[   19.072163][   T76] platform d4281000.mmc: deferred probe pending:
platform: wait for supplier /soc/i2c@d401d800/pmic@41/regulators/buck3
:: running hook

Would you like help reviewing the patch or double-checking the
schematic mappings?

-----8<----------8<----------8<----------8<----------8<----------8<-----
amoon@amoon-t440s:~/mainline/linux-next-6.y-devel$ git diff
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 83907cc1d5cc..5a24a224f331 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -50,12 +50,28 @@ reg_vcc_4v: vcc-4v {
 };

 &emmc {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&emmc_cfg>;
        bus-width =3D <8>;
        mmc-hs400-1_8v;
        mmc-hs400-enhanced-strobe;
        non-removable;
        no-sd;
        no-sdio;
+       vmmc-supply =3D <&buck4>;
+       vqmmc-supply =3D <&buck3>;
+       status =3D "okay";
+};
+
+&sdcard {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&sdmmc_cfg>;
+       bus-width =3D <4>;
+       cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+       cd-inverted;
+       vmmc-supply =3D <&ald01>;
+       no-mmc;
+       no-sdio;
        status =3D "okay";
 };

@@ -74,105 +90,123 @@ pmic@41 {
                status =3D "okay";

                regulators {
-                       buck1 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3450000>;
+                       buck1: buck1 {
+                               regulator-name =3D "buck1";
+                               regulator-min-microvolt =3D <900000>;
+                               regulator-max-microvolt =3D <900000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

-                       buck2 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3450000>;
+                       buck2: buck2 {
+                               regulator-name =3D "buck2";
+                               regulator-min-microvolt =3D <900000>;
+                               regulator-max-microvolt =3D <900000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

-                       buck3 {
-                               regulator-min-microvolt =3D <500000>;
+                       buck3: buck3 {
+                               regulator-name =3D "buck3";
+                               regulator-min-microvolt =3D <1800000>;
                                regulator-max-microvolt =3D <1800000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

-                       buck4 {
-                               regulator-min-microvolt =3D <500000>;
+                       buck4: buck4 {
+                               regulator-name =3D "buck4";
+                               regulator-min-microvolt =3D <3300000>;
                                regulator-max-microvolt =3D <3300000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

-                       buck5 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3450000>;
+                       buck5: buck5 {
+                               regulator-name =3D "buck5";
+                               regulator-min-microvolt =3D <2100000>;
+                               regulator-max-microvolt =3D <2100000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

-                       buck6 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3450000>;
+                       buck6: buck6 {
+                               regulator-name =3D "buck6";
+                               regulator-min-microvolt =3D <1100000>;
+                               regulator-max-microvolt =3D <1100000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

-                       aldo1 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       ald01: aldo1 {
+                               regulator-name =3D "aldo1";
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <3300000>;
                                regulator-boot-on;
+                               regulator-always-on;
                        };

-                       aldo2 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       ald02: aldo2 {
+                               regulator-name =3D "aldo2";
+                               regulator-min-microvolt =3D <2800000>;
+                               regulator-max-microvolt =3D <2800000>;
                        };

-                       aldo3 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       ald03: aldo3 {
+                               regulator-name =3D "aldo3";
+                               regulator-min-microvolt =3D <2800000>;
+                               regulator-max-microvolt =3D <2800000>;
                        };

-                       aldo4 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       ald04: aldo4 {
+                               regulator-name =3D "aldo4";
+                               regulator-min-microvolt =3D <2800000>;
+                               regulator-max-microvolt =3D <2800000>;
                        };

-                       dldo1 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       d1d01: dldo1 {
+                               regulator-name =3D "dldo1";
+                               regulator-min-microvolt =3D <1200000>;
+                               regulator-max-microvolt =3D <1200000>;
                                regulator-boot-on;
                        };

-                       dldo2 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       d1d02: dldo2 {
+                               regulator-name =3D "dldo2";
+                               regulator-min-microvolt =3D <1200000>;
+                               regulator-max-microvolt =3D <1200000>;
                        };

-                       dldo3 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       d1d03: dldo3 {
+                               regulator-name =3D "dld03";
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <1800000>;
                        };

-                       dldo4 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       d1d04: dldo4 {
+                               regulator-name =3D "d1d04";
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <1800000>;
                                regulator-always-on;
                        };

-                       dldo5 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       d1d05: d1d05 {
+                               regulator-name =3D "d1d05";
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <1800000>;
                        };

-                       dldo6 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       d1d06: dldo6 {
+                               regulator-name =3D "d1d06";
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <1800000>;
                                regulator-always-on;
                        };

-                       dldo7 {
-                               regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3400000>;
+                       d1d07: dldo7 {
+                               regulator-name =3D "d1d07";
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <1800000>;
                        };
                };
        };
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 96d7a46d4bf7..8f5b6c7c34ea 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -18,6 +18,33 @@ i2c8-0-pins {
                };
        };

+       emmc_cfg: mmc-2-cfg {
+               mmc-2-pins {
+                       pinmux =3D <K1_PADCONF(93, 0)>,   /* EMMC_DAT0 */
+                               <K1_PADCONF(94, 0)>,    /* EMMC_DAT1 */
+                               <K1_PADCONF(95, 0)>,    /* EMMC_DAT2 */
+                               <K1_PADCONF(96, 0)>,    /* EMMC_DAT3 */
+                               <K1_PADCONF(97, 0)>,    /* EMMC_DAT4 */
+                               <K1_PADCONF(98, 0)>,    /* EMMC_DAT5 */
+                               <K1_PADCONF(99, 0)>,    /* EMMC_DAT6 */
+                               <K1_PADCONF(100, 0)>,   /* EMMC_DAT7 */
+                               <K1_PADCONF(101, 0)>,   /* EMMC_DS */
+                               <K1_PADCONF(102, 0)>,   /* EMMC_CLK */
+                               <K1_PADCONF(103, 0)>;   /* EMMC_CMD */
+               };
+       };
+
+       sdmmc_cfg: mmc-1-cfg {
+               mmc-1-pins {
+                       pinmux =3D <K1_PADCONF(15, 0)>,   /* MMC1_DAT3 */
+                       <K1_PADCONF(16, 0)>,    /* MMC1_DAT2 */
+                       <K1_PADCONF(17, 0)>,    /* MMC1_DAT1 */
+                       <K1_PADCONF(18, 0)>,    /* MMC1_DAT0 */
+                       <K1_PADCONF(19, 0)>,    /* MMC1_CMD */
+                       <K1_PADCONF(20, 0)>;    /* MMC1_CLK */
+               };
+       };
+
        uart0_2_cfg: uart0-2-cfg {
                uart0-2-pins {
                        pinmux =3D <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi
b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 2a5a132d5a77..4a11c733f4e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -834,6 +834,16 @@ storage-bus {
                        #size-cells =3D <2>;
                        dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>;

+                       sdcard: sdh@d4280000 {
+                               compatible =3D "spacemit,k1-sdhci";
+                               reg =3D <0x0 0xd4280000 0x0 0x200>;
+                               clocks =3D <&syscon_apmu CLK_SDH_AXI>,
+                                       <&syscon_apmu CLK_SDH0>;
+                               clock-names =3D "core", "io";
+                               interrupts =3D <99>;
+                               status =3D "disabled";
+                       };
+
                        emmc: mmc@d4281000 {
                                compatible =3D "spacemit,k1-sdhci";
                                reg =3D <0x0 0xd4281000 0x0 0x200>;
