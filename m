Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD5E552
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 00:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744678479; cv=none; b=WNuvumkvOgua8EGpQpCm13V0IvGiZokR3JDhpgbZW/4ib6aH3DP0X0UBCOw0vI3xNNjih4ogTRv6KBYU+j2rTAWVJkBuUBI5juxFqmp20/+RLbkzGv2nPTEbJ0Qwx7+ulzM+M+Y01qi4YGSqDsqdKiWng3YPW9AsBsI/5PvUxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744678479; c=relaxed/simple;
	bh=oEEe+Vlyh8duApf1eRzAoSMI6LUSSwNRyi7o8cZw1Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTFJ8v57eG6Z3jS6R9z7Aoq4QR5j79zbMwEpR4CFF6LyuPeK5cIR7XFLvwjNIW2IfbHkmn0hUf+otwZtUj/txz5RhW+rnGh2d/v5Po5AZXelFIz/RsNEt2uSmAm5Ws08vpZbfVmDwj+/d84RHNPDk4lp7GNH5dH3owRDm98OaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+GQXaJf; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+GQXaJf"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c6a59a515aso301584685a.0
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 17:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744678477; x=1745283277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YEdjQ1o+VNN956ebuUdrdZKlZGMV3rwstW2yOoX5VUI=;
        b=X+GQXaJf5GaV8vMmDiigYIKekxVQ0Jo4z+hgxilP/95UUmFTXPVjUG1dFyOH1L5mmL
         XbA8t6Ppm8wbf5TSREfpXi4Y9JkcMWydDkxBfI5OP62bhdP326Ukp+6wQnIVM4G9h9Hu
         2K1TaHvdIhQIn5okHxu6Y1oqUhhevkAEPt1a8zU3MPm5zgX6zApsZYG3nwnQ6R4ksvmG
         xmVP+KTpC6G5QnAD68ogMUK+GeGY/QwXoS2IDKCd/WUeO9c7sgVymY+yzBdIpXSnAnns
         kYAd0gWb7Rn4GafdAIjzv5rgO1Rw+blrUCGxp02ugIoAeezxF7uXeFOxjwc5Qz4PcMcz
         WHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744678477; x=1745283277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEdjQ1o+VNN956ebuUdrdZKlZGMV3rwstW2yOoX5VUI=;
        b=f6AeWHkH0Myy2aMhBTFwTA1PD2xXHxMuJgkIISxBGkmk2tbMgKKKRfRF1H03HaAfMF
         VKpspxJIU6MH5a2fm2XcyMSLFdRw89jfiVX8WasmZ83T5bYa5+zVy/iJe9L4qzib5psQ
         9pSHz6UytAP3uVUSeZ0y2NZth9tsfeeit6m67CCS9Rv3jWdZdNi3mVfnVSTsPb2uEBhW
         t2rk/VLzymcJ34bpWErMXV3pFSbyIy4uEhz0sePk/mRB/YtnPJXfVKg9Zf7Wx0y32J3L
         ZpThh9P0oMJyowp33Ec0v6xZBCPkSJjWHPSl72EsyGYdwn2/InK9BSAUpKkiu2ZyOLmc
         cjZA==
X-Forwarded-Encrypted: i=1; AJvYcCV8swS7ffdG5wz3aRAUiZ577b/M+1loSBwAWnLHymQyyfOqQgAVB+uSrvrpDNnLfoA679KRGDWAsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXi1UaUAW+sCLr8bEV4o7pNzaRFSwX3P+mc7XFBkT3XWdDxwWB
	0Bg2WJxJfk2PeXUzZHcWKW1VBzFsuBKdsBI/STw8Ptcp4aQFSppu
X-Gm-Gg: ASbGncu05s7t5eJ7ZBwqbAqC36BZbn1Ehn3bv7/8zTSDi4OWeeEchw4VLvnuDKYCo5a
	pct1RaTPV/ju6v0hQE4Cpv4DqS+5TGP+uo2+gk1vbwuJcf6sS3DZCyw2Ml063dGKdqsDLsAQ+hl
	h3itncp9b69sHHyZ0nHst6+uvuzW9yzdftr1DyeGWCapTnRNan7HcxR3SmLc8KeukAu8PBFCplV
	4SdSakEYASK7q5Z8MB08+oNSxrc7gu31wBYOmhn5gojUZlw8H1WfMVj9jUzAHwzrcNDyb1+qZm2
	hoR503hlAusMWDsm
X-Google-Smtp-Source: AGHT+IEcFMzFgzOuAefnSoezpAomkQ7g6BkNkYnHYntZ7e4If6A8R5STXqAMatQY2FwcPEjpF4L2qw==
X-Received: by 2002:a05:620a:4055:b0:7c5:4be5:b0b1 with SMTP id af79cd13be357-7c7af1133b7mr2147815585a.35.1744678476628;
        Mon, 14 Apr 2025 17:54:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f9938sm816112785a.69.2025.04.14.17.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 17:54:36 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:53:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock
 controller driver for SpacemiT K1
Message-ID: <f2gpmtaxfbt3ltgrz26uyu2gzffrp6gstov22qvguiz4md33lw@y26mzzc4wnnd>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-8-heylenay@4d2.org>
 <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>

On Mon, Apr 14, 2025 at 01:12:32PM -0500, Alex Elder wrote:
> On 4/12/25 2:44 AM, Haylen Chu wrote:
> > Clock controller unit, or CCU, generates various clocks frequency for
> > peripherals integrated in SpacemiT K1 SoC and is essential for normal
> > operation. Let's enable it as built-in driver in defconfig.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 

> I know Inochi wanted this to be "m", but you can see that
> SOPHGO sets it to "y".  Meanwhile SIFIVE uses a default
> value for its CLK_SIFIVE and CLK_SIFIVE_PRCI config options.
> 
> I'm not going to solve this, so I'll just say this looks good.
> 

The clock and pinctrl are exceptions for me, It is OK for me to set
"y" for these two device in defconfig. The thing I only asked for is 
a tristate entry in the kconfig, so we can go with a module if 
necessary.

Regards,
Inochi
