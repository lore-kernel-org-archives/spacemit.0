Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615610;
	b=w9ygRre86LQtroZDSTcn6u9qJPpJ+XDc/xtd2jIcWO80PKVtIeBRa4zMiEhghGTs3z6I
	 vi7wD6v0aaTJhpTTargzc0K/JTQFdIQMYJxmbm9XN2Ge5813hUgsO6WrZlLJVZfuMqs4p
	 KKCn9ElW+F8UvbgqbpZXF76LA/aEI6GATZDQixocygy6zyt6rzJtDSrl61ShDimL/MiEr
	 UERWuIBRCFwhfLkD9yRN7OHpqF9ROxvt69r5DkKpUZMrVnUISZk1TabP5sdwM1Htw2Vpa
	 eYQHR5mrMqB4MvyEzVoRToXi3QUMtUBUTfkGX751jDwFBUP0RmGFdGQ8KTcCFzK0EVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
	b=yKe1KJYvDSJBeDZcO10bSh/Zemof8vKgP2yS2LhXsLMASe7/r3Lvd1GP+JGxzlIX+EG3
	 cU5cyLRsdS7qpfZUhOb0OI+Mgn/B7WLVrEMuf7QY9s8V7roowvVGvWKlGAO7fGFArWwdO
	 IhEL1Lo5Dd+XNLj1FVAg6eTRzCZ6KsPObiE2x6AyO+4GPBRyxkw1NyTWPlALCsyvmZIKb
	 1xj2KBRxuLdDtmaTHdjsc9rmXu9yPazGFdE1A0gekv7wSmwnsjMaNsIO56txLVmE4YJQf
	 Doc6wernJcPEd0d69kz9NQ1KXaePJuDMk1WlaJS6YJXyZHK3cnNc0zv59slf0QwinKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5Rz8Q3W;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133F606A32A
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 14:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5133F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5Rz8Q3W
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so813029c88.0
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615608; x=1796220408; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
        b=f5Rz8Q3WCnDXe7VxTYvjHV00Yw06iSiGaYXGga815OA5+xrQQy5piqaFS98jNXGcUm
         feEDrpLlCDhkJu2y/wmIQ5NSngtSBK10Gd5E6vUWImjnxkwGB/Yi/pCeRUBJSXwpv7kE
         995WgaOJ+pqq2IfV2IIQV2H0yxbsA2lJ951lCNtX3uAPRxBEfASYK0thFkqeZqrX6Aa7
         WFjZbqZn+QfmWb9IcDf4TTf3Vfcb5/sKY+KdPXq9ExCkT10R+fsvFndTFyQ4AyBH+oy9
         XIlXUxjXbM1gv8EUkqKACx4G9DMz9nlpKFr5vWJWmAO3iar2oh8BWGDpqw3v18LEWOUi
         iNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615608; x=1796220408;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
        b=FKSA0Zrg5AZpyYDal+jbz9jhw7t6TG/yQWedLVr3/eLVWqeqNGgon2mVB0K34Q4VaL
         +r3HWkgzkNqX/I2VaDxhf5eDoyxCg/5DaNkg5QflUmTVfSeRsGlgOHWqR0/LxJfqrqXv
         t0fAROavBJ2YoSPlJ7gLb4fjoXQcU7eCY7iwSVFplFFU3aPdouglMT73zrdpodDJMXGx
         vJ6z3YsgmNCi3OT6t5b5H6iP9ZfQkXky+T/j6Q6q08e1gKHhSs0nyctyY8i/8TuqzcjY
         WZDvnqBXHhTkNolWRnWsMeP5I9dCTOf3jlaoFZY1YHaBNE/JNr/yl+nTZojNWp+UtMI1
         kufg==
X-Forwarded-Encrypted: i=1; AL+hErH6fxweZMRl5ettKWdMQysHC59I8VqkRJ66e/Uk9GXJOsMWjSSl9iP35fKcJmUA0J81Y2QgPZKdCw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6XWPfxKoIqQVHvq30+s/8v1grMim40If6w6KvtcZ3SnKWWH4v
	6Z8mj95bAWmIjMTehf24QHmOnZxOaBJSh+DWsmSbhk5/D4QTAW7T6pzw
