Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C51A275
	for <spacemit@lists.linux.dev>; Tue, 23 Dec 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483020; cv=none; b=ce7Vz3cTHzrlu4+ELFS6UzQ6Etj6pMMdvcGSZ9Z+gqAcDhQ2ADMLcB6DUzC7lT4WfaM/fPsE+PbD2nIIyh2NUiJQT5uusT2ALPdtzHxlOSQvovkZRILMikfPpc5FMug3EZktcdFmnbwUj91im0h1VMhfzkvdk8pjKiuU3SJnZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483020; c=relaxed/simple;
	bh=l/xGg3lZcqpSBWluJfeIDeMimjyGoXBIIVY9RShRyGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnZfySFwQleZxF828Wz3o9dWq4y5iirsOAbDsHNlEeY7xmPmt1OoqbEpqM1hoUg43WLJDi7bzjlmq8iEa4t8uFxc6MZJ1nse3AV1Zt55gezasYKDguwAH1XPeedRvkk/DnMTE3H1Qj137SebdlXMElRML6QTabGTfKwNy0gz0o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cipmny/W; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cipmny/W"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ae29ddaed9so5201921eec.0
        for <spacemit@lists.linux.dev>; Tue, 23 Dec 2025 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483017; x=1767087817; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxJbYsS9Flodz6V0WJwrBiZXTghxJcKYTBqtlgaql2c=;
        b=Cipmny/W3QAg2NGZx5PS8o3Gjj8lqX6GgUqB0uP2b/wJgosWm+6ReOjGIfFDJccBk0
         4LGkIPO4Cad7HHO3qhReN1XG+M9HBz2faCEDmeUG2NmIsavGUtzKwavn5+WOoKIz048S
         rhPcMMNS3KVPG6QP2P9CAY+LeJtiiQxrXWFs73ihB0KhpYAlNOGHzoqs/mireQ6QnspY
         NM7EB2mqfBo5ET04OgAIWKSQhYUWmo5K/ME6ogQBLeeByTvvygBlPxGKirBZZTPkpUJR
         /s5+T3LmecjWbOZ816AEUAMQGrgBbpqrzsDmt5kD0sinZze/7KqKw+zPi7IIjb1q6wIh
         +COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483017; x=1767087817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxJbYsS9Flodz6V0WJwrBiZXTghxJcKYTBqtlgaql2c=;
        b=MQf/qS7d1OJ8/vwRa/qcJDepVOmLfQXQt+q7q7jWSpR/kayDgTg0SKoZy3GM0Aj/tl
         7icoLXndE0Rh7r1E4rl5/kJyJSkU5XCsYjWCAt/VJMR/5FQbP3h4/T56QhgxbU7IfUco
         Iw5BBcRU4BOukjYT9YKXvZvw5H48jskQwTFPmzij10iG/bWnSlrmyITlnLU2kcN7QoJB
         cfEYuiKzhpMiucUi4X3bJMNUThO1gw/AGUpXQJ6sQWBqdmU0AMiW/Jdl3K6kHDAA5mHU
         BHe9N1rZ0IrrmHLGi2P87gj/GUzQjxnLqBaDCklR2qk9C0HzwFN7DyTpfLW2JIgfxHIr
         N6cA==
X-Forwarded-Encrypted: i=1; AJvYcCUxEyIm89eKXWqQJuOTBVbPPUFqPV/LXEvO/hUVslvGeZsUsy1Wv57H7rpGlbXsR+Hm4uylI+e2Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF0MwlSIEsQBUxEShtQ/nkpdszVe+FZDuIbEQcUlGZEmGoop1f
	MnHrrML+/F/GKcZXcVRYrjAGIjto8OG8lAHWQfO/NoXS6R5kmBOo3Rbz
X-Gm-Gg: AY/fxX6tNYndYk6aCGrw1HgwJV5/LvPCqPUqx9WZq2sjRnx58PpQlCbHXYoKyjrwzxm
	sOL6MMuKzjJWDYH1An50lSvZJR75/blm2NO7Zn5D6q3b14ujEqMvz9w1mDk31OoDCqMSDWL3rqL
	tStpVvowF28JmJdvCqof61nc25Ensy+VyRJYeX8u520GenhTKAR6I63NLnEHr+J/1Tz6O/dvY/h
	CPbDbFpw3lucsPzPdGuEGgsec44uBzQAEU9/rR3fmJkrzRW+++xDxriBENKEeAFQfqzPtu0XW1e
	wrJ8BXFLf9ulF+JiCvLIFZqMqmvbp6VTieZVMSGFTNvuUF9Uc4osr7dQBGV+EEMZar3QrBMHfOY
	wxX9LYbTrPpgHn/euBLvKs0SuXoRGTd6h2Z4Mml2v98tmkTAE5ezB3T9KZ/7YRkJOkb7n6MMFrZ
	sZZfXULP67Ag==
X-Google-Smtp-Source: AGHT+IEp+OSd9R0lrP291Dk7W1AafeaeXYagMJNjBu0iohEINVzAIJUCtwgGHA2QHs2m9CJoX6vTug==
X-Received: by 2002:a05:7022:608a:b0:11b:a8e3:847b with SMTP id a92af1059eb24-12171a685cbmr13887306c88.5.1766483017187;
        Tue, 23 Dec 2025 01:43:37 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfc0esm56367570c88.2.2025.12.23.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:43:36 -0800 (PST)
Date: Tue, 23 Dec 2025 17:42:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <aUpirQFWf3w-5PQ2@inochi.infowork>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>

On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> IO domain power control registers are used to configure the operating
> voltage of dual-voltage GPIO banks. By default, these registers are
> configured for 3.3V operation. As a result, even when a GPIO bank is
> externally supplied with 1.8V, the internal logic continues to
> operate in the 3.3V domain, which may lead to functional failures.
> 
> This patch adds support for programming the IO domain power control
> registers, allowing dual-voltage GPIO banks to be explicitly configured
> for 1.8V operation when required.
> 
> Care must be taken when configuring these registers. If a GPIO bank is
> externally supplied with 3.3V while the corresponding IO power domain
> is configured for 1.8V, external current injection (back-powering)
> may occur, potentially causing damage to the GPIO pin.
> 
> Due to these hardware constraints and safety considerations, the IO
> domain power control registers are implemented as secure registers.
> Access to these registers requires unlocking via the AIB Secure Access
> Register (ASAR) in the APBC block before a single read or write
> operation can be performed.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
>  2 files changed, 131 insertions(+), 4 deletions(-)
> 

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
>  
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
> -			reg = <0x0 0xd401e000 0x0 0x400>;
> +			reg = <0x0 0xd401e000 0x0 0x400>,
> +			      <0x0 0xd401e800 0x0 0x34>;
>  			clocks = <&syscon_apbc CLK_AIB>,
>  				 <&syscon_apbc CLK_AIB_BUS>;
>  			clock-names = "func", "bus";
> +			spacemit,apbc = <&syscon_apbc 0x50>;
>  		};

This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?
If you insist on a new reg field, you should change the binding as well.

Regards,
Inochi
