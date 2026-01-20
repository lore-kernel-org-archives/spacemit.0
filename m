Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161EF3DA7D4
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768948300; cv=none; b=rOhjTJP/QXOaeGEHbNjlOli1I7P1c2g355vjAza9oJZn5lVUsKXmrhspDemw0fFgqutYKZZZYMkltJBmU7PuuwJPoQGpgNXGKQ+VG9/vSlgYP000BseQcXvTROge1X6herCSfCfROGZbpq9DdQ7ggpeJa0h8b+8Yvu7KRYp6Bg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768948300; c=relaxed/simple;
	bh=KT7crfYGC+gc35aZUssQokbzc2G2zw05Q7/bzVHxgsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFSs1jQFyoOESQb0wPS15AIM7HGH67DhofVO5rx4ormmWYnVzfIFk88I8M0P6lp6/BnSY0hRakoXHJFkAX04UfL7A5PwRFZWluFfRT/3vq9Y0CNhSKYWatEabCEb0Vm/BoHIyFCBBAwJWL+8Q2SpwNo8M45B51EujEVLDmeyKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLHhAvUG; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLHhAvUG"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so11111611eec.0
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768948292; x=1769553092; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oK1Xva04K7ygLWg0U7fdlOWooXBJszh65DA1fNcqFD8=;
        b=QLHhAvUGdph69Flljmi1lIbYjRsBnUsSAWAsafnwsUaVT+gshgFcsRP2AeCrNROBKt
         mHdL5c4ejAxeIQHhJmex3BppPjrzOntDpDPvazEiifXDfEX0IQVsugjz7y/Z5i9SfZSu
         iQ6ekUqKdfz1jkRHqrISiowwhdQopeqQBxnqpNZK0n9PcR+7DiH0PgTx+RiIGKDYiVoe
         o0J4N3nWSEgP1qYc48pcbygeTYWhiFHcK6/lDeSlBAGJsAirfxbxjFQb7zX7//nTA5n4
         Uso+BmHe0927Nj4Qo51hdypuJhMUW3VZXQn19xP4Mtii+HvR2eRVJGYIGXXOuMV9/1SR
         f2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768948292; x=1769553092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK1Xva04K7ygLWg0U7fdlOWooXBJszh65DA1fNcqFD8=;
        b=tXifGMuMj7ZGuN2K5Q5kydLDggw3JObv4HMJZUHfdfbpJwJ3/bKSVSudEqTKBZqixq
         edPibEiJ7a9RmipAtjv0P+jmrPuZKlmMBJPKMKN75vLyCAhLKH/TxfOhCKyB0HnsedAi
         tgNotg2t2Qv4hn71eQgk15eAErxAYfZlHdRafRi7Fy7mT2TuAIsmnlyEbf7nap/yfFf7
         CNQV/XpF1iLEFvpVQb82k/2lvtILbK/cRvhS0cVksKQ5OhkXhoq9PazE9J3GrSfHMpj5
         iR70X/y1w72Pi6bfKVTEs73aWjSCGEgMWPFv4J06cHz2omWx3J0m7zmuyJUzZP/xsXhI
         lyPA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+D++CG7l0qsT7jdHSIrrXYBJvtrnA6L1sPFFEnlpqOQswdYXA1x1klqlq7IseQXpJaHVGzq4Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhBg/dwRRUuLP+dzLFakTE18vMHEk7u12EPJdCFWK0h8ILxhVc
	Ils5bg3tAWRBcOfpgpsFiktoOvIM7JD2POK14Yr0+RXgYHyAcwO+aXKH
X-Gm-Gg: AZuq6aIDICeZ/iCykRFzrARp5LK3KoYFMhqPwBzEpCQwYZUQS6Awl2bkYmbsQDIOiaG
	DTSfmPu7tAmPF+LRGi5GuxxSQh7m2d+Rwa3zzC/CuphtJAjz4ekBfOGJrxQgYzfPE8mU7N4otM1
	gu23deaQBljmskVfANvMxIgivmg4BHYTTLUxcZZO5ZGY8oiKaQwPU21acHPYZ/6oEaG4KS6NHYe
	SXD096Kv+lsAZkTDE+Hb0fpRWiPanS4AdWBJ4ddH/EJCAqyjsByL9IPDZB45N69pFE1F67IZ/Aq
	Ecdf01HBQbdqNTxTcMKfKJQi6DrhpjOB+QiEqNRmP8C4adTn7Gp4zjtWCEMJYFjooZgpJkeg4Bv
	Ws+pyUcqTex/OgoNel3n0OmRwR6XwgrmSQeUBNRbe1y0/WstRZbf155pbfHJshtzbeq48ip8DWY
	mQz1AfsYxxsiwG9ga2GXBH
X-Received: by 2002:a05:7300:1493:b0:2ae:5a55:fc0a with SMTP id 5a478bee46e88-2b6b4e287acmr16477739eec.7.1768948292340;
        Tue, 20 Jan 2026 14:31:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b712881482sm499886eec.5.2026.01.20.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:31:32 -0800 (PST)
Date: Wed, 21 Jan 2026 06:31:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Yao Zi <me@ziyao.cc>, Andrew Lunn <andrew+netdev@lunn.ch>, 
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
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit
 K3 dwmac
Message-ID: <aXABw0zVz8n3jLlm@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
 <aW9fL7r0AM0flALJ@pie>
 <aW9ou-lsQQ5dVzqW@inochi.infowork>
 <9334905d-d11b-49d4-92b1-61e8cf644f0f@lunn.ch>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9334905d-d11b-49d4-92b1-61e8cf644f0f@lunn.ch>

On Tue, Jan 20, 2026 at 02:48:12PM +0100, Andrew Lunn wrote:
> > IIRC, the "phy" clock is used to pass the phy from the mac core, I will
> > double check if it is possible to connect to the phy directly.
> 
> Are you saying this is the reference clock output from the MAC being
> fed to the PHY? That would be a clock provider, not a clock consumer.
> 
> Or is it the reference clock output from the PHY going to the MAC?
> Then the MAC would be a consumer.
> 
> And there are some designs which have a third party generate the
> clock, and both the MAC and the PHY consume it.
> 

I have confirmed the clock is directly from the the clock tree and
is consumed only by the PHY. It seems like I have got a wrong
information about this. So let's remove it and let the phy consume
the clock if it use this clock.

Regards,
Inochi