X-Gm-Gg: AZFdTZc7t5+jgMTstNIYCx7K6JKe7a6FDeumIpl7ZZ4CKNUDeqBASOreNf4jhfxL/QA
	1BCUIBKaJkZ8iZSF7NQzMVTt54INRR/4U79X2ZGb+bYBzrGmvpK1YevGphhpfMuRv8IaHtUkJHd
	oQce+bV88l+YsInA2R4WLxaIjSojOhCxL425/J12m+3plpsepsBrxLIHnC+vtkSDrpui2ExjYkf
	Zie34vcjHZV/i4XSRH3d2mglyDFhU16tT3mMjSVSTeCbUEYil+/vbEGIaMz5kDB3fVqz2zfgNPJ
	pHY5nANZQ0/7q1gjsLGta/QU0E2OakYTUXMC6rnIWfVnjzgQECHTvpVhMdF33KiRF3atizJhFO7
	c8W4r/kaYmvkZw00ILJ1dDfxY6umJZfeilzKOD8vPdDFj5PJtxVIyTwCSWu0iLoXZvo1AfNz8d8
	z6Hh+Qso3vDLdQdeJchvD/J5cYfbbmrhgQxr9k/wZT2J62P7NiEPCQJCUjg3SJpiA/ZR1Nk5FRV
	+pfN9ynIt446o8pFfTqUKTkR804yo3zd3e0p6R+v3WEc5WqEVbu/mb05U+KGwJg87O8/pwIclml
	ZUx6kbJgJOiBEcy+fMIaBfXlTmJHQsi7Y8gpNA1LGA==
X-Received: by 2002:a05:701a:844e:10b0:1b0:20:6444 with SMTP id a92af1059eb24-1b56e185990mr10444498c88.39.1795615608143;
        Wed, 25 Nov 2026 06:06:48 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::3003])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm61981028eec.26.2026.11.25.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:06:47 -0800 (PST)
Date: Wed, 25 Nov 2026 22:06:43 +0800
Message-ID: <eccf3f1e6dc94fbe847d112e8804c053.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: James Morris <jmorris@namei.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <87eaeb2-b6e9-9198-b9cf-7e9f96bdcbc@namei.org>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <87eaeb2-b6e9-9198-b9cf-7e9f96bdcbc@namei.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi James,

On Tue, 24 Nov 2026 19:53:11 -0800, James Morris wrote:
> On Sat, 21 Nov 2026, Cody Kang via B4 Relay wrote:
>
> > This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> > a new DRM driver, a new PHY driver and three new bindings.
>
>
> Tested-by: James Morris <jmorris@namei.org> # CoM260-IFX, DisplayPort
>
> Assisted by an LLM.
>
> v3 on v7.4-rc1 works on a SpacemiT K3 CoM260 IFX with an Acer EDB323QU
> (2560x1440, 144 Hz) on the DisplayPort connector. The DRM, DP and PHY
> drivers were built in, and Linux ran from an initramfs with
> clk_ignore_unused.

Thanks for testing v3. I will add your Tested-by in v4, on the PHY,
DRM driver, SoC device tree and CoM260-IFX patches.

> The board has the vendor U-Boot 2022.10 built on May 21 2026, not the
> uboot-for-k3-display-verify branch. That link in the cover letter
> returns 404 for me.

I will drop that link in v4.

[...]
> Two observations:
>
> 1. The HPD interrupt never fired. /proc/interrupts stayed at 0 for
>    cac88000.dp in both boots, also across the unplug and replug, when
>    the stream was running. The connector poll caught both.

Same on my CoM260-IFX: the count stays at 0, also across an unplug
and replug with the output on.

The external DP connector is polled on purpose. The interrupt needs
the pixel clock, so it cannot report a plug into an idle port, and the
bridge leaves out DRM_BRIDGE_OP_HPD there.

> 2. With the monitor asleep, nothing was displayed. It kept HPD high and
>    returned a generic 1920x1080 EDID. Link training passed at
>    2.7 Gbps x2, but the monitor stayed dark until I woke it by hand
>    and a later modeset retrained the link. The kernel got no event
>    when the monitor woke. I found no DP_SET_POWER write in the driver;
>    could the sink be left in D3?

Right, v3 never writes DP_SET_POWER. v4 will set the sink to D0
before link training.

Cody
