Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44A93D8121
	for <spacemit@lists.linux.dev>; Thu, 23 Apr 2026 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776985469; cv=none; b=PNXVUJ25lg8L/snWWNRPTegO1IcukZrYNYdFcKH1StZR+bMGsJL3PjIZKYZUvn7cw6WvgahjDMlg98a4zdbm5P6s+5pIijUxALDw1JQ4YNnmqnrZkbPnqBE87L2Xe/RCWXmC7UeFPzW0h2ygNcGOGqGI8DV9098nIwBEVwQsFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776985469; c=relaxed/simple;
	bh=2K5W+DeoSAgIGSXPuf5OIFDLzAS3TzoiorNSKxhGorI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DtFSSUgMYMrK1H2LMFq4eCpDpCDaTb0nkqillcS//DH/oBWm8WhkDgBLQL9zkgsLtkzYpSl5MhaZoSF4JMkALJnldqvhVCY2IkRhECF9JhGAELX/nr1wB5OcRHiI+GSW/gNLV9UQcnMuLLSs0xKLsW49lFA6U+lK+PHKRrh24M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FILNMlNB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FILNMlNB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so7711454e87.2
        for <spacemit@lists.linux.dev>; Thu, 23 Apr 2026 16:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776985466; x=1777590266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9RlDzCHwvVoLD/T1N26pKp2/i9mgbsKP9KFqAoWnRc=;
        b=FILNMlNBeRBvCFTDDAux0Hf8M0Et3fpJl6Ck+sZ4n38NIyPv4Yz9pet1eoRBoGXxQ0
         co8IlC1zQhRSjZHN4VCOhsWCX0IsY2H2NdQLQAUX3s2AdZESs4n7lEMwQTcYwR78ldZ6
         Fh/a/HvylUsvdh7/DDqvh1oRREo9cfJTUi70HwwF5zW6HtwS1MM1yTkuBkbP1g+VUK4P
         3P7sn6yeHMkiZ7iGqPT4c/5OjDWTQTXIqdHdVRBeZDUwLeAbdE786+RBRahYLtKK/8FV
         3b5MCPKGD9q4dkS7dc8orFQ2j7sCe07Zy+uD/hY2GZaXFf5mPNysXp8r873uaLiLxqmC
         KnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985466; x=1777590266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9RlDzCHwvVoLD/T1N26pKp2/i9mgbsKP9KFqAoWnRc=;
        b=sIA+cbMqRE0fr9wKSriMGjBK93JJ/1bowrd8wyjUw++HwBi9LchjRCbml3VsIVIeai
         uWEzWPexrxRi8ge7Nb5RpfBd7RtWg0WWiRzRDB47J7RrYmrgEHiAoE+VVWVIuhaSSccr
         dQruBRJ2/55qtNXFRFzaKZ3/bIYh0uKib9mjtJCokGSK7RjpLJ1+BYXICmAG2Su2I1WJ
         VoWuxVW4nLy7OofGsfYMb6KsszwfTPHCSjDlPhJgrwBZLQecmOmr/jVMeKNEq3aUWzT1
         0H3gjwy5rP8gqpTp+n51+M7n9XWLhb7MT00FRGbS+lEGjGbMNH/+3y+yKSrsuWOYTNiF
         imMg==
X-Forwarded-Encrypted: i=1; AFNElJ9+is1ZbI/4arZIsrAMDGyJGgv3pMZ6rScjpHbX9gSZ6Hi7Nc4CELAQWot3z4TMuer7Zy1xRHTlxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuonQQ8O8PdD35UFRHzJri64CZwXj1cy+uAjsJFUMpt/I5mc6x
	lVihUyEhLKC8eTORBVl2YGnZuGO2Dkxk6E/lphWuvY05Zwb/ef4xDPjS
