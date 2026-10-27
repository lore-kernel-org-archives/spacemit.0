Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090594;
	b=TUITPNlRIBYkBD83JPBCgnoca7rt8izrjv4LBv/oFqWOMqAPnlSjNgpe4G/I042RPcEq
	 wXtEymL1W+ZWEOFIKtuFjK+grSrcH7cRcE9SOr0u8IqmBLEp1M35H06NmU5nJnwM0JVYz
	 PTBJD1mq1bht60K0VOP2Fvr9LHJWH6bvsJjpcFXq1D0WoemdCIkinXwd8kII7Mp+imbWS
	 qQz7QoC/ynPCV9a4+ZYLxiVJi1Aw/iBoGg8l/gUgtJYAcQtxMyHFa5bQh5x32NU1mMEhf
	 R1N1YHRVGZAgma64y0T0s4ttxSCH/lAMpwJzoLQVjauk09bqjbsQdwQmqtS6e9ix+CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
	b=sQdcyeOD1ybWwWZRV8KF0C8+8/saN6XjwxOXOlMrgPTKzM1ik0nQWonfx9fm/FFoW4vo
	 Mv7VqoMkxiIM55HO92OspfU1k0jEdPxKF5TxAmwTXzRBrK1eA+4UyvXOiOZvg/fZYYWKj
	 xcoZhV02X/LptjkUOq3G/U3XQOHPWtNLKXmN12W6hjJCNtjoK2xJWIHtrIpCC61GXiS5j
	 tKMwne7Df6n0aOs3s9QbqtsXj6YJqS4Nxy1VqPPUEUIEKwx//tVe/fDuTVCbQo071lGap
	 8Ob2XzG1Zgv6yO6CAnwTwF5nGOCtzzMeloWyayb1JQGU1iM7UgBYMSWpOmA2JKv18QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fPLkclKN;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72659606A31E
	for <spacemit@lists.linux.dev>; Tue, 27 Oct 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72659606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fPLkclKN
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea0efd636dso30997915ad.0
        for <spacemit@lists.linux.dev>; Tue, 27 Oct 2026 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090594; x=1793695394; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=fPLkclKNcMnvP5yNN8u89uTxPKRPxNXeCyX7roTV1u7tpGPlcMn+hSOrd5rfWQahG7
         QgVg7drGUEI+VNuHkuPGd4kzFOJ/cVnnmHJXSxgvSQPX+o2f1VhK0Y19Vm8OI5riAlUc
         HAU8spAEKXvhqo1M6fGSEvkhXfSOsYFqzlKIFgG2tj3wGg8PM32ijpeBOIR2wWpZqoKq
         0FT7VsVzQAkuVsAnhykTD63euR70k7lG+AaT4zVlGZveTvhG/OdFvhV/pQhBWB+xSpkr
         DqcCQuYKMmRxkFQFfQIzlHRElLfL4lQ2DZReoMIPZMc6Mf5lK+xKPfDWbv4KXqkvSbCm
         +0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090594; x=1793695394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=XMSpp9AsNoidPBFmPI22IkAbcmWzn9ai+YqzoZs4t6dX3484kViokZpdrBHVq3FdGD
         Dum3/BVx/QcjyzWW2CmU8r84nWrfhzJ9+X/X3lLPOB0Nd+qhTxU+PHPxACLdzTDt+JbQ
         2LYNOhNhR9xTXtvJak3XYuv8D/QT5EPUxMgbTTGdYYFCqU9TxQ2Oe8YSnL/sc+b/ELb9
         g0Paxc3HJ+5FHX53nvf67eCtLftP/cWcPxM24xrwGOxxqNqX2H5ALOFRqT+uzcRpl36P
         iEvBgpck6HysEB49ioemoEQIMmAQHOmFy8Kki/lb5vk1v2W/dndU6jl6rxt8HF63RpnV
         Uzfg==
X-Forwarded-Encrypted: i=1; AKwUvBwo0qfq1W4UsMYY2/agBr70Kl0xHniZeD/MKKtUpf71jSHNH+luZRlxdrSJs0FgaZUzeK2Ac+DBGg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIQUiXv1hg/VMBmT2HbtpQMGpMfq+eLThf3Jch0dMwZv6741d2s
	Tm3yEdQBcYowO+MZoDl9lDuYYO46cbRyNZeyYgIEZzimCvOnnnkaqKpS
X-Gm-Gg: AYBFou2ObdtijoIVAb7cQ2lT9Q5ihrRZYUhoTel4QUSrP13JaG2yVB4L4MTGePVJx3u
	mmetcfvdkHKAF8Vc2Gp+VWiIdf5qM1Z8QF4MOuCnSslNqCL2uTmzU5bJaRQ4o7SN6z7eYeLwHFx
	Z517JNrqyzqBMQ6OVs501Lc6hDt+gNbx8lC/YI0992tgsh7ccKZZh+KRAyyTpqnFVCNSdIpEFsN
	CFyWYwcSjyOGiT/xHXowfPBCZqP5F5/n1Pj+Rvax7AlHgFqc0e15gzStgeWiE+5FTjf0p12RXcY
	D51e4B8Ga8T9YNdl25QeWWI8GTURpMl/IABrZshCyHPOMnXnRzMW6RY52bNY20hHBWHRak3pkPS
	MChfizrWO5QzROvMX9eT57YhXeLm4RL9Jdl9RFKBfLsNSENBfM6K5Qh9zvnc1vzX+82cHLezQs8
	vYea5c7IBUZs4dd3sDdBwpChuB9EaX2EzCpSd04I5h4OSq8NYoZgcnGP2qJlfMtTPBjo4ezlXsc
	BVJ/Tz72Evj3yErtOOJRsj6z/BTIEh57u9FXaO5xuEk2S3HadazjmYlVWcmGTmabLQhDw5NwnrR
	BbOnWfFVCc3LLTqPCkDAg/Ua9blC
X-Received: by 2002:a17:902:f68c:b0:2ea:cb4f:fd3 with SMTP id d9443c01a7336-2eacb4f10a9mr43735615ad.4.1793090593725;
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c3d17csm5901625ad.53.2026.10.27.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:42:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <auBj4o6t_RyT3wfk@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
 <athuYJjPMkrecGm3@inochi.infowork>
 <atiB7-u5bxJbf-1q@ashevche-desk.local>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atiB7-u5bxJbf-1q@ashevche-desk.local>

On Wed, Oct 21, 2026 at 12:12:15PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 03:51:20PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> > > On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > > +struct k1_pcie_device_data {
> > > > +	const struct dw_pcie_host_ops *host_ops;
> > > > +	const struct dw_pcie_ops *ops;
> > > > +	int (*parse_port)(struct k1_pcie *k1);
> > > > +};
> > > 
> > > Does the "const" here add anything useful?  This patch suggests maybe
> > > not:
> > > 
> > >   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> > 
> > I am not sure whether the compiler can make use it.
> > And I have not seen any explaination for why no reason
> > for that. It is good to have a clarification.
> 
> These const make no sense. First of all, the third one is missing it.
> And I have no idea what would be the proper syntax to add a such. But
> adding a such make it clear that there no sense to have them. Either
> you make the const the whole data type instance on the user level or
> don't do it at all.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Good, I will remove it.

Regards,
Inochi
