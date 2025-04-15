Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF6D517
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 01:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744678870; cv=none; b=oOvVDhiRKlQvg9qtn9HPZO29paW8HU8ZE+CGpgqDBouYUesfS9oA3PfQ7FdglGa6JBrh+ELnoOE2STgOdp8F01eQq9H2GF54FSgsC1fAAxEUxJTAbMKTUbGX/hzapC5MgfQp9/6uLSTKyjf6E3AU50rtphR5btA5V/FhQ+B2MJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744678870; c=relaxed/simple;
	bh=v4w5DfE/sYNT5ehoSrvg4/ugdIQziaDkEkahrOSBX+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8m4UIl+IHvTTVB4x0SmbtoAm1xVN3XnDlaa4t3Yv90CcxtpHMZB4egiydG6zY9E+1Iz+QLr9aTm7MD8wdnqyVzptcVD+e89jd6LDNbkd8OEScD5yS+I8zDMk3p24DR5fdk8UgsNPSPxsqp6MABFwH2GKnwJ5vu7MiCg0hXMLpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuZ4R55E; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuZ4R55E"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so1898211241.2
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744678867; x=1745283667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uy7YAJZKOai1D7ABZjjN+bQn5zDwS2Ij5HcVijKw7Bs=;
        b=fuZ4R55Ec9uhqCo6j5DpW/L+MVHPjs/Qo3/QyxXAW0KQzHd2KUufldT7mdymF1BAhY
         JqOrj2clNZLyJOoRe8Pkpxo/9b0agsKU5Vmjoj2xnt1+apZKqh1u6Aw3rJLJqHNtMM2v
         GY6pj1M9EqQOtxtpRC+istgCefNR5/EU+tFjsAFfA3IQdPU9XrhL86Z3Z24XrQrQ8+KN
         pR0at5BSsjIU5qkVqNTvuWAjSbNal4h/QD289jlKBW9dYmhLLQWI/xN3VhLKYn2nJMb/
         4cdYjJPaf2jKVVrhQxMBTSykTTNEI9A4qmVAjWQoT3c9FmLD5wUEOq0uLYcxjYrmGtSp
         BGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744678867; x=1745283667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uy7YAJZKOai1D7ABZjjN+bQn5zDwS2Ij5HcVijKw7Bs=;
        b=vpBy4Tpt6Xt6mUb49en0DbMeZv9cRufRQ+fqMqUCbjUPsSuErgnsvL6zkxTbFkrLF2
         2pCWKQB725VcWwU/w4I2CBDHPfCztnSAYStbZXMvE+5At129fUn+CmjPAoAd7HBlVDVs
         zYxwhbKdaHxoIQ6uDdi+YqAppF9kHPl9u9Bk2eiFZb9hiqZ/DJ/55uO9YBFCOTO/DSTg
         VWKGf4ob9zFHUtQEoiOejhbuO3y7deiY21FO+TwCFlWe94G0D0N4/+qWdS2hT3rIxlPv
         teejelzFnk83rnPGo1TJ2nRlfoCDNxKBAJz8D43dhuhuAj1Dt1p8K5vaylTCE5XfY2U/
         5Azg==
X-Forwarded-Encrypted: i=1; AJvYcCW8GPgisdm6sCnw2haMt/z8yl6au1Ome+s13gUEtmtbVh2SwQsNXkEC0BDSHwOFnoOtxH8tvOomDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8F6qRNo9yU7MA4sY+upszon+3Mbo5H19lozZ7DF+sIUfcQz56
	MBsMMD20eTu84Fj1UBip25e7ZMxAQOWroU9/lhoZKe57PhrHzujb
X-Gm-Gg: ASbGncsxPOVCjtN54iC18qNOCtj5hmJMdULLyNLZRK+6XLnFFcjDB0lQNn31KgWQY2G
	cohnrZ+IgKxb3XLoYueyH0atZ03O6EocOLbFCJYCHqQw+OrHe7Djd4DtcvKnMIp2SBvOyWYQooe
	5FIQYBLzZPrQYwMVWU9ETGAUL2YjyIiw6QHkOa3ZOBFUwqftfPkKVotkKwiAn045GtQb0dwGcE2
	AJzpPsxgGEwfqQ9NuwRgXZr0iXB/tXZLFrScWKEPyUdwJce2bMXxGAt9vzVmGK2ML883qo66+JJ
	RFPb7FHZvts0iX1y
X-Google-Smtp-Source: AGHT+IEg5WHo6qDq3mTM3+gnVU2hOs9hdPqiMDeyWKuT5X6RpeIxFCETbXntue45FyG12HX43MWGmQ==
X-Received: by 2002:a05:6102:5489:b0:4c1:924e:1a2a with SMTP id ada2fe7eead31-4c9e504c3aemr10457091137.25.1744678866709;
        Mon, 14 Apr 2025 18:01:06 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de970badsm92754026d6.26.2025.04.14.18.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:01:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:00:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <smgd2dymwnxkuvi4nevukt2fxcz3b5vuqt6wnuc2cf2bqaxisf@vtj7qnd5ws4t>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412074423.38517-5-heylenay@4d2.org>

On Sat, Apr 12, 2025 at 07:44:21AM +0000, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy
> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  drivers/clk/Kconfig               |    1 +
>  drivers/clk/Makefile              |    1 +
>  drivers/clk/spacemit/Kconfig      |   18 +
>  drivers/clk/spacemit/Makefile     |    5 +
>  drivers/clk/spacemit/ccu-k1.c     | 1154 +++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_common.h |   48 ++
>  drivers/clk/spacemit/ccu_ddn.c    |   83 +++
>  drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>  drivers/clk/spacemit/ccu_mix.c    |  268 +++++++
>  drivers/clk/spacemit/ccu_mix.h    |  218 ++++++
>  drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>  drivers/clk/spacemit/ccu_pll.h    |   86 +++
>  12 files changed, 2086 insertions(+)
>  create mode 100644 drivers/clk/spacemit/Kconfig
>  create mode 100644 drivers/clk/spacemit/Makefile
>  create mode 100644 drivers/clk/spacemit/ccu-k1.c
>  create mode 100644 drivers/clk/spacemit/ccu_common.h
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>  create mode 100644 drivers/clk/spacemit/ccu_mix.c
>  create mode 100644 drivers/clk/spacemit/ccu_mix.h
>  create mode 100644 drivers/clk/spacemit/ccu_pll.c
>  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> 

If possible, split the patch into multiple one by the compatible
so others can review easily. Otherwise, it is LGTM.

Reviewed-by: Inochi Amaoto <inochiama@outlook.com>
