Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438036;
	b=hQpb9Aa0oBdO0JgzjRX/Pm6zLwFxSn41J+LhjUaLlYTck7W+EdhyO1wrwsUXYHeZ7HTT
	 3rcwy1QCsPbnkXGh/ePzowaWKZ7YcCw5aWvJ4gV3C8b2/n99D7cxPWYEgNzntAQw8AegO
	 vi9G/95gpFl81BaFfRYrZcOEXyo6ouu1kK5Oeyqr0XOnnYgW3Dm3RGyXLGes5nxdakssI
	 YCBoBb+CHof7SKfCdznMFn8UBPuO8utn2ze01S2zUKOO6g25JkGLCriCgqjdxTRCnbnQ2
	 qypOzqHHGgUi6STI518NbeUhiiHs6DFflRB4A10LaT4V8n9+vrPdSl934dDuPg4XYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
	b=RZVLfYOlxSTqzLukAhEnx9csiWlBe8yUzYfxwrkJ9Zv+r2sKfUzrV8nlW94rvryJgo52
	 7kRxN9Za/sG1fulJtmhSvdIwzXpIkM4DTlaSNhDdysxG+IWCIbWkClAntU1VUB3iJZlXt
	 Ay0pXb63IaizONqHdmk2tAxMWqRajwvbTat+j6d2+ZPT5T0/cY5qODdRNqgn1cD0DyVxB
	 WaQp0ViO9wfUd0A6nzVzS51LCfkvLLSlCPapeAUUrxXOs51/x/bDGfQjYACrFcyPNd/yP
	 AQT+C040MGT66KF/fNkgCziZFuBU1/kAgLaThoi7cIBXxmgN3Twd3fA1hVSRWtjmfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebvVE0j+;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E8606A31F
	for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 12:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebvVE0j+
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-845788309b4so1577379a34.1
        for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 04:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438035; x=1796042835; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=ebvVE0j+y1a8icfF+Ywdj/3pfjN3FUeO4VORKt+HlhcqWJwh2yOAlzjjA9dvcaDYS4
         A/h1giWaTHmvcHyeuSb23d98zPyBxfMBFxElbr7PfuZWZ8fjKAKqK25HcgigzhQDs29C
         cRgpSt+dvgb+7dSC0oxUMJUDQu1QaZOvmtoBxRQEV6Fqq2YFXckdKKm6iLFoWDxsh9Wn
         S9JQ5PnM0Vo1KWrm3TpROOOitAe8rrIwj86mylbPDyVwzCM039P3lw6jJIjS3qgVCZ8W
         x/v/0b6vhrALkIwE33IYE/3pkIvQhvMOKx6iRuc88PyYV23DUfCbIVjXmPte4xG+9nm+
         IosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438035; x=1796042835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=UhqWtdd1FaixO0dJ/LAFc8tTvzImufIDHChBP9wB5R1/J1stagCax+gnyCs0+ip/6S
         I9U7MmSWSF6Eaqv2QM5c2RNFz/7vtCNLDxoDKc0Ja5aP5gVji4O8jPgvRFzT/tm/+Se5
         oxiMj+Tkrjy+CBgt0+5HTOD1R1KmgBxRpkyI1PJVQ6cMF1iHMfxyv2YNUKJ6athLce/E
         04aCUaYKZa4UOKpHokQXu0WNDa4F29hfe00nT53BgHGcZat+0mdmf/NYDR2Okw7r2kkR
         nJg658KTdsngRqvSYNJt+F9R+pxwNu0TENhEJQzW6CyD54So3xT2dJ4BE+UVBcwBtFdL
         LFdw==
X-Forwarded-Encrypted: i=1; AL+hErGGKG6JRGFI1bhcMKlhYaRNy1iSBnpaYKGHKzMAoQvrdO8EikjXtQHSD+NqOG5+zPhSpwG3HvgWMw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Mqu4DZWZxOTOaBPO7Mz7GXrH3JSuWRTAXK53KPc892Rmih3gz
	3FgsXrcQ79oc2J0CAe3w5yGG0/ncVLH6E2BjSmsow/qGsYaCJ5yn/BoI
X-Gm-Gg: AZFdTZd3T6tZrKELKIGsC+OcdES8ODcg6y62Kr5l/PDjYgu/IWtb91dqe9GZzOEvP6/
	LOO7+kkDDE7AjddjEl3BKnmWY4o21AgPs05cMkRp2NQAq+YK1UJPoPO0K8zevOx2uP/gtTB+jla
	ZZQDmE5+GA7Hlx9A6cQu1gzzMYBl2VBF4Fox7zT9rC5cU3ukOP2Xl22ktNxz/QYh3wm83VXLLQC
	k39YjNSqCy8MImScTTmS5COkKkkmMrUxks0pgLV7/Xf3oKp3Ur2g3NjZnZoQHbhp0GQcQxIHK8b
	X7i3KKXHAz/AzwvK+qpxubRxjiMWVoJLDLDYZKhy59+kol9ELsrjhIdsQe3TMIy10wadILzwZ+b
	0MfakjiGGc1+rP+RhlxxOYutEH/3T0cQ+j9+ueA3qbiIxhxzLeu8wUzqJhCabIvouTYB8CpznXB
	sMLDRK5iluYgV1EMM04D+fCCY6cBPzHhVXISK9dsSOd5jTPphJyJ/eVNr1yiWG6G5oyKZIsA0EX
	52Jm301h4TjcHL9h4yUTTBfNOO34OKmjdFX5sjyip26GEbpdtXyCxiOuJ/ecpGFfTE9/oF81Jti
	NE8k7cRtvIV6UpCdY+9QHI3gMx8c
X-Received: by 2002:a05:6808:2224:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-57a0bd98885mr12866171b6e.44.1795438035324;
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250ef2sm9385288b6e.3.2026.11.23.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Date: Mon, 23 Nov 2026 20:47:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, me@ziyao.cc, aurelien@aurel32.net, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <nke33b3mdeut4fmp2noqf3xknpfvujesco44va3yamecdb722y@u66rmnx6t6gk>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>
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
In-Reply-To: <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>

On Mon, Nov 23, 2026 at 09:24:52AM +0000, Troy Mitchell wrote:
> On Mon, 23 Nov 2026 01:38:09 +0800, Jiayu Du wrote:
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> 
> v2 said why only banks 0 and 7 are exposed, here and in a comment
> above k3_efuse_keepouts. v3 drops both. Banks 1 and 2 hold the root
> key and the SSK, so please keep that explanation.
> 
> [...]
> >
> > +static const struct nvmem_keepout k3_efuse_keepouts[] = {
> 
> The comment belongs here.

Thanks, I'll restore the explanation in both the commit message and the
comment above k3_efuse_keepouts in v4. I'll wait for feedback from the
other reviewers before sending it.

Regards,
Jiayu Du


