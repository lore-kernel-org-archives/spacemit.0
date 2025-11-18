Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C9A3195E2
	for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475119; cv=none; b=O7dgqu/KV9iMr6qNxJXN0ZlJcPSRAVH9u7digIonXQ7JlgP/AlcDx1osKTfzJcrNvxtW080hd6FAABweKRQ+RFaAqgSOpV2L3BpTOoI+nMbQm/E/wU0Y+Gb23DXpWgIfQDRXBDuS5b5L+vrmQEPL1wWMlS5SzBWoK/wo09ZI6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475119; c=relaxed/simple;
	bh=Jx8fxT75dmMAjJJkYHCTKQsivov+RobrcMhVbSbrbSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqm71XkZqpabqN2rCogTvYl38OUj3CFjUdoJetco/kiGc3C58SskOVH3oI/O0Lk1PV1MYbvvdVfg+ykF20oQLw6uaK1IN2334XgCAsWTbcJeTyvDfe+b0kkugmPLwg7+d9rLEyHjySe17bkQStQ9pVHG3+zflwnoHAytptoiNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EzdQqQN6; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EzdQqQN6"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-92aee734585so218105239f.3
        for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 06:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763475116; x=1764079916; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQOHp/GwI3fcgmlB0YvLeMTllnQu/TZutZS/btTjmOc=;
        b=EzdQqQN6aVZwAJZqkb2Ff8s4EkRM/2Lod43YsKjRpr1ZANNdDi+t8b9QzfWabT8tIK
         NI4szURsk4cNuCFFdh+QV9cMnLsDsH2nin5oGJnh2bX240eEwHrJZ7iKbSj0nl7UudX6
         3Odu89snPg83cKuSGMFGsfXkWEQORXxFE1wZkCFaZk9aqRpNdOaZWIugZMRpIo3QGU62
         yjQyCksybn2/G4f4+997/T4Y3e4ncPy5VWxcxi1sa8YghmK9iCeJGZBIhBfr+ep3y+fo
         OQpwJb1cmdxAQoWIVyWlCEtVJ29edzJOBBhdYPctfrJ7F141pVeCtGnjX15fuhHA1XG3
         tWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475116; x=1764079916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQOHp/GwI3fcgmlB0YvLeMTllnQu/TZutZS/btTjmOc=;
        b=Sd3GCMAB+SLBxD42KexMsJcmGAGxY99rN5hV/QvLC5NvWTfRl7DGzsPehfx8e3VLD5
         9v/oQ9P2q4FE5zs9WGvwlN+biPbkVxtFIlbOxOqWTVVnhIX+Ng2+R8Ip/z2YRUuz3DB7
         drjbUu0sQmbQurNvdooC570wMlEP7a9vWnkeeR3hrPLeqqyUwZrau/itGdi+Rknbh02T
         KEzXQnxjIjxIXT0kW8AllQQKXfeeAM58LyhCjXaTsPRz74GJNIGLF3wFEroqEYVR/scp
         IPR4jjem44fEXEE6BLKQMQDI9dGSF7+WN5XYociAZnhvm47/A8Lat1ouAa7Wm0euGp/T
         u1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVizeLmeBbAR4uYTjxwJMNlSPSG0swhc7ZDF0+fb1hadcgHbTzYdiOBpEeCWnzz1Wju6GA1mZI2xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtyyDWPmh9/o5vW4MN0hAABExGMKlpGc8kJyFZVHufJxvdLZ2x
	dlzl0kcWat+zcEToRmv737yAJhSW+W89BS1RKkIvOY3wt8EWpxUhWwy+WorNWR7JNh0=
