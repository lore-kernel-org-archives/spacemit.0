Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BD33FE05
	for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369828; cv=none; b=MmSrrHN0bG98cYtkclOimhIEQJ3+Y5xO1q2+WVg2v/pI8OHJFpars3LntmmiNtM6QTbWtDXQKwMFOMv/whm692yxnycejM4v+jLRzZBCs2Bh/B7PyFffixMqafyYYfvSCRr6wYCtrff0z08av3Cm8vuqiIpV5sdhlIXH4rJ6h6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369828; c=relaxed/simple;
	bh=BvmSqdKL2mgHyEPzAmRBGH1hY2ITeXqKZPua1k6rWgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0qszZAHiWTetUVetsLQPcS/+O8uLEopxTJ2tSZUv9m9xqcRcDCbKxgZvq6Jt2YMuJtRYYvdpgZy/iULYrpVw40Ds3eQrqMscWZlvqVBW0uttVq2mSbgSRY780sIgY4nS2X1LC+CwHlMVTFsADA7am0u2QDzAQbNYrfQYvMyl4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY+TK9tb; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY+TK9tb"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50915e14cf6so13236141cf.3
        for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 19:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773369826; x=1773974626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
        b=mY+TK9tbJZN4Uu6x+c+ys3Rmtz1YA0aNm/UM5E9FldWtNjuQrzMeSZS7II7Plqb+VV
         Bj3fe1Fg2q3ARqN6TP5DG6b0O87Ml0esozVWj7PwfTv/C9PRz0ByrpHa/fvlQBP+VXq/
         YP5efspHLN2dlwyHWTdNHn/jD3zswlpWssRm7e3mjDrDMaEvwaH9RRxjwGgx70SNp63E
         9EdihDAbIYU5YxPd6yfvmB0muvXbxvn3sft+nL0KP40r4VZAoVNytlFP+mnj/POV2boU
         9PYxonOHLtWv0DS4Lm4/9Jt1Vqm24ys256njO+tabFW4GL1Z3TRYz0R7X6kv6IEOSdz2
         Lnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369826; x=1773974626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
        b=s9E4o7BYp9WylriO50NWl/rm++7N8u6x4oPIemudpeehDfeOC+bgMQJRG+eMKyZR0i
         9xPWGpJNN3G6CpjD65STGY4+f+/TeYvOXW4R3/rIwV+x3HuEJsxBOTuskr+XDOARt9LX
         76Pc7bJxPRN+sXIxDK3WqMaWnHnzFIPmSMPvnPMgE7RenIxR86qZwfPeGPKikooMiore
         GXw12do6NT9CeQ5ZxWrqJePvzkeP2iF/glPRkdeJmH13z51IzeAgPE0g/u/gIOPBwNlo
         0eJPmCf1+48fxCv0xc4OJ2dRkTIJ/F74+Udv7Cta54HU/5vpwM/kHp1bJVOIPSHWPMB3
         Abvg==
X-Forwarded-Encrypted: i=1; AJvYcCVprnBnXiFL+EDOEkT7/haEK5ylchOP+EGB4+B2vV4L3AXOvAeN78tME9V0MLHymB010FkC0+8sqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsM9LBvu8WVGXx+sxzcd/P+AsZrsloTHnbp0YuNOZgv14+i8cP
	ODJGyn2ElKWJorAz7Y4gsGKOKjEFq5BZBRAHkRZMR4ICdtpSlht+rYKp
X-Gm-Gg: ATEYQzzrWMx/GDeCGx4JbmqeOVjJxScisWeWkF8Y4/8n1QzUBJCUrJPI/j20DkmmccB
	2xeDiGwzeKWsllPn0J0tv1N02zDxdG7P7Lzf8kTHRzQ7sFr696Zzi+HmZp2nQ9cYCKdL+Mxk1bb
	It7UUnf07UOQS7HA7HNqpEc4zAbU6vzTNHooVClgxFlaef6qCng6gi38f280081YwyE0gL6hQsn
	pRUpuJRb1aUVQ5yKGAbqN8ZacOI86jv6TPWZ5Hz+c2SLCuu4qMVSgc4zdhYsnyC0CE7rK1lPvmR
	J7IK2DGMUhhEzJXXMbTa0/7ZnjaqnbyjECBVK/R5nIM+flrxT6ycomDHhEhDvWu5aAzcH0mxAGU
	lLVqh7u6bAZ3L9LoSWIuETM8XVo5Zzr8v/g3iFDq2lROVM+Cf0jhyvfmjGVtVw/fMwzPkXzCzp+
	J0yrnwOeTtOtrCh1QXOO1FkrQ=
X-Received: by 2002:ac8:5fcb:0:b0:509:329e:bd5 with SMTP id d75a77b69052e-50957b909c8mr24981181cf.3.1773369825770;
        Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea844sm53518871cf.17.2026.03.12.19.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:43:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v9 3/4] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <abN5Xn5GCa_UqCbO@inochi.infowork>
References: <20260312012232.373713-1-inochiama@gmail.com>
 <20260312012232.373713-4-inochiama@gmail.com>
 <20260312193801.61c30de4@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312193801.61c30de4@kernel.org>

On Thu, Mar 12, 2026 at 07:38:01PM -0700, Jakub Kicinski wrote:
> Some nit picks only to be addressed in case the AI complaint on patch 1
> is legit..
> 
> On Thu, 12 Mar 2026 09:22:25 +0800 Inochi Amaoto wrote:
> > +config DWMAC_SPACEMIT
> > +	tristate "Spacemit dwmac support"
> > +	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
> > +	select MFD_SYSCON
> > +	default m if ARCH_SPACEMIT
> 
> I know other STMMAC sub-drivers do it but isn't the defconfig for 
> the platform the right place to add this sort of default?
> 
> > +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> > +						    "spacemit,apmu", 2,
> > +						    offset);
> > +	if (IS_ERR(apmu))
> > +		return dev_err_probe(dev, PTR_ERR(apmu),
> > +				"Failed to get apmu regmap\n");
> 
> looks mis-aligned 

Yes, that's true. I will fix this.

Regards,
Inochi
