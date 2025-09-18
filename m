Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB232EA476
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758181502; cv=none; b=CCO/q8geJGTu301gKb+W/bM107E3RYb0upVnVJEdRJd+GRskYMfw5KWeuc/UHm1gSjFW4yULfYZSmRoKqw1U1FOEt1Oxpk6BlgxN5rlgyXjyMYC5bttjpDjwDDN/9lH2p5DoMExrRu3u7azYmlrBlHtfs1b1ftR/vVTqWY/glsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758181502; c=relaxed/simple;
	bh=dmM/nfY9ZGJWZNd9QVwh8AdV4xV1NZFaRSTZnw0XJTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIz6d7+2Js2QfMT0JnzYJb+fOKF4w6HvOxabWe7otQRkB1Zjs6DsosjfGxMb1kOUOPQGDmMwOprcN/Pz+YHq1y1R1/70OQsFy6Gg02t5oxtbcYB/notQpIzewdXaCGcC/qVjb595kaUuutKL6npSZVM8rdtXH7zz6PEgd5rOZI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lQ5R+OFT; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lQ5R+OFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758181418;
	bh=fKIhYdZo0gbuLJoLY01IaGGDghYLeBAKJXGGD1WoNs4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lQ5R+OFT5MufPI+DsRqXbxo4lmoOugWOwnv3uLEDkGeKmpsDSwhelcatAEHS4msrl
	 S4ZHBEcJrfSOCuvU7dSunwHfE7Mcryb3yLhAO3M1jNtZq0Yq+11c/R5HIKepgs3kC+
	 HYqJG/f+Y7X0i0mJqiQBdveHGFlZBxGWxioGZCrs=
X-QQ-mid: esmtpsz11t1758181409t25a73e83
X-QQ-Originating-IP: TBFWLYNJiVsLazlBh4iNqndLkAwUI57Zz+YC92McJmE=
Received: from = ( [120.239.196.247])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Sep 2025 15:43:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8956593677624534324
EX-QQ-RecipientCnt: 17
Date: Thu, 18 Sep 2025 15:43:27 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <D2A109C6A8BDED08+aMu4H4xap2GSP50w@LT-Guozexi>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918001632-GYA1270371@gentoo.org>
 <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N3IC8um5pMyYh9hNCJhfVMgQzafTi66x7ya2/T3wzdUewhjfc1OAztkM
	tIRCcQMR2rSrteZ3Oc36tJ/zxmpnE5p7p04Hk4xSksEObthnpA3l9A0kLPduujAWKui3KAN
	shfpfMmRQnXiNEKIh0NaQiLAKjwBp7NB2s3A935HOqUNhdB0mu/3VM/O4+gMLa9UxAwVCjn
	ZCckIu1XKoejlseCJvPk/j4MhzKSQB/gMfm0CEUiYYQBM9q0gZUKbztDQz8G7yoOiNhhw01
	+d0m9JP+eM4G+JesT6tzMuXb05ELwnWW1fkBD6OcafZt7Dxe5tJjG7izZ+dq1wXDXe5I1PQ
	0jmMZAGkGqmbzvSOeDR0vhICAaYN/oiXgbhR0/vUl4wwQe9BBcY21w9vefSPHGBl9T4Z1bT
	dq4SY0djEa/3mcdir5+IT2K+hmtNgpyYpBGAuCtiZZ6+ZZN4zxfBUDKqHS9iZ02n+/d8D42
	hCu39Q9oKFHsMfAoevwulqT/2qpXH2hGUgCBzr1rh9vvYo7HK1iN6iCpdRinHwTsQ8CfrDZ
	TChdygCQBcdCBrwKyOQ0DFaczDQtIgSz6/RLcjtGV0RXYeuJcIlU5IlqRmP6dhhDxK9RJap
	qeP7r1CtQSP/uzmHV/ZVhhezovrqhtSPiYDz7oP/EfJMLDpTpGT2YltLraiUC9s+WogEkpI
	86KXuHvhjZ4C9Bw6P/J76Twc1Acv93FEpu85nUA5KpM57Hq7OZukCNIuy9RL7Y7yDnYgPtx
	NafO1JKORGKGgSD728DJlpPUG3IBBGPBeRtX3rv6ekspP7ZKK3TL9gTbC2KyEiEgb7qMZmO
	dZTBinxL39HKArkc9bP16ICrxFIuclaK2S1g67idHwYAgBI5YndbAbjVgOCrKmSY9ogf0C3
	2TD26NdGvLqa+cpKJH0f5Uqj2XKHtwONK9/mj4xT9SBhpcZ4vjwIFdl4GLQU2hsDN7yAwaH
	DQIE4fhbqsIXhnvh+kGtJAHtNe5QUq9wTDofhdRJwcB3wQUKXog5/y5F60N9ZohUT19iJgz
	Ou6mv+IRs7ckp/gId5+QZ/96MaaSK95DaAGI6k7aTWh+85OVNaPeHjw4qrnXA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Wed, Sep 17, 2025 at 09:59:35PM -0500, Alex Elder wrote:
> On 9/17/25 7:16 PM, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 18:40 Wed 17 Sep     , Alex Elder wrote:
> > > On 9/17/25 6:15 PM, Yixun Lan wrote:
> > > > Hi Alex,
> > > > 
> > > > On 17:07 Wed 17 Sep     , Alex Elder wrote:
> > > > > Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> > > > > 
> > > > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > > > ---
> > > > >    .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
> > > > >    1 file changed, 94 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000..5abd4fe268da9
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > ..
> > > > > +
> > > > > +  spacemit,k1-ssp-id:
> > > > > +    description: SPI controller number
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > could you explain a little bit why this vendor specific property should
> > > > be introduced? I took a look at the code, and didn't get the reason
> > > > behind.. or what's the problem of simply using "pdev->id"?
> > > 
> > > This property was carried over from the vendor code.  It is
> > inherit from vendor code isn't a valid reason
> > 
> > > optional, and if it isn't specified, the platform device ID (-1)
> > > will be used.  It's just intended to provide a well-defined ID
> > > for a particular SPI controller.
> > > 
> > while looking at the code, it seems you can use alias to map specific id
> > to the spi controller, it even can do non-linear map, something like
> > 	spi0 = &spi3;
> I've never used this before, but yes, it looks like it's exactly
> what I want.  I'll just get rid of the "spacemit,k1-ssp-id" DT
> property entirely.  Easy.
> 
> > plese check of_alias_get_id()
> > 
> > note, I haven't actually verified on board, just look through the code
This is the right API that Alex what to use.
I have verified it in i2c driver.

                - Troy

> > 
> > > > we should really be careful to introduce vendor specific property..
> > > 
> > > If there were a standard way of doing this I'd love to use it.
> 
> Looks like you have told me the standard way of doing this.
> 
> Thank you.
> 
> 					-Alex
> 
> > > 
> > > And if it isn't necessary, please just explain to me why.  I
> > > have no problem removing it.
> > > 
> > on the opposite, please have explicit good reason to introduce vendor
> > speifici property, and if there is generic way, then we shouldn't do it
> > 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
