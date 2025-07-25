Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390D17B50A
	for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 01:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753408575; cv=none; b=YqjJ36kj6G3kq2rST/ueZBruGXiP1IMf1Yp9TBJ1y26eoMQxLRtMvjMrjv0FGk1D/Y2UsYnnb3g3x76kJkAu0y+v9dcRKozPb9cY5kLf/vPU6JEjopvLi2zTNJY6J5km204IJ+COwDzlFKRXD65zHZcbuL2mmaMnI6KH63mOwNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753408575; c=relaxed/simple;
	bh=8PBNl29qAKyXDqSAuweDeiuXva1+FrnjuNfnkYnZpzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDH56ID8hg8yAovNRmw2myzD0GxnkFXSUx7cOTe+0M/7U9FDhKI6yoSxtj20KR7SZjqj+OgMt5wGF+0t+NivVf9R9Km/MY0+rfguN3fRQZlfPCOfAhGL+FqBC5ySuVX5/V3DwkLyf8yzWHmmAscAGsYwx8MIQjB4knGPWDObOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3FHgDVg/; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3FHgDVg/"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e3c34a9b4cso3020865ab.3
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 18:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753408572; x=1754013372; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xllI7rnmmTOxWtDTEVM36s3DPm7HR85x9hyFrS4v7Yo=;
        b=3FHgDVg/x4mJQtQ6IH8MnhuY539Q5tkGr669xXAsFChRBx0nxd7kd50TeIzjCy0nRj
         gLDwpAsoDrsczdj2sMtvatBcqgX5IPlRG1XAwnqaaFrH72urLYImq3XKkuFpw0c9ScbC
         w6zKzu8TKxrvW+6mwtcDkAgLlktsnXP3uQ90v5WhmZ9+sZ8/KH94hUwcIU7DZ5KzAnR5
         nOF4RurLMhg7iUEDWP6XpMrnjjqpIIJPHBUBHHZeA2nfufDpYdNNEpOUDYkX61C4VrCp
         0uRYZhVpOKdKbhq9XJulL+HwZHMogKihtO4i5iZLbTCWyXNlYra7iuKXu+q1duC4QcLL
         s3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753408572; x=1754013372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xllI7rnmmTOxWtDTEVM36s3DPm7HR85x9hyFrS4v7Yo=;
        b=KNIdeXmbTsOp/8t40SkkHs3G4zDo/d0f9gJjE2j95yB9IYDgTkpUlLuSioXX/ZgE08
         RsEWzaXHt2gJURjWlPI5AnkOqI1ZemR+wKbPVEwX2HqRUqsx3rcgDOPvbBox5tv2PUKg
         /+7gCIjhRLYEsrwIEcFok1J0LCvnMVadfSDbXVkWVFm5MS55Ltujqp5gPBa3Ka43OVB0
         NqtcVck90z+VUqDwRPLcCYYwx8RYbfJUJxwgMFtII4VshlCgt9aZzO3Tjb2Xp3lyiH+d
         TQw6ChKbyLi02eBbLjR+BP8DcQobxPjYZ9Z4D8Lwy/0NWMR62SekqHyXfc7hE4iY4/Gg
         SteQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/JJVTwNNt6PGSbTNbMfQ/oqd3ZOx7K89+nqS6iNnPR6W87Qxj9lSFUXxhN7Z4Yb6GHFPQXNJgOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZBt8C9944WWEQe68lV5E4ZA9TSdOENfi3ttBuf1gHRQNbkDEH
	nDpYNkOOjgeiq/jlvN/vTQoK59adhF7DUu67QjUmtWpW5tdYkRIC4WnledmzXGxHFTA=
X-Gm-Gg: ASbGncvOOmanya99PAly2kLaRSHyvPW3wAXF/tHNox9toSf5f8fqnFUJg4dsM0qukre
	LC6aAS2OyB0XPAt31gDyOp1jDrr9gycBcBMQVrWfrhe8awZGUFM66xK2KYM0hFJJeQDNUvBuPzS
	cHnpob5AMGmzI26ZPjJhWB4xEWLu7fNMk4HEqcLeIoTcz88K+2h8W8QgSw4/2jDTF/2EnqA83u0
	OZrQnMgZrNVlv/aBjUnoEFKGb1NO4TP20kO20ZIaGUBFR8Vn0Bzp7jILM51y3K5u306XhhCk8/0
	Q3qAWfCH/2fe8KFrE+yYK+CjgENZA3OcrGpXqyclrUk6W5zErNa879uS6b1XYSvDIvvZ0ADMJB9
	1Mm7uH+ltBmjjHXwiBO6EePvM1Ijn0oASZA==
