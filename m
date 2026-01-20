Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD689421F1C
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909429; cv=none; b=EG5X+NoegWwsr07BJmFluDRy8dTEDCPe2H2+Alc6W14yfy9+RDaf6v6fklaIpGTAzvvKOF2yweZPFpSfQ8oO4sNb7VelV7jMmwR04LqNPgYxnF4Ib3GxNAE1r1QYFI1QaVJFubojvzMO74HF4MK/EpGyLr58PUmLqUyTSEkfQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909429; c=relaxed/simple;
	bh=gcLF48OQAJqjairFH8eR92suY9fBYKsnj8NxKel1wV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ21VxIeSRT8BjNUy+AOnFd6i7bNJNxXGCUN6AyKZVUyldAprlJI+CMVJyizMr6VI2dXgvxAOuwZ0DKnpRVCS063lsqL80PPdTPsDiQhMdWB8E2L42hvH8Ye88fmNam2GPg+oYWjzw23icJ/NER/D+8/pBChUHaKxb1Et2ZF2b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKQeNXCL; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKQeNXCL"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b4520f6b32so7078884eec.0
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 03:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909427; x=1769514227; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=;
        b=kKQeNXCLQJZs86W1trY3QjrEuYHdIfxZcEdUum7LaIgtIZ6onAXHCuZ3+e6GqONupR
         p/6g+K+B99GwvzuFH9bLgg+iCwKsnMR601JtT2eFJtHw9wwGeLP16H8ObkWhgwLJiS9L
         GUP2HvVdb8BAu4AYjxxT4UB3RrqjdZeAbwRCrgRJDRjmrW1VEk21G788H7uZu7az8V+O
         F2tK66EP473hSKenXpLPjXoUKQvmY4SCsNYGFQElaO3wLmOrPtbusd0feGnsuyuco+9F
         KOQepmn6A3ywzUVGdMsfEWEZ5r7VZpfXeQqxr4Ykn8RpxMbL96GQR2xE9pWxLwto1h4Y
         tdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909427; x=1769514227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=;
        b=RPSxqwdaIB2RXKbLar5OK+lYgF/Fj/S6oYHUVLobTGN7nvJs6GAH3HIeIc2NfBvJX7
         oHV3kCoNYvEINSvz/g151JF8nLo5ZkwkHKIizafzOX1rfezwLMMjDA9E/uNTJoE7wryL
         x9ZUn2JfUkTS0XXnNIjFAJzJNzF5OrvI8DNA8ZQWShQNzWOUpW8UEA6zBAPXHrv3ToH/
         HS1t+Yydyxzt0oyiLSQjE7fvA80BBzjo7jDtWyxQRjrAnCVPrztYzZ6e7omhex6yGR8X
         l6wVH8VJPSfyL0rHL6kUvOnHKZZ07IG+rDI0WFttmOf5fYoARqGHqIa7h2W7isgy+wXW
         CDNw==
X-Forwarded-Encrypted: i=1; AJvYcCVv0UVmalwdJlILK8mgXbLYaeWk2u4d/8Hg3hJAgTnmOwG3lv1VUl3iWAlll7i53dOYjWmTO1Rfhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEGB3T2UFtBCc7Ov5XiLUkVVQd9gLl0ipI6E+9gf0edighvzsG
	xBNJDHPPUlLCRjoSswhJeWtQAQS22zJ82y3Co/ObBAcJsvIzdA/Hwzg5
X-Gm-Gg: AZuq6aJDO7ImJoskUmnV/p1AQ99wKoPf1DIrVqUkcoYXiUkG9Sh15SJ8/fcrpwfFc76
	wOVahzCVC+UsjrDko+/m9r7zPyW6inoh/4E3EQiX/EhNfEyl2+pREyNN1IL0W3Z4Zlnc+InQDQ2
	tXINJSD2KQWtRpibJtV+bg8s2f6HcnCISI+S3HNliacht6n3P1jMDTssy1hY3WFtFI8GB7AsbOL
	zKYBWSxWcQC6hmQraKnofUv2mOLqrQCjm7tm0l+9zvv9h7gw5YKlwupwHWHVQs9qhpn3iD8vO0p
	3k79Wr+GkrqkHN3piN2ToP/LR9Jmlnj6IfN1RDdd1gq797mriwN9g9+iaCpwtC/yepggJBk9SWT
	v9V05aLLciwi5TVXAAGMq52X2z0/JuW+IlmXbbdowdZMYdG8IsB1omsv+2zewy3oDWK9sQewhNg
	jeriEzvrU25Q==
X-Received: by 2002:a05:7301:2b05:b0:2b0:5929:4d1f with SMTP id 5a478bee46e88-2b6fd7add4emr884545eec.33.1768909426655;
        Tue, 20 Jan 2026 03:43:46 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c11dasm18506224eec.2.2026.01.20.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:43:46 -0800 (PST)
Date: Tue, 20 Jan 2026 19:43:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Yao Zi <me@ziyao.cc>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aW9p9By1ZW5i4iWw@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW9jbqBSgkiLLw8r@pie>
 <aW9m8YOVO1ClIQOd@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9m8YOVO1ClIQOd@shell.armlinux.org.uk>

On Tue, Jan 20, 2026 at 11:28:49AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 11:13:50AM +0000, Yao Zi wrote:
> > On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > > +static int spacemit_dwmac_probe(struct platform_device *pdev)
> > > +{
> > 
> > ...
> > 
> > > +	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
> > > +	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
> > 
> > According to of.h, of_property_read_u32, which in turn calls
> > of_property_read_u32_array, could fail with -ENODATA if there's no value
> > associated with the property. Should the case be handled?
> 
> You cut too much. This had:
> 
> 	unsigned int tx_delay = 0;
> 	unsigned int rx_delay = 0;
> 
> at the start of the function.
> 
> of_property_read_u32_array() says:
> 
>  * @out_values: pointer to return value, modified only if return value is 0.
> 
> and of_property_read_u32() passes &tx_delay or &rx_delay to this. Thus,
> if any error occurs, these will be zero. In other words, a missing
> property is equivalent to setting these to zero, which is entirely
> reasonable.
> 
> However, "unsigned int" _may_ be type equivalent to "u32", but really
> these should be "u32" if of_property_read_u32_array() is used.
> 

Good catch! I always treat "unsigned int" to "u32" implictly, I will 
change to u32 for as an precise type.

Regards,
Inochi
