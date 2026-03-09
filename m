Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE62D0C9C
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095327; cv=none; b=hPruElY9qw+qt3OTIILZMVCKk0VnfhLSaWW3mtwwlMmxNyOCZG89rJY0pEflUbwY/Kt9AjmGv8SBXXONg0IiyeU3MwxgCeL7+yqI4v6467gTB4t5YbKaLX5htLVKqChkc4DosxLF4fLYChUI7uQ02SswwNckhOdzy6i52oRmNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095327; c=relaxed/simple;
	bh=jZe33NHvCpQzQ05RR193bC1srRh1cAqWr65aMtAsAwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jj9q3M8VveBMLh3k71WUXQGpKNpsxSwiKV8nG8mczeqB3YLqpy2Jd3qCIa8Ny/KawtASmIJG9Ln628zm0FE1JUFkC/fPJ6MVCGVdzbzTwTxmc7aRoHGiR5qTT22esUkoYmdzFyf5QfPzkObstObM9ocKj4be/hWNKajcjrHrrGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1LmtrSw; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1LmtrSw"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89a06bc2f1bso139742946d6.1
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773095325; x=1773700125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
        b=Y1LmtrSwmmfSRNiQe6hqL0ct97mrDRaZo37H4NZBFvxKW/gAKjpg0Znq8HOPD3hoDt
         6DJcdxl4WKAVetXJ8KC7+N+oVlL7bF+kzNFZwQofbkMq5IH+rZtcjRiwn20EGowY+6P6
         ohYsYqihy2uBTlebMmD/YjIQJ+elLBqALH1my8tPfnh/vEs+ZJ9hIsk2Zw+6z3WwmWA/
         Qfxwr2euX49m20yzWkdM77SjbtFrRxmeBsl48RHG3DuzoWXZQ8s0YjyLH89h6tvSYQHr
         O2AQLvjW/izWL8q6CosqqWv+8704+q1+qBTFdDaiBT4HJ5dd94tg8XB/tBD5au2vJ9gA
         lFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095325; x=1773700125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
        b=KKai0MpZNIqLDJnJuqjASMsN3M1WPZ1gA1MBn5ftKMfOz4Sh7SmsZxsTpO/WnKGSBk
         QE9rq6MFKSUWtZ6wEEXGXjiKLBIkWz0Ug5eg8N/t9JPvvoKrR3AsGdg9oFiepwJdgUmt
         4gYA+uZf+rNAetUQnbD9Va/j2HeCpos6eCM4Of0XnWVUhKsH5gMd5QqbFbjNMkIJGjCd
         qv8tQpm4MyTWNWWJ3lubLyzPjCzH5fj+ALV/NX/k3lN04Y8BIgyr9q7Q/RUTSvW5PyIL
         fAq747eVk8iA9d7osl9jGwA+7kBiUOnjJdEFOaF4OPMxygqiR+aZMObx50bvTAmefgb1
         qv1g==
X-Forwarded-Encrypted: i=1; AJvYcCX/wmJkcwln7nZ/zbOpA9qUyND2iqKuP64OVmit5PH5TpiJ+5JhCYJYWrWpHMB89n/Alv/guOm6Xg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzx4atAotGXz9gDnfOKuqXhTm/Wk7gzZsLPtPm/fy232E8dyTr
	ruOEC0uob2r8cX2mt+6DZxNJ9nKKKkWSKIz9NooRexFiiOvZLB2hUSBX
X-Gm-Gg: ATEYQzz9A9gaWwt33X9VpTUMQLKrPQOpcSvlXS8JV57Wa+qjfByb/MFQhkipN8VgHCd
	i8NX3p5Ca1vnc8kXzaQK9AmoTFvDkDwS032wUrQ6WvS4V9aUb4dVwfw3Rlvc748Sj2wZLXrg/C+
	PVgdnFPeJnimNcvU/ZZrSi4PpgbLNvzYJx13kv+Kt0TpruVc51R1CbNkufDgqldm/I60xSbU1r3
	dk+S+hQu30wC568vA7VIdJ+CAE5YUKsImLE0JHa/KbS5i2tOMAx1RTCMSWYC02qoik1oq0C4K2u
	2dKuaq0Y2qHBLrsnpcI3KeMaggeNUa09aakKI4SaJgt2Clu30P0MFvNQ9IkjbZHHWsF91MuzEgI
	ysfA/xIdefug2V2m6AHqQoG2XykJo/LAcvrELqtFqSaqmJDw+xOsRD/G2vO0rQUGf1sT6yfXC8i
	DQ2WrGxZS123Vpebs+Sx7hq6c=
X-Received: by 2002:a05:6214:e4c:b0:897:255:d5c2 with SMTP id 6a1803df08f44-89a30a4d3cdmr192944066d6.26.1773095325119;
        Mon, 09 Mar 2026 15:28:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a1e68esm6918006d6.2.2026.03.09.15.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:28:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 06:28:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aa9JCWpJ_EJbUzXV@inochi.infowork>
References: <20260309004305.315018-1-inochiama@gmail.com>
 <20260309004305.315018-4-inochiama@gmail.com>
 <aa61v7MQoYq10Jes@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa61v7MQoYq10Jes@shell.armlinux.org.uk>

On Mon, Mar 09, 2026 at 11:57:51AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 09, 2026 at 08:42:44AM +0800, Inochi Amaoto wrote:
> > +static int spacemit_dwmac_update_irq_config(struct spacmit_dwmac *dwmac,
> > +					    struct stmmac_resources *stmmac_res)
> > +{
> > +	unsigned int mask = CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = stmmac_res->wol_irq >= 0 ? CTRL_WAKE_IRQ_EN : 0;
> 
> This looks like the last thing I can spot that needs to be addressed.
> netdev wants to see "reverse christmas tree" local variable
> declarations.
> 
> Please reverse the order of these two declarations to achieve that.
> 
> With that fixed:
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 

Great, after some lookup, I find the variables in function 
spacemit_set_phy_intf_sel() are also needed to reversed.
I will also fix this in the next version.

Regards,
Inochi

