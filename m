Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8FF30DEDD
	for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758146852; cv=none; b=GcUx9oUUUq74MWVaK7Go9LQVVjOa3A5i3/BfoCpPLrMaxzlRoAqsXHodRuB5epFZ/k8C4mbWxpWS58OApwY0R/8GsgcvpezxJnKSsvhUn3N3RAL3iCt5KiBQ6NBwXleQkkl2T7121Kenh9hKE257SrLAx52XPKhDniGFVHBejO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758146852; c=relaxed/simple;
	bh=nzUaN55jEAng4Zv9fz+h0GiC5YvS42PpGZXeLpWjU3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYQN55uWgCid+iWFVWEewAdyzcYbcT+gP4ayy5yhTeErBHD1QI3zPSTxSY4RqwV9XV2uIsxZy6I9ki3naptjbRkI7eGOa7SBoyHNj0kwGbHnNWpfnbvsu7W+7+x5LKW9r8vlz9RWB/x8HA491ZZDtFPl/h6jBPOTKIthlxLiGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=w/2Ggrta; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="w/2Ggrta"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-88428b19ea9so47917739f.0
        for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758146848; x=1758751648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp8RbtGYlwCTIrM7MVPtV3vKCoFBge4Bz36KG46LLsA=;
        b=w/2GgrtaD3HVs7ZKiAWMX33grhjKUtaFeqOrcXXfzBdkkiYw/FgIhTLyiObd1x5Tpw
         AFAzTs2WsUOhkyps3EDMx/JqB3rZCZQQ7zwyhB75YB6JCrCu2WAnjcJAJ9ArGyNq62Ya
         gl4UYCaZ8SOMis64neV23zd/2qaK2wIraHAj+p43Pgfva8azFhk4nJO5biJdhFxC7z/M
         ZIc5NPOXqgDEKaUABsrjjp8sfiqXtY9VTvBWcEjFZvIkz7TSpsDwFe5m27RnraXWoKzS
         kxZJR23HE8y1MjDx6ZO1KB7FaALat7BiQs6NmT5oXix0b3oXdbvDgF3ourspxwjmaJxc
         We4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146848; x=1758751648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jp8RbtGYlwCTIrM7MVPtV3vKCoFBge4Bz36KG46LLsA=;
        b=JvTiPX7tawKcCCCOlp29/yZ0P/59Xh1uEdROucWt9xCw3RKwRznC2YKpZGlC9PkO9C
         5UFgXEbiFfStYOzVAwGqBh7I0W4N2T8wHZwdaGLXFUy/UNvEnB5gILXaitfhWoKk0PkG
         TALrG1W1u1H5+qCcUDYAxrSHDluAfL1lrcc7YZ2H+Ie48DnCyXnptnBiddnu7Qt2ZBN6
         02E6mafYy7OhusGir0i2GKKwzjACDwXaxpq3hXShQVLCYnaadezXXVf9Qi+tHyNoXcvW
         unwwiKVHndZA7VPd5NDJzIu746J8DdTxVfS4gaT3QGu95AVboFsv9LNyznysdjdTMLqZ
         kiAg==
X-Forwarded-Encrypted: i=1; AJvYcCX2xDxro885lCtY5L3fyCHF2Pel+HLWzBnV8hF1M3TNC8ckqjPL6nKZtfQEA0Mgy7u7sNkatONH1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtI6Fro813gmxpugYxMl8TRz3iS5aNGHfBiEbOxHEICQMhnaPj
	vj+NcdoRhO4zbMOswLcVR0jc15GDWl+izbNpS8cI5glk8TXoAtXNkxvNKNFNWfqx9/8=
X-Gm-Gg: ASbGnctf6bgByIFdPFH2+93XFj0hpp19WkL182czLv2UP2ddGXaJh8Bn/NBnTULcAwV
	jQ5pARfIpIbFCaEONMarrEORPaWnImZSRjGpHOmgl1G8U5xDMtbk0OAwiX5Q8Ib5pNRemw4ntrv
	sYZEZzTwHO0ykMbuQ9LF2ITV42CVWAgg/gBLCQyk86gCj4WWikpUiZQxNocyeJlA8+WFJprITtH
	aadfLXxEFwuzXcHlc7lEsBpFIDgrUia/6c9EYdDmmKUCP9LfeO4V0NKUyReJNyt9Gn2wbOr9xNj
	/Ngf3pGvL41jYd+LIWhqkUu2pZMLx95RONKsJcJLLyyx/jJE94SXVna1cKmskZEL1xfGfAgivMk
	mmXoMYrhBeT0MidmSBzjs9+5IGutIM5jazwCiC5u3dnf3nc3q8NTSZFkm0ar9lo4uLd2xM4TjCV
	Xn1JsEaHwIA3v/TtWJtVM=
X-Google-Smtp-Source: AGHT+IHKI3XQBkBxfHfdLx0gpZ16Wz3vuAMqg+Tko1i9TXarf8MFb1q82xDwIkDYWvOkJteES4wzxA==
X-Received: by 2002:a92:c26b:0:b0:414:117d:3186 with SMTP id e9e14a558f8ab-424449d9c55mr15071065ab.13.1758146848530;
        Wed, 17 Sep 2025 15:07:28 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9f6fsm2346335ab.22.2025.09.17.15.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:07:28 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] spi: support the SpacemiT K1 SPI controller
Date: Wed, 17 Sep 2025 17:07:20 -0500
Message-ID: <20250917220724.288127-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the SPI controller found in the SpacemiT
K1 SoC.  The driver currently supports only master mode.  It has
two 32-entry FIFOs and supports PIO and DMA for transfers.

					-Alex

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

 .../bindings/spi/spacemit,k1-spi.yaml         |  94 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   6 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  19 +
 drivers/spi/Kconfig                           |   8 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 985 ++++++++++++++++++
 7 files changed, 1133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
-- 
2.48.1

