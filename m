Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575630;
	b=bttQ2AgeH4BpJ3UFqYLAcdb1lChVj5//kBVgrbrNjY9A/dA8T+vhMTIGkMKqqAVCeHp2
	 Ne+xnBJlYedAUA3SG4HCLP0UDTzR+uA2fAugqBhiO3LTY4je8aeJkG2ez24txCChXzVGJ
	 cv/hDPD5a8g//EWCBYlJ+8eDtil/YaA9ApALBlTVM3wTv6Nhp7QJItPC033VOyhCFf0RU
	 VYcKnDv2IlCjZA++nvGZGVTk++nJZoJbyQdKLTvhIrTTK4wNr82SbvZ/9tR4/5yK14ru0
	 AeXHSSJ3qC7OcvAeHQkKiYUoDKYGt8n+zPsVTLJiYyIsDoAy0rP0SoOQsU2n/w/r3gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
	b=4hRl019DPnFuEhgTxulvEjNsI0fDNfQg2kc5UOQx5mPt6AsnwJ2Q5iq9vq1EzP9bEowF
	 0YVMrLvbpbAeUcOOdr1F0QHaKuLUVlZC4ljLIkk8A23V4GGSN0MQBQSgxUmo0Yei4X85W
	 kTxy+SLXQe8J/WVntGq9nlVSOTDREls9TEbmpgy3hXiBFrHZ+q/LZtohfS+ZdRt+KVEpU
	 0vAknXQ/U5JAYFbegO28GPXSDFKrtJFcgf69Eg0D4JpLPKw4k3JHBlLB5CwLCiZYWqnFI
	 LwQcyX7CXptDdyFGdYIxKU2R2coWP2ZWLrr+GNi8qu9a6n+3YRSH9jTD16RIyzjx3iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ufoz27QL;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D081F606A327
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 13:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D081F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ufoz27QL
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37071c0f42aso1386743eec.0
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575629; x=1795180429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
        b=Ufoz27QLJb9C+IJmufeQ5CuYmtwv1fcxJufO9fE8HmuFdzxC4KnfGbCCvvttMMLVFR
         pokAjHIyYUxdKtP07xm+ulf7WrJnSnzeXVjUmEwznIiBdCdMcEuPP+QAposvjP2aKLCu
         78AT7Qw5OJlPsfWXB899VG2VOLVCOk3f54WgkDLF5sXGT3avpZqSlsGGxmyzqYhtiqiQ
         Igl8pMoZF3dtaTDTg4LP5irwPD45mLz1PUohOtg6qHEhSgc+75CKLTc4WHAe7N5ZMAw+
         7GDo/au6iSvDQo0vMNbDe/TDDW+y810EHdrrAb/W2fpVXITE0xi0bFB3bHDq1ntPoubK
         i+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575629; x=1795180429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
        b=fyjwyQzMwwbIWHBWg2+hJxSIAVv8EWmFac1h0zRcDObxBXn1J8d+mapMobxbon/0C5
         SJfjqSBVXt/6rqE2cacZRv6ajZyZMKG0V3/b9MG+4WQWZai+S9zOzDhKJ8o0BW3lQEpB
         GGbjcQp4JPnt8uCMtNEa8s3lJYQT6wfPZdiCbUGZpSY3T5mn1LOjkclJ7Rxq9xr7BgkP
         K0s58s4AnoAzajI2FBQ38obLtdrdrw/eVb0NfLo7yXFZ0caPPZf1yrvUkgBVoQsMlkWe
         +BiE2vA5HoKiwXON4Z3PEBrZoLZGlZCsgViauCJ/BARjwPotvMS4+XcAEKbqj3iqUgBn
         Ij6A==
X-Forwarded-Encrypted: i=1; AL+hErE8GRkIdD8Xs+qLwtKpvJ3s068C8cPre7FdI2LzJvYKdY0aecJJFdxVHCHIUvbO14wqs8AY5CYRaA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VQPP6OrP6c+lTqApGqEMSfn5abVlQNKKTCduPdRV5hNj/cHTW
	FWGQqfMyy2V5+Igwo8PFKhneCWwBAifPf4YYB/gFvf0qQqhWVpp9XDHz
