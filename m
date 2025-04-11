Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44612278E4D
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744411966; cv=none; b=IQyMcqaJkrM08EGbIC38esFQSMBkwtdRnX2xsQXnpS6XjY+c8STeSUJRA3pBmAtAKSzYmBjrzcrkNbvRzMP+ESNgqADKV2vzKMDaecbKU0Ck+kQihElB35eYpfRVaQS3F6Jlmt/+Hv9x1rXl4pUp3IlxDOp3MxHSngNiACvjuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744411966; c=relaxed/simple;
	bh=ATjW5hPmtzhuRMZnNpxT2hdn9PN575jnzUepPgCmueA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhCK1gPZ3rudHNXhrmiqbddAvEOBcAaEHOUCF1ulskjq8snOrQMZNW6PGRdyNkgBt8Rkbm2xBW+643m7k4AogMFoMbnZ5qoXLfwboBsNsMB8j41M7A5STOcdlmOklThg7IGiOLm1ZEY2FN+u4gKzJcJjrG1Hd/ZhygZqhlZlW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTezsUxt; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTezsUxt"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f254b875so22812266d6.1
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 15:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744411963; x=1745016763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+pL39NwqtcbYwkvvLQB2h2yxEcQFSSiMNcOUnB8oXOc=;
        b=VTezsUxt3Sy/y4ux9X6owTMDnZBH7BCraFTIIV/BQIR8Lb7CjB2y/vGibWx8+poAml
         CxFCBTqihBGnvdeJJWU3R7VjWHwHFXkz2wdkCzYX/vtwSyoUxnZnWz5T05fnzyibHorK
         zpjlAymRx0tsRaatQpUvIDwReDuNcvQxqioSPx2XsvEpcipUj/I2De9k4BNd3ZXHwBkK
         DQgVfucDpoV+yJz6v7+iDwFahG74aMezsrkSUSFPhV+aXXQi+oxZ2iu95OoHyMK6wcN/
         ibY8btugWUYVpVOv7SwILIqjLwager4agQZXwzaH4d5YDqiB00Q8R0FRZHp2i+6MgpOA
         QAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744411963; x=1745016763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pL39NwqtcbYwkvvLQB2h2yxEcQFSSiMNcOUnB8oXOc=;
        b=Jb8qGLAcLi/qOROmPG+4lieqtA2QQPDBcF9o9rEN2TXpEfxR8ScoxxUuHYlLXRVyLS
         ilPeFnIVsrQNYXqJqtk72SrAaEM7PqWjVIzNo5HKvNdZiH26vPJWCn9iB0Ys9lOaWFfJ
         KYpSNwyjBKJyKb9fQYQUJDdI0rGd076dTOC+AsgLQiIiUrZj9PC1TGKvteBJg1O4Vn8s
         R8ZWv9TZ4g9LhIQbrCGI9kM+Bm76AtuucoP+40I44q9SWOcApPHF6Bgu2iJtrIjmcxCy
         lgf/Vz7MFYKHWOqQ+LfJJp6M75S9F3dmHqbAtTwT0ZTXd5tlSrcHL+RfaF3ntzgNoPVd
         Zd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWENbki5PTapFjWmBgHXGPIdwBt9wRJfKWpAbzGlJs1vsqAG9iLj4RL2HvIPQf842fGvYIqk2jGug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxyg4tJqIGY6Ed6txNppECuvly4C86YGEsPy0/Opt63KI+9Zjg7
	DXL87nwca+3LqqSDjZEMbd39VSYNaWKBYMcVmEk/zRp0GL2Qi+H9
X-Gm-Gg: ASbGncvHXo7cZN774ahq3H/8Qdg386xrAC/k+ViYVeLu6jUtMNz3GNLlPmbFkPtT0Md
	A7vZMtGCNeH+QkRjZSoVVGiWEHvQCVG8sTOq+vanQk2Cp5WM6JCeIlBCqEh4aC2wYmbj98NMJb0
	umtnN3TIvI+k/T+7J9S0eirAdMYXqR6PDhf0JjkYLHRLCCToqldR2uM6FA0TLe8rZD5P82DA/Mm
	Pib8nqqMKOqCPUzjw9QGAHTpLlD8Q2BOtcgzGt+8fYUlFPArctLCWZ68kG1fY4w8gOTIYoAcPCS
	bOXLIkIibvLZuVFh
X-Google-Smtp-Source: AGHT+IEtXcGKPfNuWYv/aDDJ2tC8l5U6EHJb2KzYLLEpb/rDKTBSVSyfh6IvpIF3Bho/Sys5i6hwmg==
X-Received: by 2002:ad4:4ea2:0:b0:6e8:fe16:4d45 with SMTP id 6a1803df08f44-6f23f16135bmr58411176d6.41.1744411962994;
        Fri, 11 Apr 2025 15:52:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95fdfbsm42753596d6.1.2025.04.11.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:52:42 -0700 (PDT)
Date: Sat, 12 Apr 2025 06:52:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH 9/9] riscv: defconfig: Enable PWM support for SpacemiT K1
 SoC
Message-ID: <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-10-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411131423.3802611-10-guodong@riscstar.com>

On Fri, Apr 11, 2025 at 09:14:23PM +0800, Guodong Xu wrote:
> Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
> to support the PWM controller used on the SpacemiT K1 SoC.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 4888529df1d8..9bd972867e0a 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_PM_DEVFREQ=y
>  CONFIG_IIO=y
> +CONFIG_PWM=y

> +CONFIG_PWM_PXA=y

Why not m? This can reduce the Image size.

>  CONFIG_THEAD_C900_ACLINT_SSWI=y
>  CONFIG_PHY_SUN4I_USB=m
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
> -- 
> 2.43.0
> 