X-Gm-Gg: ASbGnctglocN6U46cAl7Uu5XPk22FrooDiWuY72BGGvb0eVAMR+JYzdllf9tYBIFTmW
	IMUn+E7BpRMLYQ3L77LGGKSQH2H3+1E5dIOTdguiCbHvoE/mMJVonyjajo/n940bAvyB1UOgYnk
	TeQboI4nRLT4FiEjSTOrupkHJnDF5d59AtSL+hm9eiEE4Yrp91Q0zzokBZyw9uTe5axUfD2l+Y8
	z/sjmjQHTetD6YGk8wSnzwRibYyll3aXZQKa7JL5tKNTHvAol1/sGdx6dKcBW9Q/K/Hs4aVKNFn
	sAks6fUatGfYLDE2FlLQUSOh6+TWqX1DSzkSFU4mrOPZswuFr8xZzC9aA+CY08slhddr1vfelWZ
	qB602E8YF5Uh/Wpb4DTwH2+CBWre2wfMsRG8PXXXcffPUGgBqXQJqfJIxHyUGc+o8EBWe1NPTAh
	wuqKogQKwT4xrRHrumcjEPteqpv1KaMwLiX5hN06Z8bdhbI3xcrw==
X-Google-Smtp-Source: AGHT+IF3S+JfrYl1iTQg9Cf+cciD5dTfnTSo4c8+gQm0I9ddxsueA+d0+U+Ih0ju8axq16SoJtC3pA==
X-Received: by 2002:a05:6638:2047:b0:573:15bb:830c with SMTP id 8926c6da1cb9f-5b7c9dd4a58mr12679050173.13.1763475115710;
        Tue, 18 Nov 2025 06:11:55 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd27fa4asm6008728173.26.2025.11.18.06.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:11:55 -0800 (PST)
Message-ID: <21f0aa62-464f-4d8d-b8d7-5a4455179534@riscstar.com>
Date: Tue, 18 Nov 2025 08:11:53 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] phy: spacemit: Introduce PCIe/combo PHY
To: Neil Armstrong <neil.armstrong@linaro.org>, vkoul@kernel.org,
 kishon@kernel.org
Cc: p.zabel@pengutronix.de, dlan@gentoo.org, aurelien@aurel32.net,
 guodong@riscstar.com, linux-phy@lists.infradead.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junzhong Pan <panjunzhong@linux.spacemit.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
 <20251113214540.2623070-5-elder@riscstar.com>
 <ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/18/25 2:56 AM, Neil Armstrong wrote:
> On 11/13/25 22:45, Alex Elder wrote:
>> Introduce a driver that supports three PHYs found on the SpacemiT
>> K1 SoC.  The first PHY is a combo PHY that can be configured for
>> use for either USB 3 or PCIe.  The other two PHYs support PCIe
>> only.
>>
>> All three PHYs must be programmed with an 8 bit receiver termination
>> value, which must be determined dynamically.  Only the combo PHY is
>> able to determine this value.  The combo PHY performs a special
>> calibration step at probe time to discover this, and that value is
>> used to program each PHY that operates in PCIe mode.  The combo
>> PHY must therefore be probed before either of the PCIe-only PHYs
>> will be used.
>>
>> Each PHY has an internal PLL driven from an external oscillator.
>> This PLL started when the PHY is first initialized, and stays
>> on thereafter.
>>
>> During normal operation, the USB or PCIe driver using the PHY must
>> ensure (other) clocks and resets are set up properly.
>>
>> However PCIe mode clocks are enabled and resets are de-asserted
>> temporarily by this driver to perform the calibration step on the
>> combo PHY.
>>
>> Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---

. . .

