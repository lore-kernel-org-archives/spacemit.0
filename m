Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB791E49F
	for <spacemit@lists.linux.dev>; Thu, 17 Apr 2025 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893312; cv=none; b=ZHBWcPhsbjDjv5cKB0OZOsWWBlKHtinQ2FanDrDcNc1VmlFM3Hyty/+4qd1M80e2LdtXswBqD417ndSd1nyWsjh1djr5j2xfgIRt+boXZCLh/jh5FNidhlAs/7LCs0RVMkOH+SC01zxl6f1slnsDfGRZxvOOWD5YY1fhbzkrpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893312; c=relaxed/simple;
	bh=KYGjtBdb7XtMLaG0d3QFZTqtsfA5Al+6Ejy4SwFGmOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ze2/UnvUmRChIpXJY6snb2GaypzMoAUXPfLV4LcJKL7DpXPXnYJ8AMt+uvXHlQYYatA+IsHolCqPWEtqZPkpbFLLm4mFJqOXc7ClMGddtT6prYVvECdTumFX4oU4Hgs0LlnmYThcne0027EwKVleml/zbvdoJI8Cz9SECjGHLLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BalJtro/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BalJtro/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso3403275e9.3
        for <spacemit@lists.linux.dev>; Thu, 17 Apr 2025 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744893307; x=1745498107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTuj486eMBPlCuVzE5Ghwv5ENmZwB8uFg3Tiow35Sbg=;
        b=BalJtro/PutRBjeq/l8je/QtE9YylCZ00tC3o4Ot7bzvPr6CVghAGK74qHTBbjjLVx
         zFh2ml7X1EdTo/BPyVDV8vskR2vDpukiaC+GHpswdyxRwNFak+OSPwgup5SFA5SycNr6
         dB3fouSIp4KMuCbpZRINv9nEFO59SGm5kzT/+vjx3WDHOZPai4ay2q/7vlB8N3ex1C1U
         CMrwpDz/3Abi3kkt2XFXBnAoowC0lg1b8x2SDvGjcMOCu/wlcriUo8AXLgKZnOSH5aJH
         YOa30J2nDZvHEljZwMPOguPs9v6gtZAZPYcaiRKy/hiygGmNvBZjWKRTj+RqRCvzLgxb
         dmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893307; x=1745498107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTuj486eMBPlCuVzE5Ghwv5ENmZwB8uFg3Tiow35Sbg=;
        b=qmtdlpjA24iuop44mwlJvAqg/fL6urCinxi2VCmEYcMu+8/UGeFbPHN3/3bH7+Stvt
         j8J0MJPlTsjnNXVcZjP/YDQJCvYfDWVYiNo+vUh19xQnls8MKdLJ+CIECPGen64wrHgN
         uVHvhw+nhl3WrHkz50MlvN580WEEn0mhkU1eDKU2A7wsGUYcRhBqs52vCMBK9460ZsBd
         TINbpt5U1S3ARkeO9PC8DC3ycYidr+GMRyDiXdeeLON1oyNjfcjqWhuNeVScNGhT/2b+
         N7rTQ4VLGiEYLpqyH/0fktYuYykziW21ccUS8O4Vh7/SPFhzuXA2xKbjF1Qdtzz2Jon8
         hJsg==
X-Forwarded-Encrypted: i=1; AJvYcCUEgaG/tfaJb9QwT1BHvHEOfePFfnGhp6Fk0RrD+nCU9vfHd76kVXKJ5bM3Pbuq5XFpWw1wV3kd+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQyEzl1oBNjfqJzofTChWJl//68n0mSYP7uKXkMrGzdfDN8hc5
	zIQO0D0gAPfLbClGYjRxGPep5x5ak7VK6E+/2SuHNLTLlj5lWCezoSwaBrWV9ac=
X-Gm-Gg: ASbGncv8HYUSZDy/qPmm9CE/kXdykNUUbohvR3TwnzKrcyP5HTSB04rx1AjZSW/radm
	VD0SVt/yAN3E3do9La7VhZZd2eGFEvgdPzPD9ORqziDtP4RKZbQAb2h0kfZqAGYOJ91hjMpDwoc
	r+Mt8IKPMj3HoggQqQA0mkzd7kxKlNENBvbjMDEush15bo1oa3P1Ofi48lmSM4kFAdDUqcXLtuP
	gkSnOJ0oQzKwH74Z1A8srzX1IoX24+27ES65CMiRfdObx88Gg+8+fXcs8YYzWangtcs5wwNVSFB
	MomZOXY9RItHCHkAfWzPq9eEXd5uvVh72ngzEGduXKfkj+b/VIc=
X-Google-Smtp-Source: AGHT+IHsx+KpPXNauX7YJ1CpF7I0pEn6OThh/kiz1Tij3RGxo6jg5fZyTZOC2u0bvjB+NaEYetVrHQ==
X-Received: by 2002:a05:6000:402b:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-39ee5b13247mr5200859f8f.11.1744893307325;
        Thu, 17 Apr 2025 05:35:07 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9b49:d51a:4244:693c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440666705c5sm14418765e9.14.2025.04.17.05.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:35:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
Date: Thu, 17 Apr 2025 14:35:05 +0200
Message-ID: <174489329731.7849.17910336598453828998.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 07:31:27 +0800, Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> The GPIO controller request the two clock sources from APBC block.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: gpio: spacemit: add support for K1 SoC
      https://git.kernel.org/brgl/linux/c/378ce04c79d14c730fcee6db9f3076da4078b65f
[2/5] gpio: spacemit: add support for K1 SoC
      https://git.kernel.org/brgl/linux/c/6149376c9ad1777aa4214e13d844f12f88e22dea

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