X-Gm-Gg: AeBDiev7Qp810tHqf80aC9h4TLRfGvZewonyfZzbaJ58QDwvIaI4z67Lyi3tDaFYERk
	wMF6i9/F05zxnynMkdHTnAfn/x7C1esFtbAX2JrC7XWdGlnZxGC9QnRne2noFcOu6YhB/EuMP+L
	rl3zim6Yy+CoGMyapGuGf3EaFGtcFrpSXDIPabFQQPYG4ZGd1jp/vLpdsn9lsSeq1imIo4ieOT/
	1H14RdK4Apri/4JesVJ4CqNZk7tu8YrxFeQiYWpAYb5sY6CVQfj3xUF6v1qWRHDVfZhKdNGLjGq
	ROYwt+TDVoP4TkQOql0Ps8DiK9FB6oKFhAFauMZVj2fmnxXHBZK3EkVS03sHY5AOsFxfz2NJby2
	5UCjGg6T2zTJzCVXGFFWQNYIfcduHIkMehepQ+6AY1RDGV+Y+ybfwJ70C7kjnTqSfgX1KdaItTJ
	yfuczIBM7Dsg1sAoR32aHUn0nyMU+zuP5bLEWFrb81lE2GSzp4OQ2A3g2S
X-Received: by 2002:a05:6512:1282:b0:5a4:6f5:6c4e with SMTP id 2adb3069b0e04-5a4172d389fmr11928940e87.19.1776985465575;
        Thu, 23 Apr 2026 16:04:25 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm5567888e87.30.2026.04.23.16.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 16:04:25 -0700 (PDT)
From: bigunclemax@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yixun Lan <dlan@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 0/1] reset: gpio: Add support for GPIO providers with #gpio-cells=3
Date: Fri, 24 Apr 2026 02:03:34 +0300
Message-ID: <20260423230338.442497-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maksim Kiselev <bigunclemax@gmail.com>

Hello everyone,

A little background.
I have a BigTreeTech CB1 board based on the Allwinner H616.
I decided to try upstream Linux v7.0 and ran into the following issue:

[    0.453297] pwrseq_simple wifi-pwrseq: error -ENOENT: reset control not ready
[    0.460472] pwrseq_simple wifi-pwrseq: probe with driver pwrseq_simple failed with error -2

This error prevents the WiFi chip from coming up.

I started investigating and traced it down to the function
__reset_add_reset_gpio_device() in drivers/reset/core.c:

/*
 * @args:	phandle to the GPIO provider with all the args like GPIO number
 */
static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
{
	struct property_entry properties[3] = { };
	unsigned int offset, of_flags, lflags;
	struct reset_gpio_lookup *rgpio_dev;
	struct device *parent;
	int id, ret, prop = 0;

	/*
	 * Currently only #gpio-cells=2 is supported with the meaning of:
	 * args[0]: GPIO number
	 * args[1]: GPIO flags
	 * TODO: Handle other cases.
	 */
	if (args->args_count != 2)
		return -ENOENT;

As you can see, a GPIO from controller where #gpio-cells != 2 will cause
an error.

Unfortunately, the Allwinner pinctrl is one such GPIO controller.
It uses three arguments to describe a GPIO line: bank, number, and flags.

Here’s the DT fragment that describes wifi_pwrseq in
arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi file:

wifi_pwrseq: wifi-pwrseq {
	compatible = "mmc-pwrseq-simple";
	clocks = <&rtc 1>;
	clock-names = "ext_clock";
	reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
	post-power-on-delay-ms = <200>;
};

Potentially this problem could also be observed on other GPIO controllers:
spacemit,k1-gpio, microchip,sparx5-sgpio, and many allwinner,___-pinctrl
variants.

I attempted to make a patch for reset/core.c (not pretty in my opinion)
that adds support for three-args GPIO phandles.
But it seems I’ve fallen down a rabbit hole, because next I hit the fact
that gpiolib-swnode expects GPIOs to be described with exactly
two arguments (swnode_gpio_get_reference()).

I also did a git bisect to find when wifi_pwrseq broke for
the BigTreeTech CB1. It turned out to be commit
73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset control")
in v6.13-rc1.

So, in theory, a patch to pwrseq_simple.c could be made to fix my issue,
but that wouldn’t solve the underlying reset-gpio problem.

I don’t know how to proceed from here and I’m asking for advice.

Best regards
Maksim

Maksim Kiselev (1):
  reset: add support the GPIO provider with #gpio-cells=3

 drivers/reset/core.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

-- 
2.51.0

