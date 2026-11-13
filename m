Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577758;
	b=UzfrGF5xqzQyNjeK54XQWQqnvupRCe39FMODr5cu+4877xwJ/gPyoEkqaqh5nGDMdwB2
	 f7LVb4wUoDuVCyOyDSJsH4c266t4bC6Xan6KaQx2fFBnXvBcF9/ZSvgbpHdUai98Q+4hv
	 slz699vjCz0QIfMdIqJ/k6t4cJjcsNsU/OGLxewUlGwpK3g2IldwO/n2bdaLSdScKk4Vr
	 l++D9WYDkxIpo3/Dbn/lK+6uHKv+xyPAv2/PXv96IXOUAbD20HXtqp4zK+1Cz6x+Jm2LD
	 kxJjQZcdqGtowGOw/YJ7yNH3CP4hZ7NzxtsFrA2o86v3KVzSFtb5L9rjhM4Wg98iDbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
	b=EY9U3H7rQUHoleMhq2yzcDvAoJqJojQeDZTARv38elfwYzn/wUdJzPpLhfDQJ+ewNqyM
	 CadTFw2EyomE10EvM47m0kUVcQxGW1ZbzMJt2gjsIaBTPWJQg//D6Clp/BXwYfZCVo3jT
	 VJKXSUAICLOuMqviD1Z27W5NC1Ui44M4tE37ErmFWnFeEDTi6XBrBZ2lnxs5xQPijBIbH
	 j7E1YXxPfqLS/sK8fm/xZ9wHw8CurKyvRYjBwEZyVx/wS/DGnz6nFiUoaVBdMUpOIBqME
	 biEvrmOc/NCJNoNDop4o94WXRRYl7O8v/nLKVmC4tbyaxe0EXEzMkvpOp+oQbs8o5gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1TiRp0c;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87801606A32E
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 13:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87801606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1TiRp0c
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3712b6d9843so926081eec.1
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794577758; x=1795182558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=L1TiRp0ccqL+FRymNmpPfYw9GaF1bbXJpWJZ9OIGqSlm9HYhdNHWR4zLp30edvN7C/
         1bjcuvqf6+0d58WPPl1aPtdYCfU3YgbMC97LU2SmON1VVM0QAB12IclCaz7XhN5bw58b
         1zPOcz7NkS8bf/pTY0K5MD8fz8evsZMGgqlVaETysKhLo+FQEYtGEJljJvqXJ97MudsN
         6Qk64NYKOnjArmDZTz7S61E/9odO0kX+F1+pheReKY745YIO5ERoyS2QDqvTLoZjPfOQ
         63GW6U01oKE7xcVLh5V3hxcij8CIXB1ETlUrGOE0mlwfdEm/1f4zMvk94PNB45IwJ6Ry
         g9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577758; x=1795182558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=ejl0V1GyUM2JZyZ+bNjlPdaovK+lV1d6Ov1tUrjeoZmHBxHpznem2GtAuqKYLx+feY
         qD4BwP7mzsMiiLC0tAQougWseYVdMB+kQkfObhLFy8bcs0sQ+appIhPHKDI0VjzsS7MK
         VlXF1vOXkwAr/j55Og8NR8OEjFYjaRW6/w9Q5IkROa97+rqoxbrSS8wELuVvOx+EWo2X
         +P6XazG47M0V1tcOvTCDpq/K2DZ1OrUzivMYbcb/IQNMFLLN7ArrJARL7NLl7NJhstZG
         yJPXHI204WpsYwj+s5uJbM+D6kSbfThCcS1B8/N8gkXr5JVx9NsRDRG/s1DdNeLr2IDK
         xaMA==
X-Forwarded-Encrypted: i=1; AL+hErFsn1c0JBBGOjodkxAt6eB02HU6Pnjf4HQdul106xONBtGSuioC2Gm5xHvHXPebr3IgMGfdcjV9zQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8hou1QDhaEoB/E7ryDe4Qecn1jdZhE27KM2xCbFjcgWwqdjcQY
	TOcNLkRVgP4Z7CmWYTsD2YzZAyw6h2FFi5PXMqFk5lriQevi7GvtO+G5
