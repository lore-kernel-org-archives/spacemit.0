Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7CF28851F
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 03:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220849; cv=none; b=muuUu9JKwQMxsgrFt8SXbnajTs/b50ka04PK5izpqIcyj2kI5HDBXJO2BbN0znic3Uv5oppeMd7mx15t94TJmaUCPlJ4V+vS4jZX7o4ygUNJgz3nRhzDbzDngQE8Lfer4U+xApmK7px5Z5Ixl4FG+yekPwKAt/RLH7j6wW0pqoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220849; c=relaxed/simple;
	bh=9L1QqcKRxY73Lonhb7ok/1Ap1il/W+A/UcWryUKYKdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCQFqjmMOPOtWYjZQWcBlFnEpklUjwyT6s3Qmj/A2aq/DhuSLctHxykEL8yVvCBITnPaU2Qr3PwmTJsqWVgywd2ddU00724qgE4VaAHTfitOoDGklOdZnzZHdIUTiw+AgfTy7LuRvz33M5Ak9WvAAUDgCgbiO8pCoWMLwfkqfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RthLfoWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RthLfoWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C461F000FF;
	Thu, 24 Sep 2026 03:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790220848;
	bh=YXOkrDjDr/hkOl8KYzN3mQW0ciYsQRBL6yev8DOgKVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RthLfoWcV/a6L3CwEPDvhMWUmUeqfl8i4IikHgu1Pyt0Il0tOzxchTbgz9nofrQgW
	 +fMRL+E9JMeSOkwYGxX6cFky1UFadaE6PjG1nUhv6XHGVvRx/f/4C0oO5krWT0E26m
	 kgOvhODZ6RFBBD2dUVgM9d//zTiMlw7jvq69GhMjQO3UBUPkHiPnUThxKXaOwrR1eY
	 f6ZfF68iv5dU0CtLDpgYVEAXcqxdWXGBkry0Lay5hGCbUNuHzLzPOQOI2a2FtGc8IN
	 xtSy6DzYIEYKXl9jf3yoOAPnLi0z8lgZ1lRxeL/GiPne8Hr5YYVuR8A0mV9vHKmSBT
	 vvyxrhPkZXcuw==
Date: Thu, 24 Sep 2026 03:34:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: u-boot@lists.u-boot-project.org, Tom Rini <trini@konsulko.com>,
	Jerome Forissier <jerome.forissier@arm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	David Lechner <dlechner@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	fanyi zhang <fanyi.zhang@mediatek.com>, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] configs: spacemit: k3: Enable Ethernet support
Message-ID: <20260924033404-GKH353745@kernel.org>
References: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
 <20260924-02-k3-ethernet-support-v1-2-b8e1fafc9249@kernel.org>
 <e4c84eac-01e6-4955-865c-56d8fb733498@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4c84eac-01e6-4955-865c-56d8fb733498@freeshell.de>

On 20:13 Wed 23 Sep     , E Shattow wrote:
> Hi Yixun,
> 
> On 9/23/26 18:53, Yixun Lan wrote:
> > Enable the SpacemiT platform glue for the DesignWare Ethernet QoS
> > controller together with the generic PHY framework, Gigabit Ethernet
> > PHY support and the Realtek PHY driver.
> > 
> > Enable DHCP, MII, ping and PXE commands for network configuration,
> > diagnostics and network boot. Allow U-Boot to generate a random
> > Ethernet address when no valid address is provided by the board.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  configs/spacemit_k3_defconfig | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/configs/spacemit_k3_defconfig b/configs/spacemit_k3_defconfig
> > index 6ca41aecc41..3a70a0a4858 100644
> > --- a/configs/spacemit_k3_defconfig
> > +++ b/configs/spacemit_k3_defconfig
> > @@ -24,10 +24,15 @@ CONFIG_SYS_PBSIZE=276
> >  CONFIG_HUSH_PARSER=y
> >  CONFIG_CMD_GPIO=y
> >  CONFIG_CMD_I2C=y
> > +CONFIG_CMD_DHCP=y
> > +CONFIG_CMD_MII=y
> > +CONFIG_CMD_PING=y
> > +CONFIG_CMD_PXE=y
> >  CONFIG_CMD_PMIC=y
> >  CONFIG_CMD_REGULATOR=y
> >  CONFIG_CMD_FAT=y
> >  CONFIG_CMD_FS_GENERIC=y
> > +CONFIG_NET_RANDOM_ETHADDR=y
> >  CONFIG_SYSCON=y
> >  CONFIG_CLK_SPACEMIT=y
> >  CONFIG_CLK_SPACEMIT_K3=y
> > @@ -35,6 +40,11 @@ CONFIG_SPACEMIT_GPIO=y
> >  CONFIG_DM_I2C=y
> >  CONFIG_SYS_I2C_SPACEMIT_K1=y
> >  CONFIG_MISC=y
> > +CONFIG_PHY_GIGE=y
> > +CONFIG_DWC_ETH_QOS=y
> > +CONFIG_DWC_ETH_QOS_SPACEMIT=y
> > +CONFIG_PHY_REALTEK=y
> > +CONFIG_PHY=y
> >  CONFIG_PINCTRL=y
> >  CONFIG_PINCTRL_SPACEMIT_K1=y
> >  CONFIG_DM_PMIC=y
> > 
> 
> Please also enable for this series: CMD_WGET DNS NET_LWIP
> 
No objection from my side, can add in next version

> We can intentionally leave WGET_HTTPS behind when there is no
> hardware-specific DM RNG driver implemented yet. I do not see a reason
> for the legacy network stack instead of LwIP; LwIP appears to be working
> well.
> 
Ok

> In my test I start a simple HTTP server on the local network host:
> 
> $ python3 -m http.server 8000
> Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
> 
> Next from a Sipeed K3 Pico-ITX 32GB board and your mainline u-boot series:
> 
> => dhcp
> ethernet@cac80000 Waiting for PHY auto negotiation to complete........ done
> DHCP client bound to address <10.20.30.40> (38 ms)
> => wget http://host:8000/mini.efi
> ##################################################
> 87962624 bytes transferred in 7414 ms (11.3 MiB/s)
> Bytes transferred = 87962624 (53e3400 hex)
> 
> With that,
> 
> Tested-by: E Shattow <e@freeshell.de>

Thanks for testing, will apply your tag to the series

-- 
Yixun Lan (dlan)
