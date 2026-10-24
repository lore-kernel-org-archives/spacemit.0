Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853155;
	b=RdTuVU9hgL9x1EWi6sulYepJ58b6OI/JXZ2YYFMQMsiHw0ckiF+kkbvm57YSfdszw0UY
	 7WCTVtTtiLmWxePVZVre4D0oicnVeczGZCBU+Sehu9vhSLULhV4b2mwhaOn4lFal+FtiV
	 ArCKpz/sYYMKaRCwc6w5kBLuyo3xxSZr/Rbmk4WmPjNoZVmXsNJQy2lcgq8E3Wai72Jkm
	 drhPGClUw1TwC2B3PRpKrLX7ypgqjRFtlN+rPOJ6tJpofgoVxNTBlC5rJcjV3PY15VWES
	 5Yw+yZsLP2h6DQjPyR163xyn3q1ehL1S6ZCojdQFcxgohurbawHjW3dz9xwEYhf5F6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853155;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ht4YxbyeqGa1db/OQDgQujtesPQ8TVSqALdRMTOwsLs=;
	b=T+v7d1ItlwkupkWhavrY1yKj0uP+5rSliteIobCHgSIqZBlrOdlZT4rG6k+/IGeThV6G
	 2ULFun420pzTvRLtrSRYZhven2A35MgF3MckG2QaICjuLPuAYARRynNdPJ6JdTFwittZJ
	 WVLVrBVvhEtkCXuIeHIXqRn+eZi8BsFIWSAOhDos9DoCrejLsSLjORoZxw7x/SPZZUh3d
	 BZA8wCMZZQAsnF9eI7nKLdExYUaJ86+rXG1pcn2JhZeZu9wkhfQYmdCPtwt+dT28vWlC7
	 PqIUvjJrfUxrtIEdXA2qQ8AsfzkyUrveAD7dzv47gsB60i6zuE5m5AilL3iWqgYe4nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=DPmSQd9l;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F62606A31A
	for <spacemit@lists.linux.dev>; Sat, 24 Oct 2026 14:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F62606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=DPmSQd9l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1792853110;
	bh=Ht4YxbyeqGa1db/OQDgQujtesPQ8TVSqALdRMTOwsLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DPmSQd9l1TQiRD/eGQSXusE1uIUEOaoLi4dOC3T3mPp0epM6IqOnZmenHs/4sPj15
	 9DEn/m617tc5hC/qnezROhHiH+HZ8oEy8ezg0Knzo1p26OUzReK4tN4JCEI1UjduQr
	 Sw5sB/1E+CW44zRHCvbaM3f5hVJtlDVW4lyU/lqDPVQI10O2NEGyT8jIaiZsAVI7Lg
	 n0H+IdvD50UgM0DCxbtgpU7yTlxlbfDxs/ADQnMoFPlWS7B8Dw1tCjQRwWHo9ti7Mh
	 34A61b9jXK8juDNzZ6MtkR2qji2yP95+oYTsqcN0knYnWkPBsKYHVbh/70LX9PnoM+
	 l5jTWcKV/harA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C54ECB225CF1;
	Sat, 24 Oct 2026 16:45:07 +0200 (CEST)
Message-ID: <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
Date: Sat, 24 Oct 2026 07:45:00 -0700
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
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hung-Chun,

On 10/24/26 02:25, Hung-Chun Tseng wrote:
> On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
> that stage sets up DRAM. This series marks the nodes it needs for that
> bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
> in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
> the PMIC rails and the SPI NOR in the board files.
> 
> The vendor confirmed that the BootROM itself does not access the
> EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
> sets up SDRAM, and DRAM cannot be trained without it.
> 
> Testing: all K1 DTBs build, and dtbs_check is clean for them with and
> without this series.
> 
> I used Claude to help read the U-Boot SPL and the device trees. I
> checked the changes and ran dtbs_check myself.
> 
> Changes in v3:
> - Reword both commit messages to describe the hardware instead of what
>   an SPL does, and drop the U-Boot paragraph from patch 1 (E)
> - Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
> - Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
> - Drop the Assisted-by tags, see commit 1e035297ffda
> - Keep E's Reviewed-by on both patches, as the changes are the ones
>   discussed on v2
> - Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/
> 
> Changes in v2:
> - Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
> - Rebase onto the spacemit dt-for-next branch
> - Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/
> 
> Hung-Chun Tseng (2):
>   riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
>   riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
>  7 files changed, 47 insertions(+)
> 
> 
> base-commit: d05c6236496071916e19012cda7149465f15e66e

The series is looking good although I now have a nitpick about patch
organization since it is acknowledged that BootROM does not setup or
access DRAM. BootROM may load code that does not setup or access DRAM.
At the moment the patches are strictly split on "K1 SoC" and "Per-board"
while the one stated intention is DRAM initialization after some of the
peripherals BootROM may have configured also; that makes sense not
knowing the split between BootROM and other things and so I ask to
change this.

Split the patches in this series so we have a clearly defined initial
changeset that does "Extend the BootROM configured peripherals to device
tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
eMMC, and SPI NOR boot modes". Capture all the BootROM SPL loader flows
that we can understand (USB missing currently? please add this) from
documentation, and with active participation from the vendor for any
questions. If that is an excessive burden then please let me know I will
look more closely at and give specific suggestions to be more helpful.

If you choose to keep patches for anything else that you want to add
(e.g. DRAM setup) extra beyond the basis of "BootROM" extension, defer
to the maintainer preference if they want it or not. I'm okay with "DRAM
setup" being an add-on with this series, but just as well for my
interest it certainly belongs in U-Boot if not in Linux. There may be
different requirements for linuxboot, oreboot, etc.

Aside, if the add-on patch is rejected by the maintainer here, it will
be then the basis for import to U-Boot (this is a different discussion)
and we can refer to the mailing list archive link; for the accepted
patches anyways these can be imported early to U-Boot and dropped there
when devicetree-rebasing will receive the changes.

I do not wish to delay anything but it seems to me to be important that
there is a distinction between describing the environment in which we
find ourselves subsequent to hardware BootROM, and any other extra
additions that we have for the most likely use (U-Boot SPL, linuxboot,
oreboot, whatever it is that wants DRAM initialized).

-E