X-Gm-Gg: AYBFou0WjkyXy2veRJ+nZYoVOw2OtBL3jLxY6i/zTFvkUa9F9p1NEVAYorfVzTdlRHT
	H5yUGMPnkVgmVHAcixbe/ruTdQoO77b7VdyyNFTMgJD405XQB7CLtpjLmtoupEkHJIT2c7QX6fo
	MjStbqLBHgzm8rEG1aRLINijPAW1CnyHgLxwOsxbb5/6llnV9A+dit45z25D0JhTXwFbnm1pS03
	say3EWW1qHbSfiA4EAHfok1iPq/7yDdN+MQQIJDwgPfahaIq5IgiyweJxNzngzX9z/X5JQbkCR+
	rd7OH/LYPV44p6pI40yRd33thEUgoZY/8lfgHR3jNI8dmlfMCbEaxOv1x7aw3cxDotsjnZW+CPz
	jUijUOeDjPRodIj6bHE1074T5/vikPpbk9R6tqYG4gIsbhlsJbWd3UEzP1mOljgTr9AFR08EEjE
	KyJbSEauY6ISVwOjHnb7bxLo/ya9/kbR1tZ+/anIGa+oaa4f8Ietg+RGDdeuzoJuvKEwP8EQarl
	+j1rH/jT9fHev7cjU46e3fqgFjtIqahkB4hlP9gfbfYknWGrK+YItqNhsvdN60UvKbIIQ9cpmXB
	V3qqv9+xXuYPsH+h3YK9ENoZiJI5dQ==
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr2170730eec.38.1794577757517;
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm8381252eec.7.2026.11.13.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Date: Fri, 13 Nov 2026 21:49:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <7xzpzkw5qmt3xb3ezo2sii6tnfraetwooh2l6dl4svclvbn43o@uvm7uyhz4bck>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
 <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>
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
In-Reply-To: <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>

On Fri, Nov 06, 2026 at 12:15:54PM +0000, Troy Mitchell wrote:
> On Fri, 6 Nov 2026 14:05:24 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3
> > eFuse controller. These banks contain temperature calibration
> > parameters and other configuration data.
> The rest of the window holds the root key and the SSK, which is why
> only these two banks are exposed. Please say so here and in a comment
> above k3_efuse_keepouts.

I will add this explanation to the commit message and above
k3_efuse_keepouts.

> 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve
> > reads from the snapshot and use keepouts for the remaining register
> > ranges. Keep the AES_WTM clock enabled and its shared reset deasserted
> > while the provider is registered.
> Why keep the clock on? Reads are served from the snapshot and nothing
> touches the hardware after probe.
> 
> Tested on CoM260:
> - clock on only around the snapshot: probe and unbind/bind work, the
>   clock stays off (AES_CLK_RES_CTRL 0x00c30050), same bank 0/7 data.
> - this patch: unbind gates the clock and asserts the reset
>   (0x00c30070 -> 0x00c30040), rebind reads the same data.
> - this patch: 3s of WTM_RST or of clock gating leaves the shadow
>   values and FUSE_READY unchanged.

I will disable the clock after taking the snapshot, before registering
NVMEM. It only needs to be enabled while accessing the hardware in probe.

> 
> [...]
> >
> > +	depends on COMMON_CLK && RESET_CONTROLLER
> Not needed, both APIs have stubs.

I will remove these dependencies.

> 
> [...]
> >
> > +#define K3_EFUSE_REG_SIZE		0x400
> > +#define K3_EFUSE_BANK_SIZE		0x20
> > +#define K3_EFUSE_BANK0_OFFSET	0x104
> > +#define K3_EFUSE_BANK7_OFFSET	0x190
> Nit: the last two are not aligned with the others.

I will align them with the other definitions.

> 
> [...]
> >
> > +	if (resource_size(res) != K3_EFUSE_REG_SIZE ||
> > +	    res->start % sizeof(u32))
> No need to validate DT here. Drop it and use
> devm_platform_ioremap_resource().

I will drop the resource checks and use devm_platform_ioremap_resource().

> 
> [...]
> >
> > +	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
> This asserts the reset on unbind, rmmod and probe failure. The fuse
> data survives, but WTM_RST resets the whole GEU (FUSE_SCLK_DIV_CNTR
> went back to its boot value). The driver does not need the block after
> the snapshot, so use devm_reset_control_get_shared() and only
> deassert it.

I will use devm_reset_control_get_shared() followed by an explicit
reset_control_deassert(), leaving the shared reset deasserted on teardown.

> 
> [...]
> >
> > +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> [...]
> > +			put_unaligned_le32(val, efuse->data[bank] + i);
> Please poll FUSE_READY (GEU_FUSE_STATUS bit 1, offset 0x184) before
> taking the snapshot, and fail the probe if it never sets.

As you clarified, the automatic shadow load at power-on does not set
FUSE_READY; it is only set after a software-triggered reload. I will
trigger a reload through GEU_CONFIG bit 22 before polling READY, and
fail probe if the poll times out.

I tested this sequence on my COM260 Kit: probe succeeds and both banks
match the data read with v1.

Thanks,
Jiayu Du


