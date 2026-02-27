Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31430FC2E
	for <spacemit@lists.linux.dev>; Fri, 27 Feb 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179299; cv=none; b=eGxRA8y2pDXdZW+bFCao3vGo74BjjOzEPUmzObSfDMM9ZHnkBTJFMYRKWuvgratkaRwfUWM7g7qdiKs1chW0QHmGvPwmzed7bhoSJF6aPEFLSQKxyr6fVYSmM4Pfbj4DqwpxJ3gNiAJdF5B8s2tmQIbvyGXHaW66CPpgf2N2IXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179299; c=relaxed/simple;
	bh=Dvlg++DM52DQtEyG524IkAGBeRlEN9y3gQuOsexBZos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrEACobuG2HXYbpfDcxJMJ+H1RAeqzBbWz/1lP78T9c+2kifeRNwl1zGmcatCHx7K5imDrwcZhsotWfhf3c+7Iizjih0T0t8+j2PdUT1rn02wX4T5uWDacxiuQkidg7DWi1klg/pN/iJKbZPhE3cCsLP+TTxLDzCRh6FwQdUG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgRthe0R; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgRthe0R"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so1032859b3a.3
        for <spacemit@lists.linux.dev>; Fri, 27 Feb 2026 00:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179297; x=1772784097; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie2+UrGam8yuOMRgs4ibqBLJsyZZMJwKunkcFXbejKY=;
        b=EgRthe0Rb3Fd+Z5rhzk9PHa+9Ipf7VAWiaGctsExUUlOd164EUp872Rb/I91sYwIbS
         vpXayQMlWaAM+NKwWwNdp48s1ZXJxgCyQWTeuYjjon15GqWUAQEYh1+HTvs59Wi6J4ay
         D6L+cyTQD6mHVqK1hFbz3rkwMZvLkhOwhn6FhWC2my9gwSb8VGIW9cPS2OewsUU+LV94
         UxmQbMk2DgVIkwFl/rqsbr+XaC1yk33dgRHPisnoBhGUNHarPfSE9fSraQLTlolSe3Fm
         nM3hqp72lXK0UZ38/3PislFp2sF5UcD3Y68e4xhmDKKRoQ6oBeygeG++JD9RGhDfj+pA
         L3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179297; x=1772784097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ie2+UrGam8yuOMRgs4ibqBLJsyZZMJwKunkcFXbejKY=;
        b=BWb0G0G6Qt3mVnfGECDCFLvDfLjptKH86J6KoZANKhl/YaL/7O8PJQFI4nLYtuZFug
         5cFqQPIqkQTLT53DbQ6RzfOcSq3kMZzNVMq3PhvHYnE3+qQ9bnpfCmMyv00UMIDrHhPL
         DXma97R8zqZGPfaTxmsz9srPPgvMBXjUVLmBJ7lpoRcApOJcHLufCw3RwIl1Nl/Y1lAn
         QoDWay+p4txrHkUP8PCcE7n7G7V5I1hDgYhcjuQC80hodTX55SS4vseKyEFKYc02fZz/
         TKvl14gKLZ+/kVGEgGGXGA8rodxSiKaLRkyDHwsEWfpXp5YIA823E5D6jwu6P6Yfxwp0
         S+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCX+fkCWTSSs5urRkE17rTA9mjAAOsfWvYsnueThVbbzeozp59QH/LJ9iQnSxLA3uBX14aNhKw4lAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxoj8yGs5nFXx7+Y8c/6kEwOpxSODpBJLzBiIwzzO6RVjyidLmA
	nwfshychA2dL8MlbStEjg4OlmKGN8Dy3MCZnNALBVtdcGeae7SMQF7Pv
X-Gm-Gg: ATEYQzxHMVRtXTFxKOP9OXeRDsHiDecnQOTw5RCDO5s91kJLsj+284LZhCSMYnylvNc
	Vc63xo+FvVS4dwksvi07/oFHxtoTT8RigmHAARSm9TdciwNEztOBPpHVljOggtMYulPzal5by8h
	V468JNaTgJ3Lng5R1P/7xl/AZY8AMSUl+o8aIHb1Pn72S65pK4RqlUgmYfTB7tN8ZWVXGibNV/9
	054HjpzOLtC4o05acAC7dik692BYqQukA+Cd01ImcIhY21crB6MZmkkuY76HG8uRkCmtTcoRmxq
	Ct2hbr3WaT10CXU/mf669fCK1bNFGz6LdWnUFAN0bhmHhTFaBBdkr/myTPr3gue6S1gyHyLKx9r
	q3+CuAHLacDvcnIjQ5Fmu4RBBzd0qZ/ddODph6MsW78dnYRTCfsVPvzjHmC15sfWbFUnVevOtSf
	BUpvLeo6PhE8YEp0Aqn6hwzA==
X-Received: by 2002:a05:6a20:94cf:b0:393:dc6b:a10b with SMTP id adf61e73a8af0-395c3b0f6e6mr2039870637.44.1772179297185;
        Fri, 27 Feb 2026 00:01:37 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037af175sm7729375a91.13.2026.02.27.00.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:01:36 -0800 (PST)
Date: Fri, 27 Feb 2026 16:01:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, Yixun Lan <dlan@gentoo.org>, 
	Zhi Li <lizhi2@eswincomputing.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support
 for K3
Message-ID: <aaFOeQ0deTKVW0_N@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>

On Tue, Feb 17, 2026 at 10:00:29AM -0600, Emil Renner Berthing wrote:
> Quoting Inochi Amaoto (2026-01-30 03:27:01)
> > Add initial support for ethernet controller of the Spacemit K3 SoC.
> > This ethernet controller is almost a standard Synopsys DesignWare
> > MAC (version 5.40a). This controller require a syscon device to
> > configure some basic features, like interface type and internal delay.
> 
> Hi Inochi,
> 
> Do you have a tree that includes the dt entries?
> Otherwise how are we going to test this?
> 

Yes, I have one, but it is not opened as I was requested.
I will send the DTS patch, once the clock, gpio, and pinctrl
device is available. At least for now, I had no way to post
my DTS patch.

Regards,
Inochi