X-Google-Smtp-Source: AGHT+IHHXGbEWdXrcSHE0wCXKmWHmCdHsVT/SN+taKdACgMbomJ8Be5TDCw7fb2341JthiVgirmNGg==
X-Received: by 2002:a05:6e02:2687:b0:3e2:956a:3a64 with SMTP id e9e14a558f8ab-3e331e2c813mr179570965ab.18.1753408571775;
        Thu, 24 Jul 2025 18:56:11 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508aea8d8c1sm752985173.30.2025.07.24.18.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 18:56:11 -0700 (PDT)
Message-ID: <e4d9cac8-f7e0-4f69-85ac-19cba4a612c9@riscstar.com>
Date: Thu, 24 Jul 2025 20:56:10 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spacemit: P1 PMIC support on Banana pi F3 testing
To: Anand Moon <linux.amoon@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: "open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>,
 spacemit@lists.linux.dev
References: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/24/25 4:56 AM, Anand Moon wrote:
> Hi Alex,
> 
> Thank you for your work on the P1 PMIC patch for Spacemit K1 SoC - Banana Pi F3.
> 
> I've been testing your patch series for the Banana Pi F3 [0] to enable SD card
> and eMMC functionality,
> 
> [0] https://patchew.org/linux/20250710175107.1280221-1-elder@riscstar.com/
> 
> While debugging, I cross-referenced the patch with the BPI-F3-V3 board
> schematic [1]
> and noticed several discrepancies in the power configuration:
> 
> [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
> 
> Incorrect Voltage Ranges: The minimum and maximum voltage values for
> multiple regulators
> (including BUCKs, ALDOs, and DLDOs) In the patch, do not match the
> specifications in
> the schematic's power tree.

I really appreciate you checking this.

The values I used were derived from the vendor code that I
started with.  I was assured that this baseline worked on
the Banana Pi BPI-F3.

For the record, I *do* have a functioning SD card and eMMC.
I'm not sure just now what you are using differs from what
I am using.

I would like to understand and reconcile the differences you
point out but I'm not able to do that at this time; maybe
next week.

You say the names don't match.  From what I can tell, your
names are like "d1d0" (D one D zero) rather than "dldo"
(D L D O), and what I see in the document you link to uses
all letters.  If I'm misunderstanding, please explain.

Thanks.

					-Alex


> Missing/Incorrect Labels: Many regulators are missing accurate labels and names,
> which makes mapping them to the hardware difficult.
> 
> Device Tree Mapping: To configure the power sources correctly, the k1
> user names from
> the schematic needs to be properly mapped to its corresponding device
> tree nodes.
> 
> I’ve put together a set of local changes to better align the regulator
> definitions with the board schematic.
> These adjustments help improve the hardware mapping to the PMIC
> regulators, though some details
> may still need refinement. If you find the changes helpful, please
> consider incorporating them into
> the next revision of the patch.
> 
> I’d be grateful if you could Cc me on any future communication
> regarding testing.
> as I didn’t receive this patch series in my inbox.
> 
> Thanks
> -Anand
> 
> Here is the boot log [2] https://pastebin.com/cXybbVar
> 
> It's not working on my end., Neither the eMMC nor the SD card is
> getting detected.
> Please let me know if I missed any more driver changes.
> 
> :: Triggering uevents...
> [   13.671598][    C3] sched: DL replenish lagged too much
> [   19.061738][   T76] platform d4280000.sdh: deferred probe pending:
> platform: wait for supplier /soc/i2c@d401d800/pmic@41/regulators/aldo1
> [   19.072163][   T76] platform d4281000.mmc: deferred probe pending:
> platform: wait for supplier /soc/i2c@d401d800/pmic@41/regulators/buck3
> :: running hook
> 
> Would you like help reviewing the patch or double-checking the
> schematic mappings?
> 
> -----8<----------8<----------8<----------8<----------8<----------8<-----
> amoon@amoon-t440s:~/mainline/linux-next-6.y-devel$ git diff
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 83907cc1d5cc..5a24a224f331 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -50,12 +50,28 @@ reg_vcc_4v: vcc-4v {
>   };
> 
>   &emmc {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&emmc_cfg>;
>          bus-width = <8>;
>          mmc-hs400-1_8v;
>          mmc-hs400-enhanced-strobe;
>          non-removable;
>          no-sd;
>          no-sdio;
> +       vmmc-supply = <&buck4>;
> +       vqmmc-supply = <&buck3>;
> +       status = "okay";
> +};
> +
> +&sdcard {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sdmmc_cfg>;
> +       bus-width = <4>;
> +       cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +       cd-inverted;
> +       vmmc-supply = <&ald01>;
> +       no-mmc;
> +       no-sdio;
>          status = "okay";
>   };
> 
> @@ -74,105 +90,123 @@ pmic@41 {
>                  status = "okay";
> 
>                  regulators {
> -                       buck1 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3450000>;
> +                       buck1: buck1 {
> +                               regulator-name = "buck1";
> +                               regulator-min-microvolt = <900000>;
> +                               regulator-max-microvolt = <900000>;
>                                  regulator-ramp-delay = <5000>;
>                                  regulator-always-on;
>                          };
> 
> -                       buck2 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3450000>;
> +                       buck2: buck2 {
> +                               regulator-name = "buck2";
> +                               regulator-min-microvolt = <900000>;
> +                               regulator-max-microvolt = <900000>;
>                                  regulator-ramp-delay = <5000>;
>                                  regulator-always-on;
>                          };
> 
> -                       buck3 {
> -                               regulator-min-microvolt = <500000>;
> +                       buck3: buck3 {
> +                               regulator-name = "buck3";
> +                               regulator-min-microvolt = <1800000>;
>                                  regulator-max-microvolt = <1800000>;
>                                  regulator-ramp-delay = <5000>;
>                                  regulator-always-on;
>                          };
> 
> -                       buck4 {
> -                               regulator-min-microvolt = <500000>;
> +                       buck4: buck4 {
> +                               regulator-name = "buck4";
> +                               regulator-min-microvolt = <3300000>;
>                                  regulator-max-microvolt = <3300000>;
>                                  regulator-ramp-delay = <5000>;
>                                  regulator-always-on;
>                          };
> 
> -                       buck5 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3450000>;
> +                       buck5: buck5 {
> +                               regulator-name = "buck5";
> +                               regulator-min-microvolt = <2100000>;
> +                               regulator-max-microvolt = <2100000>;
>                                  regulator-ramp-delay = <5000>;
>                                  regulator-always-on;
>                          };
> 
> -                       buck6 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3450000>;
> +                       buck6: buck6 {
> +                               regulator-name = "buck6";
> +                               regulator-min-microvolt = <1100000>;
> +                               regulator-max-microvolt = <1100000>;
>                                  regulator-ramp-delay = <5000>;
>                                  regulator-always-on;
>                          };
> 
> -                       aldo1 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       ald01: aldo1 {
> +                               regulator-name = "aldo1";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
>                                  regulator-boot-on;
> +                               regulator-always-on;
>                          };
> 
> -                       aldo2 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       ald02: aldo2 {
> +                               regulator-name = "aldo2";
> +                               regulator-min-microvolt = <2800000>;
> +                               regulator-max-microvolt = <2800000>;
>                          };
> 
> -                       aldo3 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       ald03: aldo3 {
> +                               regulator-name = "aldo3";
> +                               regulator-min-microvolt = <2800000>;
> +                               regulator-max-microvolt = <2800000>;
>                          };
> 
> -                       aldo4 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       ald04: aldo4 {
> +                               regulator-name = "aldo4";
> +                               regulator-min-microvolt = <2800000>;
> +                               regulator-max-microvolt = <2800000>;
>                          };
> 
> -                       dldo1 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       d1d01: dldo1 {
> +                               regulator-name = "dldo1";
> +                               regulator-min-microvolt = <1200000>;
> +                               regulator-max-microvolt = <1200000>;
>                                  regulator-boot-on;
>                          };
> 
> -                       dldo2 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       d1d02: dldo2 {
> +                               regulator-name = "dldo2";
> +                               regulator-min-microvolt = <1200000>;
> +                               regulator-max-microvolt = <1200000>;
>                          };
> 
> -                       dldo3 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       d1d03: dldo3 {
> +                               regulator-name = "dld03";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
>                          };
> 
> -                       dldo4 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       d1d04: dldo4 {
> +                               regulator-name = "d1d04";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
>                                  regulator-always-on;
>                          };
> 
> -                       dldo5 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       d1d05: d1d05 {
> +                               regulator-name = "d1d05";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
>                          };
> 
> -                       dldo6 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       d1d06: dldo6 {
> +                               regulator-name = "d1d06";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
>                                  regulator-always-on;
>                          };
> 
> -                       dldo7 {
> -                               regulator-min-microvolt = <500000>;
> -                               regulator-max-microvolt = <3400000>;
> +                       d1d07: dldo7 {
> +                               regulator-name = "d1d07";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
>                          };
>                  };
>          };
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index 96d7a46d4bf7..8f5b6c7c34ea 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -18,6 +18,33 @@ i2c8-0-pins {
>                  };
>          };
> 
> +       emmc_cfg: mmc-2-cfg {
> +               mmc-2-pins {
> +                       pinmux = <K1_PADCONF(93, 0)>,   /* EMMC_DAT0 */
> +                               <K1_PADCONF(94, 0)>,    /* EMMC_DAT1 */
> +                               <K1_PADCONF(95, 0)>,    /* EMMC_DAT2 */
> +                               <K1_PADCONF(96, 0)>,    /* EMMC_DAT3 */
> +                               <K1_PADCONF(97, 0)>,    /* EMMC_DAT4 */
> +                               <K1_PADCONF(98, 0)>,    /* EMMC_DAT5 */
> +                               <K1_PADCONF(99, 0)>,    /* EMMC_DAT6 */
> +                               <K1_PADCONF(100, 0)>,   /* EMMC_DAT7 */
> +                               <K1_PADCONF(101, 0)>,   /* EMMC_DS */
> +                               <K1_PADCONF(102, 0)>,   /* EMMC_CLK */
> +                               <K1_PADCONF(103, 0)>;   /* EMMC_CMD */
> +               };
> +       };
> +
> +       sdmmc_cfg: mmc-1-cfg {
> +               mmc-1-pins {
> +                       pinmux = <K1_PADCONF(15, 0)>,   /* MMC1_DAT3 */
> +                       <K1_PADCONF(16, 0)>,    /* MMC1_DAT2 */
> +                       <K1_PADCONF(17, 0)>,    /* MMC1_DAT1 */
> +                       <K1_PADCONF(18, 0)>,    /* MMC1_DAT0 */
> +                       <K1_PADCONF(19, 0)>,    /* MMC1_CMD */
> +                       <K1_PADCONF(20, 0)>;    /* MMC1_CLK */
> +               };
> +       };
> +
>          uart0_2_cfg: uart0-2-cfg {
>                  uart0-2-pins {
>                          pinmux = <K1_PADCONF(68, 2)>,
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi
> b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 2a5a132d5a77..4a11c733f4e4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -834,6 +834,16 @@ storage-bus {
>                          #size-cells = <2>;
>                          dma-ranges = <0x0 0x00000000 0x0 0x00000000
> 0x0 0x80000000>;
> 
> +                       sdcard: sdh@d4280000 {
> +                               compatible = "spacemit,k1-sdhci";
> +                               reg = <0x0 0xd4280000 0x0 0x200>;
> +                               clocks = <&syscon_apmu CLK_SDH_AXI>,
> +                                       <&syscon_apmu CLK_SDH0>;
> +                               clock-names = "core", "io";
> +                               interrupts = <99>;
> +                               status = "disabled";
> +                       };
> +
>                          emmc: mmc@d4281000 {
>                                  compatible = "spacemit,k1-sdhci";
>                                  reg = <0x0 0xd4281000 0x0 0x200>;

