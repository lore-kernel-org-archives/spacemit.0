Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D763126CD
	for <spacemit@lists.linux.dev>; Sat, 23 May 2026 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779521731; cv=none; b=KGLxRWFqOG8qaOvv6A1RJ8JeZTcTcJPShjWi9NVtjRX3SWzYZiAb5kMsh703bn4UgrN+g1QFVkxI2O2BFTw7TVANxJwd3v4a9H/YUE/cw+lFKxnpB70INfQMTd5NMGyWDS0/DHeUmJiaregACaK30i4cET4WuF7FisJG0QAW0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779521731; c=relaxed/simple;
	bh=bR51Qm/yxTLxaRv4bh/z2Q5XKd1/EexKk4i1970/taE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oAKayfAH07n8p8wwsXc9DvfFpkxLUg+4f9Fm4t3xtOzHq5uCdQ4rXE6CJBiavI/oa161NqMt0gV858pSRTXlipCuSwbqdXFl/O64G2t8D2E6ZFL4++JkVfzYRa4HwxZ5/h9TmKCMwE0mPlpahmsG5Wu9pzwaAan7o3K9+nf4ReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=temperror (0-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=kVNZXkYG; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="kVNZXkYG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7994BC2C660;
	Sat, 23 May 2026 07:36:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 612F260733;
	Sat, 23 May 2026 07:35:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 493B410810452;
	Sat, 23 May 2026 09:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779521725;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=D7lGhyE00bhxvQvqfTNpmfVMLD8AohOK1k5o75r5mck=;
	b=kVNZXkYGCS/cwyM9QmvC7KhwQNTB1xSTYhRXUEEMglEw0G+S9pgp8Qsu38oLSdq9ew6uED
	REOpn4sWDP3OoSB/2inzi7vYF8SBuo0VZr5NUzQbac7/WYtKUZd2lwwj0rc2XgAUfTQCDp
	dPt1YQXsOHEfhKBxyKiQRe6zaUP0qOnwn6J0KJ6IDRGX+AfM0KDUZYazTsgSKN/cW60f53
	RIEXTd+Whec8r77l/HFOeEl+A6VhTU7YSvHTEO7OmH3b/Fcj4m5X3gLUNTsXf7k/Gx/7l/
	/LPpZX5GHbiB3xYREyOV0QhVGtsLxLxxSvQBdqOg4Np5C0CLmDBFVD4g6eVD4w==
Message-ID: <04f1215a-e8dc-4f0f-b564-e36c52ad5275@rootcommit.com>
Date: Sat, 23 May 2026 09:35:14 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO
 board
To: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>,
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-3-707ef1917a30@pigmoral.tech>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260522-bpi-cm6-v1-3-707ef1917a30@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Junhui

Thanks a lot for these patches!
Yours are much more exhaustive than the ones I was cooking.

On 5/22/26 12:01 PM, Junhui Liu wrote:
> The Banana Pi BPI-CM6 IO board combines the BPI-CM6 compute module with
> an IO carrier board. The core module integrates the SpacemiT K1 SoC,
> PMIC, DDR, eMMC, the eth0 PHY, and wireless connectivity. The companion
> IO carrier board extends it by providing the eth1 PHY and exposing
> standard interfaces, including dual Gigabit Ethernet, MicroSD, two USB-A
> ports, a USB Type-C port, two PCIe M.2 slots, and a serial console.
>
> The board also has two I2C EEPROMs. One is on the core module, which
> stores factory manufacturing data and is marked read-only. The other is
> on the carrier board, which is shipped unprogrammed and left writable
> for evaluation purposes.
>
> Add initial support for UART console, eMMC, SD card, I2C, EEPROMs,
> PCIe, USB, and dual Ethernet interfaces.
>
> Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>   arch/riscv/boot/dts/spacemit/Makefile              |   1 +
>   .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 215 +++++++++++++++++++
>   arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  | 227 +++++++++++++++++++++
>   3 files changed, 443 insertions(+)

Reviewed-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

For booting on MMC, I also had to add Iker Pedrosa's patches in Ulf 
Hanson's mmc/next branch
(https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/log/?h=next)
Thanks again!
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

