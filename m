Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7F1FF5EC
	for <spacemit@lists.linux.dev>; Mon, 16 Jun 2025 07:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059846; cv=none; b=O1RBit59E/6fO5/dE8jnH2YLfQEBq73KgkuxYiVptgTVEOqfLa4bFLfEPALB061W2mHOatjqujCx9TGi4p7YeOewX4ghsP+FqIQK7Br7G1LH1p3hY77l+x+7RcNc7B/9ROL9RmHWyn5PsIv2EckyRF/Qp+0kdrPErAAZzSlnodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059846; c=relaxed/simple;
	bh=96OTwG6/iG28bTHQxzabxipQYNEL3wxef+/smJwNLYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCsrgAEYHrTJq64i6PcvQcoUThmvfrdEKiiZ35d8WRadIKkGwhlwYVg2kdfumuCLWV9Aoz11jf2bj76wDfEVs3ZINrNVjCwPuKnPaC+2F1qcCWESh4UVt1We1WaHM76621pEdQiTC6r5Ftz3qasgcUkugTJLaFmvJlOOhcmJ5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2o3mLcTO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2o3mLcTO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a5096158dcso3615357f8f.1
        for <spacemit@lists.linux.dev>; Mon, 16 Jun 2025 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059843; x=1750664643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=2o3mLcTOJvtDYYRUQRMC12ObguVXWo/tRWGQlskQcBZvynK2dYY9NEr96NKSCYHZ+T
         XRJhOiQOaRFIyi4W/03YWAFjfySXtg/9k+E+f4oBPZrDV/Fi6b1X70CUvOncnMqLMUhB
         xxVud+a2SORDR05GrmFXjQhU/jB6mat60zZbkAhrKUBeBr7RtNupq1p9a/5BxnxvvNsV
         ewW/pKC7qQNaN9vo16ogRPGr6r+c5XyikBigXDXhyCFMjPRXnv1l3fRHP0Mx+HAn3br4
         Fvpy5L4l8W4ap32UzvxFYYyUXeHBB78nGyholVStjRbKVvMl09qpmqgXzYrH3oiFdcvK
         jluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059843; x=1750664643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=smp1v3V1HpOWNecpmNJLqbSR94cRxPkuCpoWMWiaiGFLFQFQmEFpeqMeKa/I7ridYK
         0hZWevJDD4apBLYuGcIgEm7Ts7gADPv6/cRgcUmxX1T9SfxjP4s4z5KoP6+OONvtKQwe
         hG1dO957zhE2F9KJPQWES717uKlytGZV8c+f8Qc/7PAEpHdgNrl3wbchEEUVmGeF9JgK
         FPDqP8W8vjmD9cIBl3vaOscYSFy59nwwkhmqDt+CHHrG7YikZCKmA1sWU+FJsp6dkWty
         1nethVpMxRM6RfzcgtxTXSsARBHUngQFILw5aSSVmL6l+FLwraYtZzmOFELAkWC+RSdm
         osbA==
X-Forwarded-Encrypted: i=1; AJvYcCVp19CVOddciKojCt8UWgKJH1hmEkz9aLBur+wRIR243O+d+GS/xdJpCSFph6LOesAoqWmrhlIm6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWN7HSmjeOaNuUNkSGSPYrkNtqsYcnJsMEQTmdBlNAhUaLWJLo
	uSqePdWVOkHZxMFNlYkFrk0ZwNaixpAZs3L/uTYukWQz8/tlAoydZkgPaoIg50DMpEw=
X-Gm-Gg: ASbGncs1Q3tiwGKbS6/YseBTE8rQ3J5F3LdnrNV63/ChBT2Agp58b+ozc8eCYlCa5SU
	CrG4F8tEg4nqO3oeZIfmlEcgsgciJRjbFs8CKGaT2YhDtFgE6Pvm6sa8cRPz7+p8Ei0RuY6sMH0
	sntf5Zpu4vMK2Q8akQpYBoEWEzxtBuzFdOyd3y7CtBiCUKSvTz8a7NBiN/ctOpjrL2MiutTT/ut
	vRpcY0uZmPiltmarafyQeBS7DGXn7D9qhZowjADN1nlsYN7sW2i7vaStZw7aHBS+JL2KsLk5rkZ
	LlAmepohmCmwJZlwOrzfT7mEWu23FHZ3l0tcVK5R2pXzKIiH+1k+HNr3G2EDVdo=
X-Google-Smtp-Source: AGHT+IFyiwrOAI2w1hU8cdsv4G6PwQ9rykHzyJGCDN95ThomN6k4mm9h9BfNGYN1cWwJ8JWTOJssQg==
X-Received: by 2002:a05:6000:400b:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a5723af786mr6649593f8f.42.1750059842782;
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm134543945e9.37.2025.06.16.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vivian Wang <uwu@dram.page>,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
Date: Mon, 16 Jun 2025 09:44:00 +0200
Message-ID: <175005983908.15867.5595150226500672210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 17:25:33 +0800, Vivian Wang wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> 

Applied, thanks!

[1/1] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
      https://git.kernel.org/brgl/linux/c/e6382fcf989074566bb9a54bbd3c514d7bb99397

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
