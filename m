Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669593563D4
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949492; cv=none; b=YyXg+bCBKr43eWOZ/rttjl5eYEDuyrX+0uvE6KdRoxRQ5xoQ467AYYEmIC5YVoOyEcLahAABoGOtsIiOBu0Ljw6TylJFhMjB44s1YeO+U1/WoBHrPN+Pf5SSnN2Z/GORjuAAFJuo8VihO0PYeo4MUU0oR9y/5O8NgYfx1ipQReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949492; c=relaxed/simple;
	bh=qBlMtjoJcxolZr+biObNXORMiyzxuZ3oViPL72enT0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nunCSykpD9zlhyyuHqhgMDjkQwKmGdFp94VauJmm08OEJv07qll51+lKBoy/0fRuHxORBIJpxz+0zt3l3UWQZ3PMvXuKlzIHrXFn/tsnxIjK8+v+Q6DDfeAzK4uS2uVxpynn6Qr6Hd4xVMy4EF8dkMfJEMVm45HfejYuRabFFkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yhndpy+H; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yhndpy+H"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so634589a12.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 20:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949482; x=1785554282; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9jy5raEKPdDIP6H9Rn1M27tE88CgVPDyIdAEUIQ/3U=;
        b=Yhndpy+HSItiQAz51Ve9DNpwC2kpFZBiO0B5mDiBMLmuqBh8RsipoBtBp/+iPOphcO
         CCn1d7o8OuNI2j9apHlTRaIXjqbhUPIXGorex/a5l6KWeOYnxc8ctOIvW246HSchnNNX
         WgFYIHxHBzYDEyf84yTMlti9AfUFZ0QKcSxQvYftAgHCaLOybvOF+a/TpvrOO7iSB0iD
         9SsWg+4ualMlTUp94kJF/OqaMQtJj4x8TwJFczsjFEr0DPvajw2CHcA6yqh1Dkb/nql2
         hvi75kp9TPtDz2QobSeloWzsyvBeGll1gGY5MnZX9QKWEAAJhDvozee2cV3NpD7/0lBI
         r/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949482; x=1785554282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9jy5raEKPdDIP6H9Rn1M27tE88CgVPDyIdAEUIQ/3U=;
        b=qhOSrR2vKFGZQOrk6nRzILe72kB0fSDRiVqCmK4fJN+Vb2dAKMoth9jqJwO+jWuxph
         4Nt6bHAZZ4P3hbSNxs67Paty1aweQ5S0IOg4FoA0DDDWGSLjGnXhF8YX0Jlhjlf9aKgk
         p5dsaQeqnayo060oF73foRc6JGDPkiskMnvI9BWyFmTHbMHO8bbO5jl3g6VCTqZSs6Kr
         xbrMqIQ3wzf9/lf7O+mX06xNs6LfJJU/ruXHBEA0O2VoIfXo2P+k545LCFKcTQaLxjzD
         2EB3i+y2HAo61XWdhsO8gbEu/UHtDlKROEYlbXmukZAVEzfqbmZIFq3o+7nKaKnzqx7P
         l/8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr5fxqGyM/eWHBaX224OvTjQZyI3sxh/Lg4z/4G3iugcccXbkGPMBs+9hVSebz13PmEqFAdERH28Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEH79qGR8iKnSEAjckA4hOSvnwa32QMfNpPtt6Mc6YJQHQgAug
	NymkI37AJZ5d0frhFWO6fxQBqFIvCuu+Dx8L41IoB8JDZ2bOEIL9vc+M
X-Gm-Gg: AR+sD11SdUUeqRYX5TXk3dGa8oqEQw30GwmPULqRkRSwZg5E+xx5hnW1oNuid8GQJzt
	yCsIkAH5pslSgNDdluDyim9Z6Phe1OGKxXVKrFpVsolhzomeQ8d/Z91PBEd/JuS96rJly8pu2xz
	mDy5RY527iTxQIPhtRPqlx7pNCt/gkUZuxs6sfv3QxmUC4Jw2QPtYtYk0bFypJvbTTZY2o0umxo
	5dl6AcPAA1gajbKUGe/wrY6Zg+PuJYuCvpDULxxR/Wnn6pSlu6HY/++NcUX+8gAjUwo6FbH40pc
	7fimRnPrro8fjIgO0Q4j29t8DOmOzDjc94aj11hMSFT6ep21nKjcqXTUr+mHITvl6YBTgYZkp2p
	JSdxcHqxcrLNTAGAB+KZP8CaGQd4GkXz75AVaRVcTKNZnN5IQ8bhJZ9WIDYhkbVANHw==
X-Received: by 2002:a05:6a00:35cc:b0:848:44d2:72a2 with SMTP id d2e1a72fcca58-84e5944c07fmr653876b3a.27.1784949482608;
        Fri, 24 Jul 2026 20:18:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:18:01 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:38 -0400
Subject: [PATCH 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the
 PHY PLL
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-6-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

The APMU eDP/DP pixel-clock muxes were parented to a placeholder, because
their real parents (the DP PHY PLLs) did not exist as clocks yet. They do
now, so point each mux at its PLL and let the pixel clock reach the
controller through the clock framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..afbbbd797826 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -937,13 +937,13 @@ CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_parents, APMU_UFS_CLK_RES_CTRL, 5,
 
 static const struct clk_parent_data edp0_pclk_parents[] = {
 	CCU_PARENT_HW(lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp0_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp0_pxclk, edp0_pclk_parents, APMU_LCD_EDP_CTRL, 2, 1, BIT(1), 0);
 
 static const struct clk_parent_data edp1_pclk_parents[] = {
 	CCU_PARENT_HW(dsi4ln2_lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp1_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT(17), 0);
 

-- 
2.43.0

