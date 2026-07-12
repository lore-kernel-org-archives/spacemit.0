Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603322D792
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 22:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895568; cv=none; b=ZMXG0zyTQ433GkeFNnhnDbAV51TiG/rh6O7LVQbR5Cn+WIAdmNdaejzLvNc7Czcn8WQPsDUR8sRd+hpymaNzxyXXEtpcNmZ5EHe8TpT41NnMNH7mk8C91/O37KLqB0BudoNy7ZRBa2yNhMu3852gwyfpNW51oqay16pFJlReaKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895568; c=relaxed/simple;
	bh=rMJRUga+qfOnoGx07qr045Ebx7qHtK4d/BCQpBlQpAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7kdB72PE2X4g+DT2Fn05j/nQBROX0z204GNXBM7p9A9EfHkiTYtlVo0uocbKcD4Ulm3fhkLvn3EIiGGRFXq/3ehdS7Yvp3epS4DX5WINZnbOhY9T8+sfU9ElylHWBYg9sXGF5HgYoUrsZjwo+LFFedQTg/itOwawgb4DkeAYpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYNFmkiQ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYNFmkiQ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3811e59df58so1599150a91.1
        for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895567; x=1784500367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
        b=LYNFmkiQnZf/8TliD8DAKHQL1MFP/inp4BrVl016BxN67y8WQAqPaVjhDNO2j+6GQ/
         cWR+feFBpBcWlQJTLIrGBL1A59PRzyKp720qizQ5mn251VqUkIwlAeRH8tdAkf3wwi2B
         9fuX2eCMkYhPG2lhAUacUyln3cFhw8H341d97URCt6O4tCsuhIIRWlONwjNYHavhkYcY
         B+m9tTcLO4uNSdhFJ+mMX1K7GNGkH1sLrKGEDAc/WV+q0cIXqlU0/faqdanT/6CdptIE
         eEXeWNfjUIvb7WpED//evr3SVOsrAILMRLtg33j4M6XjjfqJJbGMijXLFPsTXyMWI4nc
         FxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895567; x=1784500367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
        b=JqSrpFSmJTtHbUEbY2kK0KpNvN2QOS8pkPdqvgWa1Pzw4w9gaMfVsaycustgkA+S3I
         5elmAbUqg9apf6PUt2aWZsN2n8Q0pcdN6LV4G8gKfeUqLRQSe2oaPBRCqsxueGiDlZZW
         ru0OYgThvww1eeeOokHnUEQIRW54IPmKhYUw1oDVZdbQdIFMplGxZsURVDzcEFRNEpUO
         rX66dVp0dXly2EQIjE5Sq5CKC3cUAgY/5IQ1TxBd7fNyqZoGbeA+CQVDrLRQMl18n8mD
         KmBgTv3YRUUxp+TfFBR73I24paQUeTW4j35zx0Oa+djKvoINZrXAchDqF2v+8SOuAfq7
         GZfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzUEf7lbgkyCSamZg2lSnIacGROibRmu40qRuozlBCNdDEERx7ZQ/Zui9bb2zp2WGhm+Qk8xv+yg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDOgi5k9yf2wnbnSUfxiDAmMMWZV56Wv9w9uUuKJqADzMXgnhv
	c4ZGN1DqeVO3yRS9NibKW7umnZi/9OsExTPM8yKwj55BdmhZ42uVpNLa
X-Gm-Gg: AfdE7ck3ZGRhVsnOUWBgARrBPYcLi0Uh5XhWXQ8lNwpP2Suvqu5X+nQ9yvsUMg8OSz8
	QPIlqL2UJYtJTkYZVqAFzBTieYhZVnLiXqF5AD5ixKPUn+rwjgtuIUfhki4S0NCYtvDJJLKPtQr
	xcANbzv+c30tvobIfSrIKlgWrNmzUIGngNK3+tkU2VbcCg3hrvxMqYsTRilpX+gOvv0THC/rqUd
	7ZzMQzffHHXN1yVRZjcIX7Wf4fwen26IBFpO+JCULTVrMSsMUPWbfGIAA+Ta6DYCqguThM4dL1F
	WZX930KTvg06P9dDQOHj4HLzhhYsFO5QA/JcWlZjpegXfGvkZTK68TekC1SPZ/ZsucvYgyCGvq7
	pwWVAZSgLvfLrLk+ieKx3gGqEDejxf5Qc/kXJPHo+WYJKEcyRtHKSxrGxJY3QOUpP
X-Received: by 2002:a17:90a:da86:b0:387:e0bb:5800 with SMTP id 98e67ed59e1d1-38dc7ba7310mr5970904a91.39.1783895566751;
        Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm61166210eec.3.2026.07.12.15.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:32:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>, 
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Message-ID: <alQVg3QqoIdwGEmR@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>

On Sun, Jul 12, 2026 at 10:55:51AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 7/12/26 06:52, Inochi Amaoto wrote:
> > TL;DR:
> > 
> > The DWMAC on Spacemit K3 is failled to register phy after the reload
> > the driver module (rmmod then insmod). Because the reset-gpio is
> > asserted while unloading the driver and is not desserted before reading
> > the c22 id, which leads to a fault.
> 
> You're not the first one facing this type of issues, this is a long standing
> source of issues. The problem is partially hidden by the fact that often times
> the bootloader deals with the PHY reset (like the case you're facing)
> 
> Take a look at these discussions :
> 
> https://lore.kernel.org/netdev/cover.1761732347.git.buday.csaba@prolan.hu/
> 
> and maybe more intersting, Russell suggested an approach on how we could potentially
> address this here :
> 
> https://lore.kernel.org/all/aTBeVTlsElGXUCSN@shell.armlinux.org.uk/
> 
> 

Yeah, I have found these links, but it is something more than I want,
so I think I should deal with this carefully. I will have a try if I
have enough time, but currently I will send this workaround to dlan
to solve the problem....

Regards,
Inochi


> > ---
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> > 
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> 
> Indeed that's merely a workaround :(
> 
> Maxime