>> diff --git a/drivers/phy/phy-spacemit-k1-pcie.c b/drivers/phy/phy- 
>> spacemit-k1-pcie.c
>> new file mode 100644
>> index 0000000000000..75477bea7f700
>> --- /dev/null
>> +++ b/drivers/phy/phy-spacemit-k1-pcie.c
>> @@ -0,0 +1,670 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * SpacemiT K1 PCIe and PCIe/USB 3 combo PHY driver
>> + *
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights 
>> reserved.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +
>> +#include <dt-bindings/phy/phy.h>
>> +
>> +/*
>> + * Three PCIe ports are supported in the SpacemiT K1 SoC, and this 
>> driver
>> + * supports their PHYs.
>> + *
>> + * The PHY for PCIe port A is different from the PHYs for ports B and C:
>> + * - It has one lane, while ports B and C have two
>> + * - It is a combo PHY can be used for PCIe or USB 3
>> + * - It can automatically calibrate PCIe TX and RX termination settings
>> + *
>> + * The PHY functionality for PCIe ports B and C is identical:
>> + * - They have two PCIe lanes (but can be restricted to 1 via device 
>> tree)
>> + * - They are used for PCIe only
>> + * - They are configured using TX and RX values computed for port A
>> + *
>> + * A given board is designed to use the combo PHY for either PCIe or 
>> USB 3.
>> + * Whether the combo PHY is configured for PCIe or USB 3 is specified in
>> + * device tree using a phandle plus an argument.  The argument indicates
>> + * the type (either PHY_TYPE_PCIE or PHY_TYPE_USB3).
>> + *
>> + * Each PHY has a reset that it gets and deasserts during 
>> initialization.
>> + * Each depends also on other clocks and resets provided by the 
>> controller
>> + * hardware (PCIe or USB) it is associated with.  The controller drivers
>> + * are required to enable any clocks and de-assert any resets that 
>> affect
>> + * PHY operation.  In addition each PHY implements an internal PLL, 
>> driven
>> + * by an external (24 MHz) oscillator.
>> + *
>> + * PCIe PHYs must be programmed with RX and TX calibration values.  The
>> + * combo PHY is the only one that can determine these values.  They are
>> + * determined by temporarily enabling the combo PHY in PCIe mode at 
>> probe
>> + * time (if necessary).  This calibration only needs to be done once, 
>> and
>> + * when it has completed the TX and RX values are saved.
>> + *
>> + * To allow the combo PHY to be enabled for calibration, the resets and
>> + * clocks it uses in PCIe mode must be supplied.
>> + */
>> +
>> +struct k1_pcie_phy {
>> +    struct device *dev;        /* PHY provider device */
>> +    struct phy *phy;
>> +    void __iomem *regs;
>> +    u32 pcie_lanes;            /* Max (1 or 2) unless limited by DT */
>> +    struct clk *pll;
>> +    struct clk_hw pll_hw;        /* Private PLL clock */
>> +
>> +    /* The remaining fields are only used for the combo PHY */
>> +    u32 type;            /* PHY_TYPE_PCIE or PHY_TYPE_USB3 */
>> +    struct regmap *pmu;        /* MMIO regmap (no errors) */
>> +};
>> +
>> +#define CALIBRATION_TIMEOUT        500000    /* For combo PHY (usec) */
>> +#define PLL_TIMEOUT            500000    /* For PHY PLL lock (usec) */
>> +#define POLL_DELAY            500    /* Time between polls (usec) */
>> +
>> +/* Selecting the combo PHY operating mode requires APMU regmap access */
>> +#define SYSCON_APMU            "spacemit,apmu"
>> +
>> +/* PMU space, for selecting between PCIe and USB 3 mode (combo PHY 
>> only) */
>> +
>> +#define PMUA_USB_PHY_CTRL0            0x0110
>> +#define COMBO_PHY_SEL            BIT(3)    /* 0: PCIe; 1: USB 3 */
>> +
>> +#define PCIE_CLK_RES_CTRL            0x03cc
>> +#define PCIE_APP_HOLD_PHY_RST        BIT(30)
>> +
>> +/* PHY register space */
>> +
>> +/* Offset between lane 0 and lane 1 registers when there are two */
>> +#define PHY_LANE_OFFSET                0x0400
>> +
>> +/* PHY PLL configuration */
>> +#define PCIE_PU_ADDR_CLK_CFG            0x0008
>> +#define PLL_READY            BIT(0)        /* read-only */
>> +#define CFG_INTERNAL_TIMER_ADJ        GENMASK(10, 7)
>> +#define TIMER_ADJ_USB        0x2
>> +#define TIMER_ADJ_PCIE        0x6
>> +#define CFG_SW_PHY_INIT_DONE        BIT(11)    /* We set after PLL 
>> config */
>> +
>> +#define PCIE_RC_DONE_STATUS            0x0018
>> +#define CFG_FORCE_RCV_RETRY        BIT(10)        /* Used for PCIe */
>> +
>> +/* PCIe PHY lane calibration; assumes 24MHz input clock */
>> +#define PCIE_RC_CAL_REG2            0x0020
>> +#define RC_CAL_TOGGLE            BIT(22)
>> +#define CLKSEL                GENMASK(31, 29)
>> +#define CLKSEL_24M        0x3
>> +
>> +/* Additional PHY PLL configuration (USB 3 and PCIe) */
>> +#define PCIE_PU_PLL_1                0x0048
>> +#define REF_100_WSSC            BIT(12)    /* 1: input is 100MHz, SSC */
>> +#define FREF_SEL            GENMASK(15, 13)
>> +#define FREF_24M        0x1
>> +#define SSC_DEP_SEL            GENMASK(19, 16)
>> +#define SSC_DEP_NONE        0x0
>> +#define SSC_DEP_5000PPM        0xa
>> +
>> +/* PCIe PHY configuration */
>> +#define PCIE_PU_PLL_2                0x004c
>> +#define GEN_REF100            BIT(4)    /* 1: generate 100MHz clk */
>> +
>> +#define PCIE_RX_REG1                0x0050
>> +#define EN_RTERM            BIT(3)
>> +#define AFE_RTERM_REG            GENMASK(11, 8)
>> +
>> +#define PCIE_RX_REG2                0x0054
>> +#define RX_RTERM_SEL            BIT(5)    /* 0: use AFE_RTERM_REG 
>> value */
>> +
>> +#define PCIE_LTSSM_DIS_ENTRY            0x005c
>> +#define CFG_REFCLK_MODE            GENMASK(9, 8)
>> +#define RFCLK_MODE_DRIVER    0x1
>> +#define OVRD_REFCLK_MODE        BIT(10)    /* 1: use CFG_RFCLK_MODE */
>> +
>> +#define PCIE_TX_REG1                0x0064
>> +#define TX_RTERM_REG            GENMASK(15, 12)
>> +#define TX_RTERM_SEL            BIT(25)    /* 1: use TX_RTERM_REG */
>> +
>> +/* Zeroed for the combo PHY operating in USB mode */
>> +#define USB3_TEST_CTRL                0x0068
>> +
>> +/* PHY calibration values, determined by the combo PHY at probe time */
>> +#define PCIE_RCAL_RESULT            0x0084    /* Port A PHY only */
>> +#define RTERM_VALUE_RX            GENMASK(3, 0)
>> +#define RTERM_VALUE_TX            GENMASK(7, 4)
>> +#define R_TUNE_DONE            BIT(10)
>> +
>> +static u32 k1_phy_rterm = ~0;     /* Invalid initial value */
> 
> This global variable would have deserved a comment explaining
> why the value is global, instead the reason is only present in the
> commit message....

