Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567821;
	b=0gvAVxFY5wLE/fmeyn/s4ZO1LvitWMrmiSKfEAvzbIMIOySCC42p0CTHK4V2GMUCT6rA
	 dhDXvvrDM5qL/8R70i15yhPjkX2Enh36BZm0U5JnHaodCBcpW7ZlILq5eJh4ttO3TVmYg
	 xKRQaL/QeuATSJR9GzyaZoHihEwxjemvO+9yP/09auR2GThXaVAdA90aNUJ4c2d6fZ2Dd
	 VI2ZOvIrRF7+GiA14fI6s95UfLL229QkpRxWEuymvPlKRy6g8e1JPaLaTbNgqWkjtqPMb
	 Hek1CLWjCiXNjbQI2UD+TjEB3puSFmP7eKYvyXbeJSqWGlUJ/qefnLnktSMCWKnDsvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567821;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JuUwzHWhZZaMYBjv7XG6XqaquyoaNPEepSOTGWcwgfM=;
	b=G3T0R74LJtw3dujNQyjW0c3SEHU6+V+BzUOdBY//ZHxnBTc4qPRhv3Lq//aKriqQn3ne
	 XTs5dMhR9XO8o2HYOrCq2bTV2EsVgjrlEeVE0/4WttyOdSCJTaIuVnCkdQbVb6s8rjEmG
	 3hWCmgDQxiM7H2EKnFhsCG23+z+xntkzrDHR4CZUEyxm2mqpAso39OmyMDwaLjOWVPJF/
	 jWBPA7JcdOfd809dr2JKXOmYaFnuYUJnl8BzIH/5mn9Gq7pGLTaSv9P5ggA6dVKazLvmI
	 KwBIAuMuBSFYQ0zyC3wkWp5XXqnR9QwTv0CTY19s92pe0L9k/DxZPSeHhojfFFcZeyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=g3+MPGUM;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C7606A31E
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 00:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=g3+MPGUM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1795567765;
	bh=JuUwzHWhZZaMYBjv7XG6XqaquyoaNPEepSOTGWcwgfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g3+MPGUMqcE0pyupobLlvRPp5zb6Ms/XBPfIcuRfmmP7LWJTRk+LMu6bIQWCHbbNw
	 0vDeuPs09oionSBocXBZKwXpxzs0Cz9aNw0QeEmqH+5Lhnpb52GhCnlv840DDmbGbM
	 4VIbEFXLtZwsMmKFC7xXW/yVvnDgFYQVfo5dCoOzmrRvvMfcznQECjx9edTvDTvUDr
	 391/O69rjbk8gKGDcUwtjtwFQy917q4QvPZtNiBDvtzj5+8HE9EhjTySEuRAD1fvfw
	 w9JQYe4VEDtQPsVLSAiYCgYp5iDMBGZn9XdsAlf5DnQJF/LIDhl7OP9jlYlvDmhaSl
	 6rYkvr2lkvr4w==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 93A9EB22081B;
	Wed, 25 Nov 2026 01:49:22 +0100 (CET)
Message-ID: <311a1481-0849-4865-88f4-636f13c2c6dc@freeshell.de>
Date: Tue, 24 Nov 2026 16:49:14 -0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
To: Yixun Lan <dlan@kernel.org>, Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <20261124231909-GKB245721@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261124231909-GKB245721@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yixun,

On 11/24/26 15:19, Yixun Lan wrote:
> Hi Hung-Chun, 
> 
> On 17:25 Sat 24 Oct     , Hung-Chun Tseng wrote:
>> On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
>> that stage sets up DRAM. This series marks the nodes it needs for that
>> bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
>> in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
>> the PMIC rails and the SPI NOR in the board files.
>>
>> The vendor confirmed that the BootROM itself does not access the
>> EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
>> sets up SDRAM, and DRAM cannot be trained without it.
>>
>> Testing: all K1 DTBs build, and dtbs_check is clean for them with and
>> without this series.
>>
>> I used Claude to help read the U-Boot SPL and the device trees. I
>> checked the changes and ran dtbs_check myself.
>>
>> Changes in v3:
>> - Reword both commit messages to describe the hardware instead of what
>>   an SPL does, and drop the U-Boot paragraph from patch 1 (E)
>> - Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
>> - Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
>> - Drop the Assisted-by tags, see commit 1e035297ffda
>> - Keep E's Reviewed-by on both patches, as the changes are the ones
>>   discussed on v2
>> - Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/
>>
>> Changes in v2:
>> - Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
>> - Rebase onto the spacemit dt-for-next branch
>> - Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/
>>
>> [1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/
>>
>> Hung-Chun Tseng (2):
>>   riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
>>   riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
>>
> I'd not put this series on hold, we generally could address other
> remains of issue/improvement later. so with
> 
> Reviewed-by: Yixun Lan <dlan@kernel.org>

With regard to mainline U-Boot use of devicetree-rebasing there is a
robust method in U-Boot build system for overrides such that we may
adopt these proposed changes there before they are accepted in Linux.

With changes-requested all addressed for v4 I expect the shape of this
will be good and it is not holding back anything in Linux kernel. The
hold is only due having to ask for what the closed-source BootROM is
doing and waiting for this confirmation now instead of having access to
see its code directly. There are intellectual property warnings
published by SpacemiT prohibiting reverse-engineering the BootROM so it
cannot be expected to proceed any more quickly than asking and waiting
for a reply.

If you would like to abandon the approach I suggest of considering the
effects of BootROM peripheral configuration as a hardware environment
needing device tree description and bootph-pre-ram hints for
constrained-memory SPL, then that topic can also be discussed. Please be
clear what your expectations are, thanks!

-E

[...]
