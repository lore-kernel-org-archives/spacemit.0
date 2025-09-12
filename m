Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1552C11E8
	for <spacemit@lists.linux.dev>; Fri, 12 Sep 2025 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662028; cv=none; b=OaFyUkzO6l0mH1D9PPgkmcHqLG/dCTfVSbyPIRD40QR/cADon58qX2mnTulHasj4DoNYlAfdp8in6rO2lZEwPUuO5jfQczk6T3ZeDUar/OAgniuJ7dG2SrgvcBpz9ybryhki9153DMsg/eLpNxMq2f4e9nNZWgvCDve4FdA5yLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662028; c=relaxed/simple;
	bh=YXXUSLkyXM4KjeY2HayfH6nkGnEcg3K/wnzkLpbNW/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQ8ea8TTXeT74HPuYYZU6XE4GtEtwzdxi0PUOx/iByrDiJFLUaHSewi8z6fK8bQLthwO/H1TpZe7rDLYA/Xbyr75SLj+MGgsLxOHrzeJZN8mkL7EGcw7YDnCENEk7ZAI4LNFrW+sgVLTa7TACQn/x36Cnd3rJxNKsFaUO5Z2x/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vdPOECEu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vdPOECEu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso12568605e9.2
        for <spacemit@lists.linux.dev>; Fri, 12 Sep 2025 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662024; x=1758266824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=vdPOECEujrBY90XWWMUC+gmqFOy0IkohLEloRJEmA4rUI9E9DjNlxxEgOeT86YDC8g
         024oRYkDMLOyEiUCZVf5MAb+HWDR46XdtFtVzBR8/1rXSaDpl6Qvth16Hjrc5C55c2ZD
         gzPOyDfKfuaIqPP65PgUeeO7pbcDV75URox1F1X/640QwfHmbzEsTzhBDQtec8lctT7P
         PRhvkB/XNx2ZIqQ26JOfe1izmLepPjgLHg6HW0bKe9WmTHIN5Qe6NZIBALMot7+E1RFI
         SSymCAN4ITOSzx7kjKfoFwfTcjlIQRU7RkaLDUcAX8XTpeU4CHIk6J2vJHKBJ0xP+UQ7
         86Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662024; x=1758266824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=b69Zu4xT02C/MlcnChSnS87RgQQxFoHDcskdEfmkwQYuU4bXG/hcZBZyMheXqlI31T
         KmwWcbnDIBSHYIkPu1aes0thoMNfBKntr1W60XYbSbDV4pPNkMHPg9Q+Q/gtw4IokQaG
         GAFfVFhhwvrdsn1NFWmDnr34c0R47D7KJ2t7el0GWs/GKmhb1BzPzPIyqkNcW8lRgFoW
         XeB3udxNIa2KEsOPoFqcxDlsJrWczP2J11dDS8V7ttPEmBRtdjwpSO8jFKD1YE5mewkD
         BdZzaipWfsqOEII7Te0i6eGbfdjTYA+FP1/4b0KB4bp/mHXW+LF5wzZZVoH5TpaO6A3u
         Y/zg==
X-Forwarded-Encrypted: i=1; AJvYcCUSQgA3OwQPEiUVGEFQ4ne6NZP7uOR5HVuYmeMUCY7sRo9LEPqYjUtwiQFDABXK7tCdRCgHX0Ya6A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0fVwwdo7gNEt+ZTCfGPRR2Fw/G3VA5JPPYlmMQcKBqSd1MYL4
	mf/LPGDeSvRFOOHJvbfwZZCI42lXwXLOaClGApebsYOdrt+x82nP1GaphZBTEJwSt9A=
X-Gm-Gg: ASbGnct8/XzA3kt8wcicLS6WBhuGIqZHuOYVE4FGqmwa3VBDa8c8FJ5T+uF+R4IV9bd
	/icEiCpdsEoFGqT3+hacbTKCAF0ymIo7+LmH1MBie0884yHoRTY7HtxjWDN16Wqw2be3s4esOQ4
	VkIdyVg8AfntxwKgjcR9qZaGMEW972vYc6OUhnG1P3KKp7wqIFOUGVwGzQJfGih0cvyhW6qPAvA
	l2ChB225+yMKT7IY9Mz1Q7AFc3oF0QzgAWvGTeM7ulAB6bJGLBqMn+1Yf5DKJDwlNurlB9a1IEa
	YhSaM9A2mrV8H/2rpz+qpgvm4hhYOiFJ9Xz66TjSPmeHEoj5dah4GVvQQBDpOP7JPH5Pc7Lpnsr
	pBNLFN5au1RbHqS0sHuuKDLc=
X-Google-Smtp-Source: AGHT+IHnJFZvdCCeCxhMw56xuAjolN8GpBM01BpNCjssGvJ1wLlPBDHBDYHA0TwsVBlYSdL7Ex3cDw==
X-Received: by 2002:a05:600c:8486:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45f211f7aaamr15546025e9.22.1757662024343;
        Fri, 12 Sep 2025 00:27:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its modernized alternative - part 4
Date: Fri, 12 Sep 2025 09:26:56 +0200
Message-ID: <175766186360.9646.5204996164911945151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Sep 2025 09:12:36 +0200, Bartosz Golaszewski wrote:
> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
> 
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
> 
> [...]

Let's allow it to cook in next for some time.

[01/15] gpio: loongson1: allow building the module with COMPILE_TEST enabled
        https://git.kernel.org/brgl/linux/c/80d7319c7a2a9865dc730422ec7227bfcc92e6bb
[02/15] gpio: loongson1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/116eadc92b4c47277d660271eac1efd4afd33121
[03/15] gpio: hlwd: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/43dffacf6be98fb31aa7790d693adc29276461f0
[04/15] gpio: ath79: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/551a097118391018ddc4079cbcec6fe4e7d64bc5
[05/15] gpio: ath79: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/e7a3a1be11d7e786924ed7af3b3411def2e46f21
[06/15] gpio: xgene-sb: use generic GPIO chip register read and write APIs
        https://git.kernel.org/brgl/linux/c/36f30f7ffc4b98dbd49deec8599cf810e7006cdf
[07/15] gpio: brcmstb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e8bd2a6a5059043a9f13a0723acd48c1291a55ff
[08/15] gpio: mt7621: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/80fd7e96d669d729d9e01bfa3e2b60ea6b500e20
[09/15] gpio: mt7621: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/2c1f22fa54fcbf8fbd9c03f5d341c73ef36c6d27
[10/15] gpio: menz127: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/b24489af4500720d8ad57c55111d90e762133c50
[11/15] gpio: sifive: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/8e1c8ccc1df8b802a7a1b4beadbd8b87fff1c3b3
[12/15] gpio: spacemit-k1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/063411108de622a26b36487a711903443b0e864b
[13/15] gpio: sodaville: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/ae9a52990b2cd62e0555adad92d8fe9e431d1bac
[14/15] gpio: mmio: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e43e94fa19cf058c4e465fcdbc2f521123058ea6
[15/15] gpio: move gpio-mmio-specific fields out of struct gpio_chip
        https://git.kernel.org/brgl/linux/c/9b90afa6d613b66ec4e74ae75f9bfa5baf386ecd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
