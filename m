Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9633ED12E
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768948575; cv=none; b=pA5vv3Otcm2LoBlLZDcYht5yVRpt9CLET8IivPRjPOo9U7z62b+mJlaz5mvs8ppyE6rLmsF8sbi0EMYhBhHf8N/lbxG4t5StgGlGFAg4EY7LJ174TaKkHRB+6VyW3krbt6Tzq/aCZHCA+wKjEagDBA5mxDIhp9CmzyWNldSduaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768948575; c=relaxed/simple;
	bh=lYHvzcjsxYt0A+0br3h1GQXTMMOJydVerfEIbtr67k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3DrBrHKEHFMiAtN3mxxXI36wN9QafCqCzi6eY9uSFazci6FWbQ/vgHgXuvuNu9vtlKCYcPVHCF93LNb5VFBvXZPeccPJmqon4es65prG6KKxuxa0fq4OkzmEmxhnjAa8RKGoMvlFOzBID0zhDyGid9NgyW0pnAsY20z+zlf2ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evbRtTHO; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evbRtTHO"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b1981ca515so6439811eec.1
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 14:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768948572; x=1769553372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrbRZd+8qIGar6808P7aL6qI6sgZozZ7npqpjV5nqsk=;
        b=evbRtTHOvACttNHowKuh+QEYLTFW98k/qjwqlYsGelSPtACbqhrC24DTafCbUiuS1t
         SjZhIRnBLG4Y0/aU6EF7bVmIqUmGJpYMPnGmzxM+d7av1xIUfsC5sk0nfc9wy+UTW4GE
         cGsjeldouyV2mUZK+uWcWJgpIaVotH5/K7+DJXhX9lLEwfd5zrEQWm9MmcX60z1/gzdz
         UN5/QgeGipPGG3ucf6p7cid9C76q+ACaFFYSqLsyqejlfw/gz8bRP2YQXej0L5tNmuEr
         fDKc93HI4obrQ2ZFBDE4UGkc0lCVAzutgjjoBbQMpw+WkorUHVzme3GpaQWV6ok0iVbf
         Q5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768948572; x=1769553372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrbRZd+8qIGar6808P7aL6qI6sgZozZ7npqpjV5nqsk=;
        b=JWSio+taGtPk8gljLDz8+rlMbm2yfZ0cxcjUfKCcCkCXKDZty0jBSRpUUVdV3MQuBn
         AyxLzraUwiQvjiqQqlcQa7PRk/ufQf6TwUUJBR1QqYIGFrtd1OHHvg8tz7IEd1I1/NsV
         IlGEuM3Hlz/kgBFzMfz0Jza+bRLEefRS3TlrfD1JROLDB0TWKFQQyRf7zSwvbDfeZ7tN
         BBPv228JgonbvRelgMtt1fCVSd3BhePUcGtvGyi8SSykCZq4AQ6othLrg7lsIXOgVHpQ
         VO7PTPmITnmFm1kdjp1oKH+NG+Z71A4BdbGq4dn2t2Ivs+Vx4gkuzS+GmjGWW2KS4R6q
         bTZw==
X-Forwarded-Encrypted: i=1; AJvYcCVI6jm5APdDBNZnbuqIzBnVez2NftX7hryoc6cJzbnbgOsc2QMUXToz7Njc0Do/ajaP8yPW4QG9fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YybFpowBiklDWegvOawU0MSm09tLSLX5gmtggu95RkjQjGpWxj7
	jws/iJCokSghgc6eviuZL9rO9W5VJhW3o/wRBEzLkSnNHXN7L0+7+ugL
X-Gm-Gg: AZuq6aJa7upH2WOAZHTsPkk4EUMoaD0ZmVpqDIDi3c7C/3yFmXVfjMgIVU/QNmL673v
	S70TYDudAmjFOSY+iPqL76mHqiIvpYJTzQZyFN8LEbZnRAqfItKn1gV6LV+Tlvtr9EhKsrUGCAJ
	6ccyKtMXyyhI54saH8MfFwUAaZYx2kkNIvzIhhdJuzLTIaTBtPPLNOPHf8SE4eaQQm1J6n8+ZDr
	Ocoz2VdQhBEhn3wSgMeIOa3Gq7zg7nc7pwjRbRrvAx2nDPvyiyfkNIpwLb7Tf5/Aqa1IULSferg
	ZYBXt3FpIGO1j0p/tyffBRVet25UJuFobg5uTKnCflsOKwnH4zKX2LAJeXpLk659B+BOJhZnPwt
	5g7a+AUS088IfDZcIRDNcTHJVtCE9bonHBvBFP1zI9tie0MKahiQOL1hrRRwAJeoXFRPZJXfVXq
	HADHspgut+fg==
X-Received: by 2002:a05:7300:fb94:b0:2ae:614a:3307 with SMTP id 5a478bee46e88-2b6fd7eee95mr2453605eec.42.1768948572147;
        Tue, 20 Jan 2026 14:36:12 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm21042996eec.32.2026.01.20.14.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:36:11 -0800 (PST)
Date: Wed, 21 Jan 2026 06:36:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXACRN7BaumIySp3@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>

On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> 
> Am i reading it correctly that RGMII delays are limited to these four
> values?
> 
> If so, please add this list to the DT binding.
> 

No, these value are just adjustment interval, and it is also
controlled by another code register, the final delay is calculated
by the following formula:

delay = delay_step * delay_code * 0.9;

So the delay configuration needs to be calculated instead of
directly assigned.

> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	int i;
> > +	int code, best_code = 0;
> > +	unsigned int best_delay = 0;
> > +	unsigned int best_config = 0;
> > +
> > +	if (delay == 0)
> > +		return 0;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step = k3_delay_step_10x[i];
> > +
> > +		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
> > +			/*
> > +			 * Note K3 require a specific factor for calculate
> > +			 * the delay, in this scenario it is 0.9. So the
> > +			 * formula is code * step / 10 * 0.9
> > +			 */
> > +			unsigned int tmp = code * step * 9 / 10 / 10;
> > +
> > +			if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +				best_code = code;
> > +				best_delay = tmp;
> > +				best_config = i;
> > +			}
> > +		}
> > +	}
> 
> With the four values listed in DT, i would make this a straight match,
> not the nearest, and return -EINVAL otherwise.
> 
>     Andrew

Regards,
Inochi