X-Gm-Gg: AYBFou1IFR7x1OFN9XjaFFkjyWmVbOqj4KMEZ5B9bhlwZ4vyeFgHD350AyLl6mXaO7j
	EFXqUarKbjjpnxHiT9Mf9nJ5dDfo60hnBacUve5GE22LlHC2g6D1s+MgJUlCcdPx/01vzgJngKk
	sWqYgjjOOZEFildS7mGshbjf07Boh3Ibnq/2tSSnbyEnwSF66TRcnLFoBCwHk5qgkQyhxUTrer/
	sV4wssC/zoMNruqf3f89epL8mdQ4ZIMLDDV52pS6md9/XFkvyxojk4lXv5sFdKxRVbAcOmdNsWG
	3TwZRWHmt1PGpWdZOGShZMRlhkkMqDtVBU2YLGDWGV8FIQXQxrZp95YQmnggEF7DjG4gDEWBpA4
	inxS2rKcGsYhKqjgVPZnW6tSMrxGgguIB2k/EMAbD3tXi2+hE5iZbvP4HQaamEo+mNMCnmwXa21
	3MFIiCxp8A41UKTQPYV6om2P+Uy/QPI2bOITVyH6XqZYEYDBnvQtXH3pUOy1HwE5YVKH1yfKYB9
	I3AKwuiuxYFo02oCkr3FExT+sJS3HrIJOnPCeDkEapYas4gqz7pM6DmcFG9BwQex4lk+NUGAgD1
	EzOWObuEdr8DaNiOvlTauroGYaeJ0Q==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr1777573eec.30.1794575628817;
        Fri, 13 Nov 2026 05:13:48 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm7834718eec.29.2026.11.13.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:13:48 -0800 (PST)
Date: Fri, 13 Nov 2026 21:13:38 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Yao Zi <me@ziyao.cc>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <zya3wt4zziflg25y6grnvfcbfa6mnetn4o5c2khj2cii2wh7s6@ymjmxqyn37ks>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
 <au6niF5xiqj7cqJ4@pie>
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
In-Reply-To: <au6niF5xiqj7cqJ4@pie>

On Sat, Nov 07, 2026 at 04:22:32AM +0000, Yao Zi wrote:
> On Fri, Nov 06, 2026 at 02:05:24PM +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > Keep the AES_WTM clock enabled and its shared reset deasserted while the
> > provider is registered.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  14 +++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
> >  4 files changed, 167 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> ...
> 
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index d2f5bb236663..28d6c59fbd74 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called nvmem-snvs-lpgpr.
> >  
> > +config NVMEM_SPACEMIT_K3_EFUSE
> > +	tristate "SpacemiT K3 eFuse support"
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	depends on OF && HAS_IOMEM
> > +	depends on COMMON_CLK && RESET_CONTROLLER
> > +	help
> > +	  Say Y here to read configuration and calibration data from the
> > +	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
> > +	  the shadow registers before Linux starts. Programming and reloading
> > +	  the fuses are not supported.
> 
> I didn't read K3's TRM, but is there a reason to depend on the
> bootloader to do so? We should depend on the state set up by bootloaders
> as less as possible, I think.

The Kconfig wording was incorrect: GEU loads the shadow registers in
hardware when it leaves reset. I will remove that requirement from the
help text. For the READY check requested by Troy, I will also trigger a
software reload in probe, since READY is only set after a software reload.


> > +	  This driver can also be built as a module. If so, the module will
> > +	  be called spacemit-k3-efuse.
> > +
> 
> ...
> 
> > diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
> > new file mode 100644
> > index 000000000000..d106053beae8
> > --- /dev/null
> > +++ b/drivers/nvmem/spacemit-k3-efuse.c
> 
> ...
> 
> > +static int k3_efuse_probe(struct platform_device *pdev)
> > +{
> 
> ...
> 
> > +	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
> > +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> > +			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i);
> > +
> > +			put_unaligned_le32(val, efuse->data[bank] + i);
> 
> Does memcpy_fromio() works for the device? Otherwise, you could define
> efuse->data as an array of u32 instead of u8, so it keeps aligned and
> you could do a simple assignment here. Reading from efuse->data is
> always ok since memcpy() is used.

I will use your aligned-array alternative to preserve 32-bit MMIO reads.
The cache will be an __le32 array filled with cpu_to_le32(readl(...));
the read callback will keep using memcpy() with byte offsets.

Best regards,
Jiayu Du

> 
> > +		}
> > +	}
> 
> Regards,
> Yao Zi
