Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C173921E6
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733326; cv=none; b=b51cO0fKljN6C2j8PNpfT4S987gxrNfEoHENYVQY+i3hp5EX7REuEILTEyNqUThqHVS8btdolSX9iM4hY0msk4OEmjyno1S6dQO6aqEpZrnXVMFn3PS3Okds6ktnM49gLllneqMKpRFSUKSNweqKcFFvmDf8AdUKZbKW4+n2nSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733326; c=relaxed/simple;
	bh=xg9tpnpgfg5SClBenXIK/4GssEYnuYsuYHsNrY8UiCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYmuJiiM0Y09LXvtR57R5nRpMGM9lMjxAmWbwWlNq+m7qdSqM4JtmtZDGMxd5M7zL5vRgwqT/QO/l85eJidt2AG4lATPd5jbnqkG8L/JGzOt+HvpGp+K+5FJSiLPzzM5tScjOQeyZ7Q9+cieNmf4BWCJGg1YYmCNgzG+VwzT3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqy2Qc2N; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqy2Qc2N"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82990763921so4997240b3a.1
        for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773733324; x=1774338124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3gTRwPvoaoGKMWruMLfYdpsxbqLbc2avIWpIrbVdsbs=;
        b=Mqy2Qc2NG6GR3HTPHeS1/yKeaJ7Z0eBQOcUBxzhbGxWrspbdvKZaJS/Gynqa281iPf
         yweTx5cpAVslIqciGRu+FxdJlribJcIjqSv3imRAu87IDao34HcUytkbqxUhcb4uHqDD
         ze3JkLauPUthYXAW+8apliFTvdk5D2nao+Cc+r7YfeUvVKM9jjiWPKsx6OAFIle7u1qm
         +jInRVHhRRFfWS4lZvhjM6Zt6BtyXuFvMPJqavIaqt/nxM3KVUmVnveo37RZOCJbn7ca
         l1JJJpFD60F9hOaauACan2rtwZ5mTF8uNDV1OGldLireIAJQFR5dml7gZLEpz1MMdpHY
         mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733324; x=1774338124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gTRwPvoaoGKMWruMLfYdpsxbqLbc2avIWpIrbVdsbs=;
        b=fuTe82E99yKmdgBAY4g5n1mNViRKR1OwZ8thGEqHNp70cHAuCwhJG91IduhHa/G2YE
         Lt2Nopv7Sb3ief0MB4+RAuUaSPtIet7CECstXsNTlrIi4aKo5sIjz44zFhTXFk5Yq3+n
         4ix1y6Yduv9R1nCNJwDfnKFvYFDVrJcC+omUN+oSfcsDAgdOjvCx0LOuk0ahnVNmatV6
         h4siOqOKjWDjdr7d9Ba41Vg4w2Mg7n+JJwEmMp9bJj6UogkrQZEso/fgwReVz6GsyWv7
         VzIuZv3MaDzgiWZW4PDoJZtH7+KYi/EXkkF10FIsr6+fGB24DNx4/92W5iCxlSvWZjJY
         ngPA==
X-Forwarded-Encrypted: i=1; AJvYcCU/fu/ws1++y51LeZcvZj1zGFOcEHtA7+HkqOLwCZBKBvzOa3mGxG4uabMsNPLkuFfPChPAYCE87w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yziz0b/LFiDqHN4GrLu009xDxlhcec1qhZDSQD7kJzi7R8qnexN
	lrgFajnGrJ1IvWs1VZWfszkgRybXOWeytPgZqGPojYcFuZQ0faBsW6tt
X-Gm-Gg: ATEYQzwrQoSiuOyfbbOWkbGvyZAJzjZmrvC4dCxjVlxSdw/vuiJejs+VBrMXKaxproa
	OTIs4khCfN8o55gDODRGWP4GnQkt2Ovty/8kiEP4WWJDzzaYgS8zEeTSubK7oZLT/g/Em7FYN+J
	v/wHVfieBN8DxRRkS9d6qYn15wa2fSfPCLDPx3Bzq9xIg0n5psABJy0PH3x2YT1jh00q/zs6fad
	3sUOBl3sL+OaKBEwSYk/i1hqL/1uJuhdAflcmCGp7WqdvI6KOrWoGm9Y8FORU6QH1HahAUYl/Lh
	OlNf2qnUTCNGvvCEqeBFlryt04h4pibVTOyP6bxEEraIPy/B/DvcJ97YN/TJ/hzCvCFULFf01gj
	A/84+2DJ9s6uXljdJPhlce6UiYp4PuAK3P4sz/tSpWJyZUtOm19IZhOVn7UAQxFyTNR3sgWQFNg
	DVclpMFo4VGHNLS9SLAL+/YbE=
X-Received: by 2002:aa7:88c9:0:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-82a1957f3b6mr14731969b3a.0.1773733324070;
        Tue, 17 Mar 2026 00:42:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736deb4sm15367325b3a.44.2026.03.17.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:42:03 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:41:56 +0800
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
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Zhi Li <lizhi2@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <abkEPCRBkQIgx5rx@inochi.infowork>
References: <20260316010041.164360-1-inochiama@gmail.com>
 <20260316010041.164360-2-inochiama@gmail.com>
 <20260316202147.431d9aeb@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316202147.431d9aeb@kernel.org>

On Mon, Mar 16, 2026 at 08:21:47PM -0700, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 09:00:37 +0800 Inochi Amaoto wrote:
> > The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> > MAC (version 5.40a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> 
> In the previous version the AI reviewer complained that we're not
> adding the new entry to the select at the top of the file. Other
> compatibles appear in 3 places in
> Documentation/devicetree/bindings/net/snps,dwmac.yaml
> 
> Also I asked whether we can drop the "default m"
> 

For the Kconfig, I think it is better to keep the thing the
same as others. And I guess this question may be related to
some compromise that I do not know, and it is a hard thing
for me to answer.

> Did you disagree with those comments or did you miss them?
> stmmac is a strange beast I don't really know what's going on in 
> the binding, so just double checking this is intentional.. 

Oh, I have forgot to reply to the binding.

Currently, I disagree to add something in the select, as a
new binding is always required for a new device. Even if it
is already supported in the existing kernel, the new device
is required to add at least a new compatiable string for it.

Regards,
Inochi
