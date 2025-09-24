Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF45464F
	for <spacemit@lists.linux.dev>; Wed, 24 Sep 2025 03:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758683739; cv=none; b=dAV2VFlzxpHpSTcVn2S2pUpztlDGGwNNtcNcAnpQ9QzcDubtsMjepL94YZt6L8NtkHsiSV5KOcA6CYqfiu/47bRwuNzBwjQTVBLFCf1aTrZrTCnWDxK+ZZHiLsppAFRM9WMygAj8KR8CTjTsg1AKP8sfkM+4BtAO5Mqz5luG7bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758683739; c=relaxed/simple;
	bh=J7cjqqmGmaZOUF2MR4huwKNqe4ctVzq9atEsqXRsgSw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgT29i0rEIKLl8NA4DE1s7IlyzbhGmUnjosp8XZM1163Sknuv4J9o+ZNJXP4WEm1uhBIfFwxiE14t0bwhhA6BZmuRnq256unB6Zbk7QDf0C58kkaL/YAjqj81JmVeCfyj+EV2RQ9VeasfjP6qZ2xWaxPv5OlLf/nc6o/1yox7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=i31XGKBc; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="i31XGKBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758683654;
	bh=8plg955rJ+oOWjx5qksQHnCtK++GUsWnoWgH1rOaedc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=i31XGKBcdUc2+aJzLjvMwcWNiQ7RzeRjQiXJB0ooLaDkX/HjQnX/5KmUh474PkisD
	 hM02dLxQ/uo6N4dtiTRRhXKODSSqIV83qMA+SEO2EwybSbDlK5vq/8mEtQXIRpAWvP
	 S/gSCJtN4o9/gtcuRaaZP0Vfgnn3+Vx+guqDgUIg=
X-QQ-mid: zesmtpip3t1758683646tf49888df
X-QQ-Originating-IP: 1MO73cqQ/QgVrFm41SIJypanScGWd08wL3EKzL6AuWc=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Sep 2025 11:14:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13436328211902165598
EX-QQ-RecipientCnt: 13
Date: Wed, 24 Sep 2025 11:13:58 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: enable the i2c2 adapter on
 BPI-F3
Message-ID: <B8749086963B3B54+aNNh9hw4TX6tVMdP@troy-wujie14pro-arch>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-2-aurelien@aurel32.net>
 <DC360EB139FD9DE5+aNH4l-7SP5KNu-Br@LT-Guozexi>
 <aNLyIvS-UFfplmpu@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNLyIvS-UFfplmpu@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MgB4ni1IX5Y9ALYggmJdGYrH1DHAIpfbME/uYuvFfGhmzWVrTEirSK5J
	CH6O6YsgFgpKsRKLA/S51Q0rxFlb/h3xrp9QSmiH9aMHCZJpXb22eNvIUdO+rAUOynGbFbP
	esMDq9+KETaDyPI9Kh9oVK+7T6/OIlH8gVZNQVM4cMQGmboYw0xvkevH/zF7OyknE164vtB
	vLVIop1KR4AqylEocMDcpXjpfKMwkt8lTsWSO5Lcpf5kS/KpNexkWsuyiN+zAruNslf+ENQ
	0aB6rnYPKWIBlSfZcA9OCtvwuOmmJL6QqThLuAzU9r8NFo9YTCnXZoOCPq7extdg8/kIYrB
	yeJ7jlSIEx5PnZsy62DZaI4Jz9JAIvHeq7V1UPKfcWmV1LQ9qzQ+JdTKovAFTxdzyjf+B0W
	U3Q9lhbklijjNy0DzH39vhMUCX8k8d4Qc5mGhHKuUOOFM90dtTgA4KYuhl/jLtsnPepcn6c
	gjYe8tEd0bh2cA4xhCHeLaNbWTlkfh3b82rWCVRQztppyQTV+OMtAKBON3tORu2wPAs4/no
	leJ+ED2K55NmCD4VCwLweohiUi1m3KPlce1CXDB1PpEcJ6JUN/zEGnM5heRgpt9vTRQE3hW
	rP/aKtrnM09MlgKeXSVziVtVnD/NLwZzvDN/Go8SqaFI3EJ2XVPaFfVq8MtE0ntmg7ndOb1
	iSgkmyBseIobZzlSUnyEpZEMngdxLvqamCB3S9pCgqCgGEP7ev0xq7Zz8NQUIls5BWO1v3L
	2xgt9XkW0eoAN5cpQ0ablZnttCUFv7t+i8XP9OjY7/t5UztQn85oGKftojWx1bqTHROVlFE
	a0mxWK2yR5Bwo/dYjPBnrisJ3rtoQdModNgWuGdhhCkD/nvIMRu1S74s4XG+GE6uYM0JMCy
	AIqU3Pg/7AQ16/+Wty43ASHMof9NnyMdNHqgy2coRFatx44pJ3lLBHBpI0TggiX+rhPtq+O
	J0699e+8yZ+vuYQXSJlRCtocH+dVRlQ0aDWBikX9nFwmHcACjaJp+vsu7mi9TacM6iUoAVi
	SJGiAg+lVwv6ksq5RLzHmQJIVSvIcRehNW6uLWAVB3pGgqnW6hOQORMxQbAF/omkuEFoQOt
	3CGuXq5V8uK+B9x1mSCzODHabQIcwF26Q==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Tue, Sep 23, 2025 at 09:16:50PM +0200, Aurelien Jarno wrote:
> Hi Troy,
> 
> Thanks for the review.
> 
> On 2025-09-23 09:32, Troy Mitchell wrote:
> > On Sun, Sep 21, 2025 at 11:01:41PM +0200, Aurelien Jarno wrote:
> > > Define properties for the I2C adapter, and enable it on the BPI-F3. It
> > > will be used by the 24c02 eeprom.
> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > @@ -92,6 +92,13 @@ gmac1-pins {
> > >  		};
> > >  	};
> > >  
> > > +	i2c2_0_cfg: i2c2-0-cfg {
> > Should this be i2c2_4_cfg here?
> > From what I see, in the initial version the second cell was meant
> > to be the function number rather than the serial index.
> 
> Ok, I wasn't aware of that convention, I just reused the same numbering 
> of the downstream 6.6 kernel. I'll fix that and use i2c2_4_cfg.
I'm wrong..
The second number isn't function number.
You can find a more detailed discussion here:
(riscv: dts: spacemit: define a SPI controller node)

                - Troy
> 
> > It looks like the pwm part is also incorrect.
> 
> Yes, and also the submitted PCIE patches.
> 
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 
