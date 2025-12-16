Received: from mail82.out.titan.email (mail82.out.titan.email [3.216.99.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93B530C348
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.216.99.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765863987; cv=none; b=APmeJlmAp+ds5dbe33qlcvAJUuVbuTb8ql7fUuSxUaOoytFQM7UOg0Rl4Ii+ToSIL1+0FjQZ1HpulHDdabEFRkSpMSLCqUao1Bh4MtE+9ObJ9K0rPSCazSPvaFQIGfitPwYPnyDGshj8E5JrugX5FHrelux3dzn4ozz8h2ZF6UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765863987; c=relaxed/simple;
	bh=2wo+SNjwtzjFbNCgdpbgJIPPkRXDw6JIDIh3JnKugJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCPwhfaZLx9NaYoZ5HlbJubLGn4WZtnRKUtV/fkVcoEnCGt85a/MzbeysY3Qotcu1s/ym4TLxv/R1numbn3p+/FBsTt5CsJmATJlNtp/ayyrYW75c7GJ0sivGatrgp6ZKq9hfztzP48eBs8m6CWX6X46AYgMpBjlqHpnLefOnN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=N/FLnSUr; arc=none smtp.client-ip=3.216.99.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="N/FLnSUr"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVm0P2kWVz2x9p;
	Tue, 16 Dec 2025 05:37:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=e+1r86P5HAFAF4tmTh17hZ9dWoicuDdYMgvJbIXPz64=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=from:subject:mime-version:in-reply-to:to:cc:references:date:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765863445; v=1;
	b=N/FLnSUr35vYGMSmYsL4FIlNhq75xVLuF7IJyhPSC7LlfUnYFFWzbNIZAwnhi7f/mb3wD79i
	ctZr08srNhABusuKKJ8uEWWCFNCi2Mrbn7p0j/qNwEtglZB1e+RwJdwQWZxeHfvyAPAifviazui
	KWT8bPQuZPjAXc1/GzHKhmv8=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVm0L4DW0z2xCT;
	Tue, 16 Dec 2025 05:37:22 +0000 (UTC)
Date: Tue, 16 Dec 2025 05:37:18 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <aUDwDkd8k_4gD1yc@pie>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765863445215998306.27573.7974967081414755406@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=6940f015
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=2wmZI80qAAAA:8
	a=m09C00ilCGA78TySx9AA:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22

On Mon, Dec 15, 2025 at 03:00:52PM +0000, Michael Opdenacker wrote:
> Hi Yao
> 
> Thanks for your helpful questions!
> 
> On 12/15/25 13:58, Yao Zi wrote:
> > On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
> > > The OrangePi RV2 board exposes i2c2 and i2c8 buses
> > > from the Spacemit K1 SoC.
> > > 
> > > This declares devices present on such buses, in particular
> > > the at24 eeprom to store MAC addresses and the regulators
> > > attached to the PMIC on i2c8.
> > This series is named as "Attempt to enable MMC on SpacemiT K1 boards",
> > what's the relationship between MMC and PMIC/I2C bus? You didn't make
> > use of any regulators in the second patch, either (which seems wrong to
> > me).
> 
> I expected that declaring the regulators under the PMIC on i2c8 was enough
> to enable them, but I'm happy to be corrected.

Declaring them doesn't mean enable them. Regulator subsystem maintains a
enable reference count, and when it downcounts to zero, the regulator
gets disabled.

If no driver acquires one regulator, it gets disabled after 30s since
the regulator subsystem is initialized, see regulator_init_complete()
and regulator_init_complete_work_function.

On BPI F3, SD is supplied by buck4 of the PMIC. It's marked as
regulator-always-on, so wouldn't be disabled and then cause issues for
the SD card, but this doesn't mean it's okay to omit the correct
regulator supplier of SD.

> > 
> > vmmc-supply specifies the card's power supply. And if you want to enable
> > SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
> > for switching between 1.8v and 3.3v.
> 
> 
> I was thinking to get started without the SDR modes first, to make sure
> basic operation works first. Would that work?

Yes.

FYI, for SDR104 mode, you may need to implement some tuning logic[1] as
indicated by vendor driver,

	/*
	 * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
	 * if clock frequency is greater than 100MHz in these modes.
	 */

Though in mainline the eMMC on BPI-F3 already makes use of HS400 mode
without tuning. No idea what happened here, or it just happens to work
well.

Also, the pin controller on K1 SoC seems to have some undocumented
registers to select the IO voltage of SD pins, which should be adjusted
when switching IO voltage[2].

I think these pins should be implemented in the pinctrl driver, then you
could create two pinctrl states, one for 1.8v operation, one for 3.3v,
and switch between them through pinctrl_lookup_state() when changing IO
voltage.

The last thing to mention is that the three MMC controllers on K1 aren't
same, The one used for eMMC is the only one that has a phy (both SD and
SDIO controllers are marked as SDHCI_QUIRK2_BROKEN_PHY_MODULE[3]), thus
have different reset and tuning logics.

You probably need to create new compatibles for the SD and SDIO
controllers instead of re-using spacemit,k1-sdhci, and write correct
sdhci_spacemit_reset() for controllers without phy. This is probably
necessary even if you don't implement SDR modes.

> Would you have board examples to recommend, with an MMC controller operating
> in a way similar to the one on SpacemiT K1?

All sd/emmc controllers work similarly... you may want to take a look at
mmc-controller-common.yaml for common properties.

> Thanks again
> Michael.

That's it! I've struggled for hours with the MMC driver, and these are
all strange points which I've figured out. Hope it's helpful, and feel
free to ask me if I am not clear.

Regards,
Yao Zi

[1]: https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/drivers/mmc/host/sdhci-of-k1x.c#L1203
[2]: https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/drivers/mmc/host/sdhci-of-k1x.c#L923
[3]: https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_deb1.dts#L670
