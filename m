Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596692;
	b=DY6vRdAil4qB4pCsVpvFukmNHRyn6HRdvizOSEOyvmP9LW/ibA6r1+7CRp2elHkfjPSB
	 UKSh98FyMxLKN0D9BFrGO/6VBJofncmEpE5pyxuL1kk40gAVw4oJHRP6JT0CmU/bHhlj/
	 8IqhrlB3+PJfQwI1tI5/IWGkZOIgcCZ+s6cfwlxQcWQd/xaCdVKTSIWogSScbQhXaTZl2
	 8M6fqjIIrPO/WefJbfJ3WIc28BHiKJwEGNfxsZeq0jZEzXpjq7IW/3qqz30ZgwhJBSaut
	 oMzTBXYBC6wrgIKrQMO0EgULmh7JNQGbsUl/D+rQiLfVytETqKSQqP93//3wlCqr3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
	b=Hi30EsNz08qX/Ivpnxniv1HJkntrSPXoM61H7Dxye5tRaoaw3Md5HsgTxrx5a1fxZAJz
	 vKa7D2Jnh5SV97D0ma6CVyGmwdOvR83pj9mOitYjL9YVr9AE7LDlRLQH4WzhnDZ00vFWS
	 o1+MMWYQcnqRhx5ldixNmWlYVUaFTZcojObHWQM8s2hspoKN33McpA76tleWFOVTZ6i11
	 iWzbtxXpORUdDoDjeXzUBAbfyqj8ebFu8k2ZVXgvZBVkxxnHFfIZ7sjFM7qfRCAxK8yo6
	 3VsbG+KBak2NvqKf9xu3Opn4YV5AwB44RKrZu4Crau6NaN3D7TM9QVjoalNJSumoNog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6aq88g3;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509CA606A327
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 08:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509CA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6aq88g3
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso2868240a91.3
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 00:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596692; x=1796201492; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=F6aq88g3vaw2uK9g0ECnO7YB32Yg24mHdwfLolYho9qmUUldYi+q++qSvZhRvLU1U5
         IF8cKEHD4sQf9zGuK/9FpEdSQ25bihuY1nv0gyB17sGd5BnGHkjYXFX244/OJYTGEKKP
         jELw9fdUbdW2a8S8IfCJGB22BM/q0ECaDrYytfSlA46cs/pgy6h/FdYiSdmJ6d0XpJKO
         vAzfNmcZmNHtq8+nyB5cSZViu6QAATfIKleqOs07S+TuqkWIZyA2azpV328Z0J15NnD5
         hvuc5CvZJhzhFL1G910UMOhLfk1CU3G92ITLYiHuTFmk9iuP/EUOTHYjEjOffoWST5bz
         D98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596692; x=1796201492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=1gJaf4YAK4ZGcUFidOjhcx9guwwwP2BKGJPxz1TGp3b6JaGqLyVTWCFKTLmfIiAwQo
         /kHRpkyNYNrRHztwA093Hv2QQBENEP+1cC7MpS7i3uPjAtefMp6P9EHU58r52XIW9t7F
         Fry+Wmur3WvGJSJa4cnWLVMpk/LERWEM7FRcTaFJttTtc/igppwNuZH+XFvTTql1qU5W
         3XTf8XIqYSycNPiV2yd+0dsbENERVfeXybXSm5iIvkMyTVenp3r/s4EvGwW3uyGQLHiy
         QBVYOs2xg7w5ibyo5qP8Elmjug+jxbux4WInbJ7jJxvJmLIu3g050v5JaWtmWgQZSJQE
         PsdQ==
X-Forwarded-Encrypted: i=1; AL+hErFNceOItv2iPYfdAes2wNCqAUQrOEK5ZvLKt74XS02zfMDLHga67czLqUe8YJn17i+pLUR9WXGGtQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZKJ+KpOXXCoYnqHXO0xahNylE23ZwXSSvYl9h+GVgiKx75Ajl
	ZZHj6+y+p6Z5DFGF2bELeQA2cXjs/1iXmezaDhuOgRl8MtfFlZ1i0Hzx
X-Gm-Gg: AZFdTZdb0BhapuAcSeEN8kxaszscVAk4R/NM/mV9a0S8g7XKBreAIfoqSSb+XycACFV
	26B09nV7DDMoMw41kDQdMrMbzP7BpFcOYYyCDEv5gvQW52uTrHs4uAhYjpu1FHkoGZu8MmDZFEw
	tS1kcnWWfXJ4U8ZZXYGA6g5496Z6WdgElTQhnLz/btw0KLh/u9zvmPDzqVG66fxMDsvBknjyIii
	hyiEyHsuQxOz33UfsiyZE0YgqMqfCG8NTpsxkJeFg9dUx3lBUT2VS/E6mby2tk5G5v/7GTRQSec
	mfMIllnlRnHiQQ68u1he/koRYXvAvr9DJNISPEewwaz70ve1fJLoCnjnaB/jqRBEWUPznSY0RS2
	u4AU5yXAeWU/xTnQET59m/dPO55E/ruIHtbr+vu6yuKWan5+EJoOIK4d1YC8PbKDzKQRnw722Dp
	NyELEdJsTH5A+9Ay3tC51gXcYs1imP6Zql0UJ3Ec99ITfiTt04gvbCudLJ4xKk13lbC9sqA4del
	O7wBuzneRl+MfdJfN1G3gxt/N7yJd3Fm00RHC8mMCJy1OjyaOlloGumwh5RMV5P5ZOv07p+Z2yd
	RQxJxHk+pRKmwtnAgpuoKfGl3Q==
X-Received: by 2002:a17:90b:55c5:b0:3b4:5b2c:2959 with SMTP id 98e67ed59e1d1-3b45b2c29b9mr11827069a91.63.1795596691606;
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm26632567a91.11.2026.11.25.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Date: Wed, 25 Nov 2026 16:50:47 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <kahf2gbctnhtwngvtwkz7nxg2th2ecisdte66p2m7ukqup7jsj@7tmya5uxzg6o>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <awYHAU239WMaqVKk@aurel32.net>
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
In-Reply-To: <awYHAU239WMaqVKk@aurel32.net>

On Tue, Nov 24, 2026 at 10:52:01PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
> >  4 files changed, 218 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> Thanks for this new version. I confirm the nvmem format is now much more 
> intelligible. The content for banks 0 and 7 matches what is reported by 
> the vendor driver under Bianbu. Therefore:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Hi Aurelien,

Thanks for testing and comparing the data with the vendor driver.
I'll include your Tested-by in v4.

Best regards,
Jiayu Du

