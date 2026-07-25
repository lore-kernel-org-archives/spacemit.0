Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074B625
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 01:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941296; cv=none; b=KirLG0ci/Z7zS2MVAhW40KnyGpN50KNh9+oOsAY2D7ENeWe6BHMliKamYG2Ugxcf+iroKFkPBmdk/dStnAzweZQnLRMpQOCfTDnBpKXO/D10lh9YX6+HQ0h+5i0jSiH7P6eSn4NxqQ/XipsdEdeNQ3dkSEDkbVZIKw+pmDuqPpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941296; c=relaxed/simple;
	bh=t8fxi+lm5mZk3h0QtiD57w12TvuQE1dLio/9A3tild8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyr1LS0YmQDhaHAeuR8yyNrc8nHsBKlS907TwaZM0kFTJwXcrGdsmasI/PPUwYyTcSd75soDUBv/iFj+dxmBoqnEpCCgwEizjmD4M8d5z9F3/IKkk4gF3nxQm5PdQXyj+qYTqpFJrEVBv1EYlkGoP0QelzNOfW+3JRX0IDcqq4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=It47BAlg; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="It47BAlg"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so991308a91.0
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941294; x=1785546094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL0z5oMGThYMtVLCeXNbkW2YxtHOpeXLeMPRqOdxPNo=;
        b=It47BAlgSzFEwbb1iTugd1zWYUOTpxQ/S/Fb2jXuYI05QyDh3Ee81Df5u6zEoPu7+x
         Kr862LXOMZZg8B9ERqZvfOfFQggKwOAEsi4IURDMzjJpffUjgS20qfGdBwZPGBpcpq7o
         fvft7UZt6tRadTZ6NXMG5ScNPDXAHNhZ4eTjlcpof3bjGrDxFA51TcT8V/q4lamjasZh
         sj6NO7FK01fHDZFQcknhTckxGhWrArLaUikvSBV19f2pHeXiMIcxO9xBbl1yZUkDy7rq
         hfeiuWSxw0IpRYvAMm548+TK2Pi6hfYgriZ3usv59Dg9i5XEaxAKPxcBUm9TvvttmnMw
         jJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941294; x=1785546094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL0z5oMGThYMtVLCeXNbkW2YxtHOpeXLeMPRqOdxPNo=;
        b=RCgepg4D1+bAND2F7G9LLMWuYmcl25H6NzApZyYE35o9o4ATqHI70dqoLirL4m4La1
         RQkPF03GWnK+jU8dj96im68bBy1qrf8C/RLkQdcV5d5YBPDe74XCXucqugrJnRS+Rnuj
         ybfP08rZGggQMrtYIicf0cT1cL42mspsYtB7dSxQuptKOFqc7eatTqYkJixYB+yhl97q
         iM8jIl0D21lUNIk0XhBLfpdNj6bLT7xWc94/nyqj0XIi/K1+MpUt/Ci6/VWqK1iuGIg5
         XCmwAWgRyRKIYSPE/UbVR2jx8AXQJqoaM07LWQnBX47gKD8YBlfiSqwufwT20gbU7ik1
         du4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr9hu27WWh85bsjJHSXlGuRxnUfK900V0LdRnXAJ1dNltj4kuJtdrz+aPXptRYz9P8CIEa3sc3RfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YycBbohnr6iS5jOPSw1SVQJxnxI50oXbJOgnuYM/Kk0KEU50+FV
	rpjgg0IImw71jbiAbKWFdqvPJEXtEBJKWwGj1W5be2ze1Ibhz9JrDgFH
X-Gm-Gg: AR+sD103Kv4MLO4fVaWaQF0dUcwNQ35CLB/YAqXyRJklqOZzlJPUd7n9hV+1POtUWVJ
	5XTom9v0j0ee5oiCdsjHCp2bRmCN4MrDgeA2PliymvpwSxkENze6cZRsYeGd9ljyuOqyRQKoYOw
	4aLG7VDhZ+u+AOf/6d7B4NqkzfFHWT1w5TlR7QQS61avikdjspv7jRu6vnuzzE7HBhluhvEaYWT
	n+5wL4K4mGODewRbA8qXiqsrBP7bnoVdCCNjWqIdeZCH7iZheuFgbU7Jm/RP97d0sN6Z1MFvsvr
	KXWQAWm2OTDi2rm9bY9eYE37PeFoqOReuk5KOmcqte8udEBn3UTYrI9OOK0QRtA15bhrvNYtNrL
	FLHjcP8PhxX4U7OTIWnH5K+z6CuwUNIoyFLvat6zi/bKyOQx7x1ofCh8m0niJ5g==
X-Received: by 2002:a17:90b:3bce:b0:38e:e0b:320d with SMTP id 98e67ed59e1d1-38f297812c8mr631281a91.41.1784941294392;
        Fri, 24 Jul 2026 18:01:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03adb224sm2297589a91.2.2026.07.24.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 18:01:32 -0700 (PDT)
Date: Sat, 25 Jul 2026 09:01:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
Message-ID: <amQKpgD7NKlR8qEE@inochi.infowork>
References: <20260710063314.1030249-1-inochiama@gmail.com>
 <20260710223804-GKB106000@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710223804-GKB106000@kernel.org>

On Fri, Jul 10, 2026 at 10:38:04PM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 14:33 Fri 10 Jul     , Inochi Amaoto wrote:
> > RTL8211F require at least 50ms deassert to guarantee the register
> > access, 10ms is only enough for the PHY reset.
> > 
> IMO, it's kind of too trivial to split into two separate patches,
> while duplicating the commit message
> 

For backport, I suggest keeping two patches, so it can be backported
in a more clear way

Regards,
Inochi

> > Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> If you agree to squash the patches, then should be fine to put both Fixes here
> also suggest to adjust title to be more simple and explict
> riscv: dts: spacemit: Increase deassert time for PHY RTL8211F
> 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> the fix looks good to me, so
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> 
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index 1eb5abbc61f9..b2a7d2d0d3a8 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -200,7 +200,7 @@ phy0: phy@1 {
> >  			reg = <1>;
> >  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> >  			reset-assert-us = <10000>;
> > -			reset-deassert-us = <10000>;
> > +			reset-deassert-us = <50000>;
> >  		};
> >  	};
> >  };
> > -- 
> > 2.55.0
> > 
> > 
> 
> -- 
> Yixun Lan (dlan)
