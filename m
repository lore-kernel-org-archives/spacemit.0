Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9193C4540
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 05:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983488; cv=none; b=WgvS7vFfOr7tQZeky4/6cmPVHbBjKSmgKnM8w7prFGUnI7Ijamumf4B20vqH3jnt5yG2HbgBkL3PAoe+Qq3HhiFb3JWJIFDP46xgLwoonXXfO8bd5XlKfefkHoFF5WHafkEQfmJ3/Bvd6wSD/IZ8Oy24SyuHvo9foiYD+KWnR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983488; c=relaxed/simple;
	bh=cs+J9gHBHnaDZm+4UkjjauIFjbjChIVZYz4kpHDFfjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTNfJ9D0cZjkQaEBGZIM9N2udVF2AwlS/fkIxLS+2tkXkHvS7cRDAQNgB1TeM4bUm/k/W5eHhVh8mWUCpmtVWW/LXC2TjanVUH57rndZfkJSM0oqa2Y6hgm174YdxT8f6d2+Q6rnh8PibrH7wyGvrbGzP4uXJSeUsj4WIVFef3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVPHEyAh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVPHEyAh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36da8439078so4530569a91.2
        for <spacemit@lists.linux.dev>; Mon, 08 Jun 2026 22:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780983485; x=1781588285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0Ar/8R/e3J60CqzzrjWc5oNGKXlmxhAN8jEmzPMJ3c=;
        b=SVPHEyAh0wfGxV0Qs+FtLbmL5l7Aru0WdPa2XJCxXrO/AFzDcjU5LpLYMG9qo9o71i
         yzzRxqnBvIdvnkCOYv2ZHzaBei6j++l+4yDvDTFRHMVVhKGbcAisJP3yvm0sZ/rtt8NR
         lUrcXNv6DIzPFwliLdi9BN33VUmGRlVDCS6l994F0f8k0cuP6JqFfjeqJqHowIQtSWCf
         zfZfnhdlV4WKUnExO2uxaJtY88AFwBwv78ZxFhevneMZ9Wf1ikmVKqgISlXsmLdK62j/
         k8csy/odEwmxYZ+AXOSsxDB/m3oUMoNf+UcYpvILVM4dwCO5fVXE+zJv7CUKjEnTT3H8
         qrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983485; x=1781588285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0Ar/8R/e3J60CqzzrjWc5oNGKXlmxhAN8jEmzPMJ3c=;
        b=f6P/EUiARSvLi0F9ChRN+ztsl9xzP+bqSwz28gORaotTHmDhKy/D5U+oLRBgohKCez
         GUCAOSzgISomCVlVuSR1xc97s0cOpuNE+JxkrCjv2IvhRcK9h0fgP0sn4InFQeRp16Sz
         HGFVc/OGBcjykgfOoPjr1FNM4I2SU4A0Yojo8+6fmlZ0biAA+/zOJWom1b69PxcdXDrJ
         9WowlzpmHaNYs9Oi2XaYnkqeado+XyWo27OwR75reChjhOf1bty5/8fyqRDZCoeOhRr7
         wCFor4H8FjTNBIheWyK+PwE9MMG7TeKB+7t5JDQ7ZkJJulBr4J/x0+wOLD+i+nJOphd1
         JcFg==
X-Forwarded-Encrypted: i=1; AFNElJ+1SEc1NExhVVvl09DJuPwLpm/bt5swSrwba3wW86pjUAC+EHG5Ivb4uoXS45QA5bLy33pbeMBNPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCD303RjyTAN6yU2prMe7UsysmIftq+OSGivdNZlXRXOBtdkEm
	YXFuVxAtQBfe10n8V5akwXwzEiLFFy7dbkuUe62KqrPbrJAllFkJZz1Q
X-Gm-Gg: Acq92OFuu79GZkJMuHD+vtMT11lzrhjdn0Dn0Ys6Y6/2h7ld/BSwgFqJW3k+xmIzC7d
	PMDpCNfCw451DCEL8YVWZO5B4ZpmwAyXqLP2MT5Joo5NXNdG+9TU426dlYQkR1twIByhvR276JS
	WzpGClsct41MFQdqGqENNsfO9F+ppsua70tm98bZLvKpUzN2c1ZsIO1XImb+hzHUCO5t3w0+gs3
	iHr5jSmH5mBDVhQ/adNVfEOPV+ThJ696mnZLgc62T1Bkw7c2QQGnix2fcjVCIPJmpHuSDJ06io6
	qqPnHLqVezUB7GKU8xQ/1p3xtb97sW4I7SMrOtMeLDhw87oCXgkJNFTQ8pDeqkjfhzMseWCLaIg
	rGq5SbXhdZERSP3K/vM240CBRgjIqeEukfw2rAk+qcmPZlfus+JrbI23+36dFwdk9zZlI6+00lV
	cz1oQOEqkpLQ==
X-Received: by 2002:a17:90b:4b84:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-370f0772022mr19530435a91.17.1780983485272;
        Mon, 08 Jun 2026 22:38:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf82fecsm18042826a91.3.2026.06.08.22.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:38:04 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:37:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Rembrandt <kernel@rembrandt.dev>, Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <aiemGajqcQeY9avz@inochi.infowork>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608182358.170489-1-kernel@rembrandt.dev>

On Mon, Jun 08, 2026 at 08:23:58PM +0200, Andrew Rembrandt wrote:
> The "rgmii-id" PHY mode applies a symmetric 2ns internal delay in the
> PHY. On the Pico-ITX board this leaves insufficient TX timing margin and
> no ethernet traffic passes.
> 
> Add a 400ps MAC-side TX internal delay on top of the PHY's delay to
> correct the TX clock/data skew. The value follows the vendor fork's
> asymmetric tuning (tx-phase 73 x 33.3ps - 2000ps ID ~= 400ps); the
> driver rounds tx-internal-delay-ps to the nearest supported step.
> 
> This builds on commit 3ea695eb111f ("dts: riscv: spacemit: k3: Fix I/O
> power settings"), which fixed the GMAC0 1.8V/3.3V I/O switch
> 
> Tested on Pico-ITX hardware with iperf3: 60s TCP each direction and 60s
> UDP, all at 1Gbps with no TX/RX errors on the interface.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..59aecaa2d32a 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -186,6 +186,7 @@ &eth0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
>  	phy-mode = "rgmii-id";
> +	tx-internal-delay-ps = <400>;
>  	phy-handle = <&phy0>;
>  	status = "okay";
>  

You should set tx-internal-delay-ps of the phy instead of
the controller. This is a phy in "rgmii-id" mode.

Regards,
Inochi
