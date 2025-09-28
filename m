Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526FD1EF09B
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759050358; cv=none; b=Q95LE5eVbRSfyj6L7FCtzsgZmDoMUlYXDyXDgoD631E9Ah6VW6FQxySqKhR8KuPFeIaJ/YlVtFXSPM6Io1+1W8f/8IHR/Y1mrDXdwXUB3uUB5HriKAx1lSY/yOEeMbed5NTJbZGYvEC3IR7yZcZ6qUi1+eRrf6KMGoLLdu7NbO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759050358; c=relaxed/simple;
	bh=17D7Os5sRAj4H/OLbJKtd+O3Kai5YbvhYWbdpkz1ibw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNJwK6KcX/W7MSOSIdGFPvykRutY3jBqg7UnFAYwijeI8bMgLXI6UCSo4EyltPKWiFRpQ6SIsa7+UIwmSI3qP8qoptpNre26ORiiwEy30fm2IhNRTxVwUAzE82DDicQLCesdJn9XX9shnfF/rawKEsEaEsgu8g4mu4A6IX6qAt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ImulV0iQ; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ImulV0iQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759050286;
	bh=A5XNR7o7T9bmHUiLwBsgkJ4yBPqbpMEyQqeUzOe4SXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ImulV0iQU+H0ZIQBDEeFdIqPecf0DTpSX/8p8uH6Wv5bzl1Y8YCsptoNE3xbkyQwU
	 kq5YO47vkrLWjY4SXCs/kbZBb0X68J+9wi7Gc+ekBt5kc6cwH+KggMHmZfOqOx09mk
	 QyH98HvdcSaWB0Y5FXvdYRIqyzvnRi7d5PVH+YEg=
X-QQ-mid: zesmtpgz7t1759050284t3bf2e7e3
X-QQ-Originating-IP: 5XgI999sx5jfiBgGyK3YT6uH/AVd7s0Bwsp5x2yvagA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 17:04:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5680258146245078500
EX-QQ-RecipientCnt: 15
Date: Sun, 28 Sep 2025 17:04:43 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MusePi Pro board device
 tree
Message-ID: <35C0EFBB84167959+aNj6K33fl7utuqcf@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com>
 <20250928080003-GYB1344940@gentoo.org>
 <3074FC8521909735+aNjsSWwkd1aH-moh@kernel.org>
 <20250928085010-GYC1344940@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928085010-GYC1344940@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M+4aTJW6U+KtEJ4ew0AdB4bnH4LBagWX45cFxLAbJuV0rfPRsYFcicUA
	FneH9fczriD4gCX+ZW81FPz9QDRK/F0Uc8fEDtphd+5Gd7gjpWQqglDOp5NgQeRXHakZ/Yr
	1GrSxe6qCdanRmP/EvuduR9RFIOjc72qRrCWl8jBj1CiYAJA3ITBq/vL7mFC56ZjJVjC6Ns
	zir9Ik24aa08/vds7+J1QJtSU1opvA06bqTdTMCz2MLRto59n3L5zKnAky+6m81AaIcWnRR
	6oCcwjdCQ71gqXxCfqChmqYwgMgFQt4DgqlFF8DHf6ZzdewHyHkZIEVsMWhDkkloutvVTbI
	gqlTT50GmN1MEretky7h+vyMo3XBEL9npKPitka5Vx0zirhHZhbeNzd7zLQ1mwM7u2d2a5O
	0sB2K53tgH5YPk5NKP04ySZYWS54xLI4TtfizfnI2Y+atFdYe0SH/jou1JDNmkfH11xXoUV
	LQUkw/TU4//r+XiHcOlruvn9AzFXd2UupIlYyJoaXY+0Y9IAJEFVECjhcmJw5Eskd+wpxjy
	cVCo+uarpXUULgscZGUl6Bi4ZGVE7tGjxlu0cyyxyDH5Ws2exq8v13HYL3xEQ9pvZVRk/tN
	iHRt28AteHFt36UJPVLk2gWjFg4befi3QsJNcMS1AL5RzfpNvzmE/KbvjeART56R4smSyjp
	agyC3NnFTCBpOkOqtxBV//6JdQ0ImJHY0XgLN4PCuM0P4TjSOALT6+rSEe3e8lxjX2IzljR
	c/zSld+FSKnH4r2rBBKXRFrX/gFjMRqqm1N1QpVA52dwyz0Gwu6dxDP3g9ZwbxDW97FVr+K
	DJn9WC0jPskxtKfwA1Lav6uIPtcTnxwnPurN0S8ObmyFDmdkqPRKGicjU9xSe9PLJkTgd4s
	Ymywkk3zy4QXJ4I5gX0rPY2Tk64D5FZkS/LW315htn2s9bu0cMmA1rc9dpal/yXxi5wh7KM
	2B7GfGJGG3EgqDn0WqeNRYOXMDPzpRvmU0eObTx5eh4u280CgBIEgUOEGtZaLqoP7Y7zmEt
	YSwbuUfRjccCA0+27U2qM4lQqhUtV/9HVojlPEJKe6gVodbi1h/qp3eCcNyp48M+D4ggILh
	c5kw6m09OFNZEactsEzc+b57ly6aihBfg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On Sun, Sep 28, 2025 at 04:50:10PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 16:05 Sun 28 Sep     , Troy Mitchell wrote:
> > On Sun, Sep 28, 2025 at 04:00:03PM +0800, Yixun Lan wrote:
> > > Hi Troy,
> > > 
> > > On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > > > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > 
> > > > Add initial device tree support for the MusePi Pro board [1].
> > > > The board is using the SpacemiT K1/M1 SoC.
> > > > 
> > > > The device tree is adapted from the SpacemiT vendor tree [2].
> > > > 
> > > > This minimal device tree enables booting into a serial console with UART
> > > > output and a blinking LED.
> > > > 
> > > > Link:
> > > > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> > > > https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]
> > > > 
> > > same as patch 1
> > > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > ---
> ..[snip]
> > > 
> > > while you are here, I'd suggest to push as many features as possible
> > > instead of this minimal DT, which say - PMU, emmc, ethernet should be ready..
> > > (ethernet is in next, should show up at v6.18-rc1)
> > Good idea.
> > I think I should split these into multiple commits, right?
> > Like, PDMA and EMAC should definitely be two separate commits.
> > 
> IMO, not really necessary, but I wouldn't mind either..
Thanks.
Then I will split them to keep clear.

                        - Troy
> 
> -- 
> Yixun Lan (dlan)
> 
