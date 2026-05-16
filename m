Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F783191
	for <spacemit@lists.linux.dev>; Sat, 16 May 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778940682; cv=none; b=bib6LMsB6cOCSN/CFACz/9TFo2TSp6anU0RYJFXFZku6EcksWMua5pZUWJqcMHRVeJXMaQvxMxRVB6DplQ7gJ0OT5gK++DXtlJifGMeBOkS+1gc9dJAGe88bUPeL0AYAFGviQolSuY5Fcq4XUXYpVIoNtkYc1mquMVcclUr3luY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778940682; c=relaxed/simple;
	bh=MKQd5TVPGkOnI/BZDunngLi6RMufEmzjFG5irRHzUoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FUv8V753wlJ54D0T+TAN+CNUfxL9Vevff4zF4MKFF3ZpyJvMOoXxP7cn2Q2h7xrUd3Vy9+s+XBsJ7dIL2y/xS6/0JNQ3ZvGnQX/e0rsDfbjhOriI1ke4z6Jssjci+6JkZ2SPoADPJ2vpgjtnPMQkgSUqMg4FEiFCNaaJ3PU/vX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=mlxvpyFn; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="mlxvpyFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1778940640;
	bh=gl6h17IIH0vCWE5gXx+SMnqjSaIj3H6R4jAvrfOok/s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mlxvpyFnzbK3DFvybUsWoIBIVa8Qfja0e3gqLHisdV9JW1eAGO0YOSQ+F4aFOdbim
	 hBm04vC9FHY6OJyHjjE6HfsP8JMwSuPN1lwJyOYhRP6woLbb4L6Rnw+MfzeGY5KSnP
	 3m8YV3Q4YA1Wtm5hK4MS945z/nX8RsoMKKpm55YgxiG9+asRULIlhrVKSV2cgxYkOh
	 jFnEXvNCQKn4in/JVRz1jZQJuRLOHowB6LOGWmV+uViuZTplAUuM8QncSp3IUYA8Pm
	 GJKC7m/379kbvOnkdw8uv8IT+CyqlMuESugYs8M7a4+xWVJeYu6lHhph2VeEeseVkR
	 pNrizXHelklgw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id BB048B220220;
	Sat, 16 May 2026 16:10:37 +0200 (CEST)
Message-ID: <57bd1600-fa0f-4387-b2fc-4dd17430ce5b@freeshell.de>
Date: Sat, 16 May 2026 07:09:11 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
 <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
 <agbP0-OsfQRFJcr0@aurel32.net> <20260516053730-GKA3675990@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260516053730-GKA3675990@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/26 22:37, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 09:48 Fri 15 May     , Aurelien Jarno wrote:
>> On 2026-05-14 23:49, E Shattow wrote:
>>> On 5/14/26 08:56, Aurelien Jarno wrote:
>>>> The Milk-V Jupiter board has a connector for an eMMC module. Add an
>>>> entry for it in the device tree and alias it mmc0. As it is not
>>>> populated by default, do no mark it as non-removable.
>>>>
>>>
>>> The meaning of "non-removable" here is whether it is expected to be
>>> added and removed during use, requiring to be probed again; not whether
>>> it is a user configurable module or soldered down part.
>>
>> Not connecting the eMMC module and larking it as non-removable causes this info
>> message to appears in the logs:
>>
>> mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
>> mmc0: Failed to initialize a non-removable card
>>
> 
> I'm with E Shattow here, and would prefer to add "non-removable" property,
> Unlike SD card, the eMMC has no CD pin, some logic may be handled slightly
> differently.
> 
> For that failure message, I have no idea how to deal with it but might
> just ignore it.. Guess it's the price that have to pay if enabling the
> eMMC in DT but has no module soldered or plugged in?
> 

Yes in this situation the ideal measure would need an overlay to set the
status = "okay" or status = "disabled" dependent on the presence or
absence of the module, correctly representing the state of the hardware
- there is no module attached with which to configure. That is no
trivial amount of work though and the easier (and I think we agree
acceptable) approach is the driver will do what it does and inform that
the module is not initialized. I would agree that an error message is
the more useful outcome even if we would like to silence the error
message it is at least accurate information.

For comparison, Pine64 Star64 boot messages when SD Card is present and
eMMC module is not populated, as follows.

U-Boot:
Working FDT set to ff731a10
Hit any key to stop autoboot:  0
Card did not respond to voltage select! : -110
** Booting bootflow '<NULL>' with efi_mgr
Booting: Debian

Linux kernel (reverse timeline log):
dwmmc_starfive 16020000.mmc: IDMAC supports 32-bit address mode.
dwmmc_starfive 16020000.mmc: Using internal DMA controller.
dwmmc_starfive 16020000.mmc: Version ID is 290a
dwmmc_starfive 16020000.mmc: DW MMC controller at irq 26,32 bit host
data width,32 deep fifo
dwmmc_starfive 16020000.mmc: Got CD GPIO
dwmmc_starfive 16010000.mmc: IDMAC supports 32-bit address mode.
dwmmc_starfive 16010000.mmc: Using internal DMA controller.
dwmmc_starfive 16010000.mmc: Version ID is 290a
dwmmc_starfive 16010000.mmc: DW MMC controller at irq 25,32 bit host
data width,32 deep fifo
mmc_host mmc1: Bus speed (slot 0) = 45511111Hz (slot req 400000Hz,
actual 399220HZ div = 57)
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 400000Hz,
actual 399220HZ div = 57)
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 300000Hz,
actual 299415HZ div = 76)
mmc_host mmc1: Bus speed (slot 0) = 45511111Hz (slot req 50000000Hz,
actual 45511111HZ div = 0)
mmc1: new high speed SDXC card at address 0001
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 200000Hz,
actual 199610HZ div = 114)
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 100000Hz,
actual 99805HZ div = 228)

There "Card did not respond to voltage select! : -110" is repeated each
mmc interface that does not have media presently;  mmc1 is the eMMC
connection. This driver (for JH-7110 designware MMC controller) does not
complain about the eMMC module that is not attached.

I don't have an answer what should be done about that error message and
no opinion on making the driver less verbose or leaning into suggesting
an overlay (which is not trivial, so... feel free to ignore me on that)
however reporting on what is commonly true of 'non-removable' property.

Best regards,

-E
