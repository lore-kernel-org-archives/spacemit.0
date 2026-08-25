Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B8172618
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640619; cv=none; b=tlDOmFtf7fFHoy/+zDQRTBWyqLgvljz/4Hro+8u2aw36Axy6ECJ65+dkZnPWKggFHlejrbtws08ovKABTaHdRp9kNPSfy9OMoMBSUmvBqO+zPIFNUCiZ6kVJPnLd691Dvb2SjOoh01Ztt5hjMpXRpdJm9mI10ZpoXjc1QVdXIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640619; c=relaxed/simple;
	bh=AAvTZ5gHf3qAhH+IWJxTf3LvWE7Mlm+4dTPcbo6QzOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/i/YFKY72rvpcMHOV+6huiMhJxAvE66fVfOAJs5Rf0As84xTgpduzYQl0BUMSGFzHO8SsUHkrXMZk8i+oTv7ZjMkdJK5wTBymwA5gYDkTbbufzDfcrkdR8uQ1vQbCdCiNykTw9SPJAt0H7l/RzZOC9LiGz7qgyU/AkKgeLiOvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBryqfe0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBryqfe0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20e70a0962so661495466b.2
        for <spacemit@lists.linux.dev>; Mon, 24 Aug 2026 23:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787640616; x=1788245416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9QzWtIe+gxS6pJym3F3V1dPDGFuF/K6nAoOQWMJ97k=;
        b=rBryqfe0uTTkPkmryiBohlk+1okavOaDPMOa9Bx1wdYok42vbrsU68ntC1lp4lZFNs
         T7MYE8yJt+BypqtX2V+LHFZOetBUBBEEMyvdGqXtFU4moYEW+WhJ+1Gi2QatAGkssGGC
         +qztmuXGrDYDVSlY8Xp0ZxNRofyqMc60cmwDmao6EqRGybP0ncn4QU40T9Dp5JQhAOdH
         Rl2zt6R/79s5NjS5t7KKBVp70NAhgqhSSOqJQOw0pybssK768jAY5WPn2o/CSmHTBaK/
         DiK8qBkyJTOnbqaIEzGh4vyFQzUcn/BNUFDA1gGZdhLihV7M4Hk+tj0Le+aq6NIh9m7Y
         AcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640616; x=1788245416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9QzWtIe+gxS6pJym3F3V1dPDGFuF/K6nAoOQWMJ97k=;
        b=HAihSPGP7o//8URquNAOW9f16/ZQ8xjS0T+57Oep3rXs4pU5Yo+vNadyvGajZaVjin
         BOGEpWVIirt8L4s5jyyqfhWIOsd+4QHGGCHZ2wrC1ae6In5LOHEF0dyNwk7B31qRTVrT
         Sfq4adZLfHu73ZLZ78aAjWHu9c1q/w7F4BrCEpBD2myhMWvjfWSLDZOv4by/YBn6pTQz
         BNvfHicaLKp+Nenkl9+5m6G31PNJgotS+1PWSPUWdU8hhDhQAr/cCvsBmkX4D8HmoVE9
         XeTzZMY/m06nFDVQA4sh/Ku+ECBtNaHZpnsmJgiJwJ6dvubGZqmdivKXWHCiFVua8tyF
         l/xg==
X-Forwarded-Encrypted: i=1; AHgh+Rrj9Qu3iog/xpCUfezzAKkpFfaSaF/4f/g6U2SeX9+8eDzNqnXuBhdzKsmSwVyfUXLwupyN4eLJAQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l1lc7htVXaDvHCFE/6i5Zvrh+7+iCC0/Vs9t4CeBXnNsEgbVSG
	zh00xBggLUiUINXZveeCkPv2T0iKQNq4nJb6fmYo7F+x/Q1lI/CsLaLD
X-Gm-Gg: AR+sD13FvF2269wBm4d59xcxs7wkE3KTQ4CU6OG3W8yMxmaTwtptY43Ibvsd1dqJd3c
	OVbfsSKaD0lohl+RRXP2eU8iIJDCY7Dhg1CHw+vT3mXivVN8OZ33fPHADg2n/i0QBgGLYAlG+Ol
	0pxdwRVZjWd42VJFVDkqKB6SnQJQ97t6ORsPW7xrbUnIXP02MfHxSzkdbL3M0TDDfv+XbufzJr+
	X/5yYj74kngiIc9NV9S96sOrOh7tfPERsrh6VsY/JgGUaSVPmaikY9njfDTbMi7DwSVTIJbwOyw
	At8XdUGPwTahW3n/3HMsQFG8NHfXbHzMHBnrUA+84Mee6fGDo7WvYx9W0lu3gOUyAq5MNLnbZSC
	Q6iKJUMyZjDgrgwhIizDQUn30eNZJaf/EDHXCYpv1znTcDoiimVwccqQ9fcggJbHr9a6MOddosj
	vh+o0jKoMJv4T+gSJGc+R7Exv8Fm528VP+vHVEQWczJo5PrfTnEOgyLsGwdttRE5lvl2fhEUOyW
	5gaKkbAeuMCsf7SsHSpfCNXU/I6rN4BtmYrLEfd9XrqG0/JcpNNYIc77SVoYI2cTEg0
X-Received: by 2002:a17:906:d8d6:b0:c21:34a3:4d9c with SMTP id a640c23a62f3a-c246a72174bmr2767472766b.21.1787640616006;
        Mon, 24 Aug 2026 23:50:16 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1658627666b.42.2026.08.24.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:50:15 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH v2 1/2] phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
Date: Tue, 25 Aug 2026 08:50:06 +0200
Message-ID: <20260825065007.69353-2-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
References: <20260825065007.69353-1-bbanelli@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy-k1-usb2.c maps its registers with devm_platform_ioremap_resource()
and wraps them with devm_regmap_init_mmio(), but PHY_SPACEMIT_K1_USB2
neither depends on HAS_IOMEM nor selects REGMAP_MMIO.

REGMAP_MMIO has no prompt and can only be enabled by select, so a
configuration that leaves it off fails to link.  In practice the symbol
is usually pulled in indirectly, which is why this has gone unnoticed.

PHY_SPACEMIT_K1_PCIE, directly above it in the same file, already has
the HAS_IOMEM dependency; without it PHY_SPACEMIT_K1_USB2 can be built
under COMPILE_TEST on architectures that provide no I/O memory.

Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 drivers/phy/spacemit/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index 5fdf18fce..cd7ae48d8 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -18,8 +18,10 @@ config PHY_SPACEMIT_K1_USB2
 	tristate "SpacemiT K1 USB 2.0 PHY support"
 	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
 	depends on COMMON_CLK
+	depends on HAS_IOMEM
 	depends on USB_COMMON
 	select GENERIC_PHY
+	select REGMAP_MMIO
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
-- 
2.43.0