The (somewhat strange) overall scheme is described in a comment
block at the top of the file.  But I think you're right, a short
comment could at least refer back to that, and say "this is
where the calibration value is held" or something.

>> +/* Save the RX and TX receiver termination values */
>> +static void k1_phy_rterm_set(u32 val)
>> +{
>> +    k1_phy_rterm = val & (RTERM_VALUE_RX | RTERM_VALUE_TX);
>> +}
>> +
>> +static bool k1_phy_rterm_valid(void)
>> +{
>> +    /* Valid if no bits outside those we care about are set */
>> +    return !(k1_phy_rterm & ~(RTERM_VALUE_RX | RTERM_VALUE_TX));
>> +}

. . .

>> +module_platform_driver(k1_pcie_phy_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT K1 PCIe and USB 3 PHY driver");
>> +MODULE_LICENSE("GPL");
> 
> The code is quite hard to read, with pleny of useless comments
> when the actual comments we needs are either in the wrong place
> or just missing.

I think the way this calibration works is unusual and a bit
confusing, and I might have gone too far trying to explain it.

It would be more helpful for you to provide examples of what
comments you think are useless, and where there are things that
would benefit from better explanation (as you did for the lack
of a comment for the k1_phy_rterm value).  I want very much to
make things better, but your statement offers no guidance on
what you're looking for.

> Anyway, no big comment on the code or the API usage, all looks good:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thank you very much for reviewing this Neil.

					-Alex

> Thanks,
> Neil
> 

