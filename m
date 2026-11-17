Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918144;
	b=zbLVk2xEHiC6nzsNbAkvGZjJJ0PCwO84vRbwuLf5k2Eb+FyMgf4PAuM4Wszju1w7vQ5e
	 Ha8fDo+MkweScKeIMf1FalavYQR6zAJ10rTVcCauCrwH8Z68jXdA187h4tqKph+qftGoH
	 VjNHqLwpgGkjzPHguxT7rAktzkF+I8r3KTBWbBse2feb+Y1MhsnaZDUdqqG0/KfhtXCV0
	 qr76LFpmYxN6BXKPoj2T4PXGIUk3w4KESoRd9mRc1p1hNiBYUkpQ37Dye6OsvCKQ4C1Qc
	 dKK5AHQ++wMdZw3BHNkr/gXUTIfcq2awjk5sjE3P4kaat29OMK9ZV3IS4LIy2wtrNOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
	b=gx933xmLBNTjKAROuivVPHfhJu8/XvjTZnoj5k/8t+DcYAwVIaZdSWU8MQwXSQj68tmq
	 biRZLeLOKStSbyE/tM6e4V6ph2zKXZb2CyGFo6coHEja+wEPufbB653wCUwO1WlVmvDEh
	 lEEw4Gw6uvMOzj4UGjNTmn8iWie8/i7wHE5h2gD6Ez4WkM7EgYfxbBShXu/tX+AdccgOM
	 mRLF5zwme5I8ueQrMUreTdzXtf6fmKEJYcOocr/tiRpYRVpIEy+QPoMpwzQtqzEk0PaVv
	 thQT4XiD1wKe6PYCMulaUPnelADTfUx5h1BoWFqmiosvW2L6AZWYQJwHTFuglWafGFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPOvoTLo;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A3606A329
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 12:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238A3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPOvoTLo
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d7791b00so45720165ad.0
        for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 04:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918143; x=1795522943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=EPOvoTLomESwBRmwLTPSjnEH5Qawwg50wmOn3yB6WRBRcWUTGXjZZ057r5+uPGjmtt
         A43Kg6tie/ZyvsWzUtvTNI7A1dgNEW9LD6w6AIDGrRYNWqiFu2I/UzIrSb6bzrNgAtwV
         TunYKsM3l6QEl3GaikuIdKpzjC/prkVahhDBO+B37WFYqj9Xcm4WdMJtkcHymRJpNQNA
         fLyOPmbDYOvcdpNjBjjFo8FkhkedtRyTSsomPFRhCpGjrWc2PStMSoxvASQShwZkW75T
         gqd8ZBkuKcTZ5lsZfsVJ94AfXFALZa9zHV8KCy/BUQ40MgHo96lvcipPRBk1tkHQskti
         1GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918143; x=1795522943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=QHyHzGH0N8byvN2NvrB6f5/FF4JBprQByu0TDJxJxz0DSMla4h7oCF0Rs9RnQDk7jT
         MMV5aHfeybgKVMQl3UWb9UynJ+UX6PVGW+dLidnu37tQgloOtdbBlvbAkbs1wHMHM0WU
         GDchduL9HIm9ADqnYqHdEFuKi3gt9qFoS4xq7HnzOjr+pjnuenan5ShE6icoF/U0lg4x
         +jKH4x6D1BsPoV02RRxisv6BeJKA/X1vtdLaY1+mCvT1O9YZdjfxfqojKj1qVjuwmiW4
         RpzJWdeTev8GT0c7omEH2oII5Ks5Np45l9zsbFrUx9VDHbboXfx8o0HfNXoctVtis2vG
         OBPQ==
X-Forwarded-Encrypted: i=1; AL+hErFUsTe172WywGhFx1Oa6kPEhSYx4cVnxQZaeMrwR6thkodByWqHE/PyA6xq7YFVm19PHmLRAukr2g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/W8wlrnmvXWp3PToKe7IkVagetSnW3F0F236tzG1z76f5dRUZe
	drVs98F55YSB5Jo8YVTAUFneNXoTk6Gw97+KFYrd4SFr0+RRzVfJjTIr
X-Gm-Gg: AZFdTZef1ngERXCN71T0BcZJr3zJQzVrcw5ZaSTZQHPxekodTgBVblkUxODBkfbfmDE
	9wkt9DMFLiMXJ1N/oajKmdgDHe8i38R3Fpnta4wLNKdkeKNx8kyX2yvDr7qQ9MkStRt6SX03TUu
	M7m1NYQ2Hjyweh2trqvIb5cl2LcJxzylSduLj7Rg1ZulvLFUk4zlBDOPv8y0BHmC/PkEzdeMI50
	fq0tyfqZduePPRVgTBZobauL9DeIBm00bzXqAr+hq/3bPfttJIjxa0+UE11FLOSEHQQLIr5A4B6
	bRG4EQylurcaKWW6UARkaUnDcXEA7vK+RPAyi55VcTXV8KT+CaU/ODwuyo8BKvUA+IDNxDx51z8
	b/1ep6habJIEZp9Zdem3HZjJWIRTsy+cUSpG5+vGTiajJuv6c1XEjCX64GahrBmhLWjwVgpJOaF
	7KYmnpgrQ4dztAK6FMPugOqFFKe02b8chXv+9+1yOCCPU5nMYfj3OuYXVpRM26jOxBdFud5qwpT
	a7lh+wCFWV4rWg2T0eBpdwLCxulKWUhxqtri2ZZ/YC396j2H2X2F0W9U6QUqoAG+9nKJrGjjAFU
	4i3rndhhYsljj8U9ZIE7LMJqukRl
X-Received: by 2002:a17:902:c40a:b0:2e9:5059:4468 with SMTP id d9443c01a7336-2ee0d664b4emr129370335ad.7.1794918143343;
        Tue, 17 Nov 2026 04:22:23 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d86a1sm14701045ad.8.2026.11.17.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:22:22 -0800 (PST)
Date: Tue, 17 Nov 2026 20:22:15 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	aurelien@aurel32.net, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <gwtbssramb3rnp7dgqxm5fu6ywkn2h2jigdh5dvj5fvtv7rktk@upytexvwkjaq>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>
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
In-Reply-To: <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>

On Mon, Nov 16, 2026 at 12:54:42PM +0100, Philipp Zabel wrote:
> On Mo, 2026-11-16 at 15:54 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> 
> I don't understand this, possibly because I don't know what GEU is.
> 
> What is this reset shared with, and why exactly does the reset need to
> stay deasserted?

GEU stands for Generic Encryption and Fuse Unit. This reset is not
shared with another consumer and only resets the controller state.
My explanation about needing to keep it deasserted was incorrect.

For v3, I've switched to devm_reset_control_get_exclusive_deasserted()
and removed that explanation. The reset is now asserted on driver
detach or a subsequent probe failure.

Best regards
Jiayu Du

> 
> regards
> Philipp
