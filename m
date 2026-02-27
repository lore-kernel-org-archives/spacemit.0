Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42246374168
	for <spacemit@lists.linux.dev>; Fri, 27 Feb 2026 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179074; cv=none; b=mx/DCnal6qsJCTm3pKFHE/taBJ0Zxt2/RQs8Mp7Is6ME4/X8muWfGBGT667y/k+Q2XygoqH8UqqWX82xy4LaaBieNM0vlrjoQ3WcVmfsfmqn8wpbBYtsLvvJhbxJoQSmLUnctxxIokdFneSc/apAp1W/nu8XsmYFs895mSpjYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179074; c=relaxed/simple;
	bh=h/CjFdpAJcVREpfZXVwfif/697poNJIUcK2DAAylgDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9LJKb5Qzw6Vq9FcguQbfhy9ArtG8gtPvBG+TPJoBkdtaO9mrudddxO/5nSH7iusFxErpCe7GWOkbRv2s3+ShoNao1eYXJbbpir2QnACaoHwljMKruKcW9FCt2aGeiWPU9jzxZaROhYqiDPJ45ohpv8Yy0XCDQj2IysZ3lQmcy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYpn+qJ8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYpn+qJ8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae239bd19eso4048255ad.3
        for <spacemit@lists.linux.dev>; Thu, 26 Feb 2026 23:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179073; x=1772783873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=VYpn+qJ8uJTOdnexnwq/Dkh78Bwh3jwlE6tvm944xyq2x+PPMU1297CyeEpT4TAnXn
         hmRjoNvx0XjA4BPUfybLL4v/stRU1bs2iFtB/KuMC9k2KAQvwh+NKLLW2Ug6tM7IiB2t
         IynjpEWWTVlh/UScKSbXfuOav0bjqJF354QzaV8S8OR3TruNzcSIll71r3QEpxGtnR/3
         XMN4cYRH9wK4mm9hQOCj2l03QC2X6tBnAMzqBoLbR4m9Sol5jVC1wNls2VQ5nyRBLLoU
         6JoBcN3cYD3jnYL/bBeCt8+/TbVrSWBO2Nf/wT0Pcq5MigA+XXuhy1VHieupMctRFjku
         4LOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179073; x=1772783873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=DYS6lZnz0cuYdrGvUTlqcsScftbHvTOlbw7E+a31arf1EkZ5EbS83fgAHYSjqiUc16
         LcFf7XwlOPdchiNQCduISf9GdsC5bNv5sKMNcSatE15TAmoRSPFXc9I5P89esCTAeWR7
         e4Eim63WUyZF0/avKEQp25x2DHLbhgsYTprybo4lnv0O6IpEaZi3rln4y8k+iaP2hfus
         tUazodLvx0BUlGY5rK4/CNHzxVQHvCqowzQnreWY/dl7wsB6sqX6RAvoWlqS+XsqWpsN
         whsRbDBQDQ1PXCUMVtmita9iSwQrZ+whMJ87K11PoMdrc43kfMiQbHF0LV2dXiyCM3CA
         lDhw==
X-Forwarded-Encrypted: i=1; AJvYcCV6yfPirkuK0mDCReXuwn/5xmky9QBTFOa1uVOBYhaa5OCR9l0Xd7uvH2Pd9wPzfFNgNGwiKIFaaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+pQ7FwjnU+G9/MLKdzis6wIxOsSLTxSZtuDQDTA/rXbMSKQY0
	/fUKATBkNXw9o9j/J7O/d1R1xTTa9XD3it0S6X+AxT8WZazsDYnMo3mS
X-Gm-Gg: ATEYQzxuW5v3C3mG1/4P0K01PK3co36oAsoy+3X3eF535BF/4654vwTMaOTqCrUArYb
	Ppav9BxVMp71AzD4pl5IanzKaAxF9d1gy3oDS5tqir+vyPJUie/jQpQB/Qi9k23Fxwa9s7Y77Na
	MxdOjih3dKsT4TgIjXmqoPH9xhFQkSQAh/NC/Qre+85TR8rZp2qXcwetpeFU2ge1ZwM7gvFs5EG
	NUxx3346VKRiHS352xuMnECXvIjVqQ2pJto++0fYHAJ0Y3zuJOjvICSaEjxYBByaJzOHiLPvPAB
	aigCFv8Jz8u7SSyLxmaIzZa9t5VHXQrujoK7O03/bclXJvHWGa49+BHAPSzYpQtNrpOQTsKiQwz
	b1KjxG4pvKjyaiNy+Ja42tBh3xStbfRI0huVzLZHPsNDO2zgbes2MEUSw5BP6URW5bo7FKpFIbQ
	36JUQTNtt1a4RAEiY3fUYeaQ==
X-Received: by 2002:a17:903:1b6b:b0:2aa:e817:1bd4 with SMTP id d9443c01a7336-2ae2e4b12cfmr20205135ad.37.1772179072569;
        Thu, 26 Feb 2026 23:57:52 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm47358095ad.46.2026.02.26.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:52 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v5 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Fri, 27 Feb 2026 15:57:16 +0800
Message-ID: <20260227075718.2243818-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..02303a808fb5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.53.0

