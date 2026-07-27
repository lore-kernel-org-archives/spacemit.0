Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2461A3F6600
	for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145664; cv=none; b=EoxL5fR9UivoWRigyZYbBO7JqpBVLP2GOZyhd6ttlrGnEqzGFGwdY3eWYfSsUZzxB49xfA/kGZ/KCts8/IlKkWjyHkj3KC8b+ThDABcoXMcUrkwV1iHoBkwR9HWyMKJ6XFYwBCkCEsT9Ht8mHP1gX8QAT+R9Q+K5DcxYQgqnc2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145664; c=relaxed/simple;
	bh=QD3t63uWxKq2du3y4d4m9Juyuvd2MQBM+dVhxe550ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AooXIrMvwqW5Zvj+KdNjubxiMlGMgx9h3tRzizsB8nyAoIBMLoDTjp67JUPnpyYaOnUyh3D8gupxNKQfW6j5ery92qjrooeY+mlmlCIXAD5zLOSqyZdCUj7wfvnqhyzdtHH6b19qN6Yggg77NRblQLR4I71kgVaNYPKtLTLyTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLQ73OzM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLQ73OzM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2694382a91.2
        for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 02:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145659; x=1785750459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLPhM0E6IPzEl+l07UYYijZDLOCaVV9s+4+FtNKHwms=;
        b=KLQ73OzMgicOBwSYzSpr6mMppKoORb/9p7tzbwG5mCysbHxYbeiFuxLFOCyXCvoEI5
         McQ2CQeK1mHfQWo/3tRdCuOSwNT5oLRxZWNve8HXQ5z/Q5JEMrcc0yMs1iP2qiXA/Xkg
         8qrE7SpHRk6WQgaoFuK9lK/NjN87sC5P7NFGfDZjwbr2CkuYHZR/guHb2YSm8XFJrsfl
         SHdiI+Yuk4aH334ipipnweh7vc8QIbkgzaFFDaPIe/UPaHZ/uiA1BY+rN+WaTLcdTnBA
         Nujwmztns2YBYXwhIwCeK+lgSitxJiPeUd7jm5BWvPYRfZOyo8/Cg7K4hry+7JToM3A7
         5ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145659; x=1785750459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLPhM0E6IPzEl+l07UYYijZDLOCaVV9s+4+FtNKHwms=;
        b=tY/7mRzQTeKoItzwsgCf3UAnsxusHJdhIrOkzASJT+UjAsKLrjKYTeWbiAqtbjy778
         nvYGG0qxGJ8TiYgu8XdYP0ZYvmwcQJpyTJ+PrEGPtclCDT49u8Wm81Lw/sLXlRbwLiei
         qOSkMYI33KahvMbs3QM9egeLmlNQuayUOCY8PIyXM0Tl0xP0L28ISJi5RCgDPsS0Tfh+
         aBgE9Vc0bMxzPN0LUo4WfYJ5TRRB1stPJX+ONc/FO5ryX7F95R0WKtsj/5GlnN3exWHm
         /Zw3QOoQlphIYiD5TB/ibVRYodWFsSTGUPiMYcKoltKqDpq7fMMvC+kLvkEHH2hiEuev
         Pk6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKHmtTHcplxBIYbaITVQCE4WIGbPVpCLzWM7I8xXwreGHYifQIFbLYjYt4OVhncQbvj2uc4rmRqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGyt26b8rfoiQklT9le0HdLrbfFNcskVwTPAZ1tCusvNPQ2Cgp
	7q8XEKb+aUWOX1nBp4gSa1azAEMuiHhafPbpshPY2T4uFeQjLO6T+QKA
X-Gm-Gg: AR+sD112JNdv1xkvd3OYVqewifR94ZesLD7MomSTGfc9KTPxqzgLh9Hy2oncdTmFiZC
	aquMux1AB5bjbpaDsStVoLsA/X9q3ihCQtgOtZY6UPAyp7a0osIxwVAmsSpBmg9WbgbS/sGKlCo
	VDAhQgv6IcgOVysQaclvmeincHvDkYCHl1e5oKNGrmz698aKXTHkh3Lqyc7H8rkOkM80BJ98ewg
	RYSn67RrN7V4biw9pm8kGFzJGwX4QCOVLyHytpEmopdTX85m16AsuPiW4ku575Q8nAA0QyYr2hP
	AhEzgSvtHRVLLTrx4GYORUuvnjZVLHAlTrHDrO8rn7hW7G8rSpT2klsWfx6iQ/c8G+AIRWCuA9Y
	L9D3I8O/Qhzx4OXGevUsk+cCKAS7GVxj+gok4YRA7VSEkerD3E9E0L86BqkqQ/NLZJ8CUkd6cCU
	xe
X-Received: by 2002:a17:90b:58ac:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-38f57f34fd4mr1073921a91.21.1785145658748;
        Mon, 27 Jul 2026 02:47:38 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4893167a91.8.2026.07.27.02.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Mon, 27 Jul 2026 17:47:22 +0800
Message-ID: <20260727094726.890179-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS for series:
https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com

Changed from v1:
1. Fix clock of usb3d_u2phy.

Inochi Amaoto (2):
  riscv: dts: spacemit: k3: add USB controller and USB phy support
  riscv: dts: spacemit: k3: Add PCIe device node

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  51 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 237 +++++++++++++++++++
 3 files changed, 321 insertions(+)

--
2.55.0

