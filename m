Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22FF361947
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 05:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635326; cv=none; b=iQ6jGgSaDg1YoI5LBZUIi8c9HKRBT8eHkqqYaqmFPoAqiLaz22KQpylZ4ZNEvqifJ4QrfxxDIO+KHSFoI0f819YakQUr/O772QKuOaU0G3ZwwKlECJc9fRbknzI99MJ/Wwr62qoPxFsOQmRXZbno4+ODmJTclfCQcbNx4URMK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635326; c=relaxed/simple;
	bh=38oA0LM6Ih2r9lX08ORLa244GpLhSSezpVZJVF0am9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m4W2r1Im7+JA+q9g+LtPW5v40EkCWVqNKHwU+5SzR9oi0f6l+tMKngJpud1bIdXqp3bFXsPkXwtTMYO93F/wK2TTPV0qfUC6SF1RiO55psEuXF/DWgQrdz33uPN10Y2fDHEDd7TKThqE2319baqFLzfMVDP+PT9qdq3DG+IJWzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbZz05dN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbZz05dN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c214e625259so645159266b.2
        for <spacemit@lists.linux.dev>; Mon, 24 Aug 2026 22:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787635323; x=1788240123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ryfq8ZlJaF8dkUkfOTfrmP2SiE+/6PCtICjVZMb1cA=;
        b=NbZz05dNwfCclA2gmgF9mJn3aTHdZ9dMyNa0gvb85VnHwTvBi4N8e75BxSxV7Wx7K4
         Jn8h/24Yq6pAa9tuY0rgI3cirA+/fNxPfy3SYXcJN0cMRsu5xCe5L9aI+5oqk29wBM7l
         Fn6SS95wo+cMZiZDdo5pXLYU2ufc5P6q+4Zl0KpNh5H6/173nJrVNsplwWtnlwZj4iAu
         /c2OJWWeeOR+XxwcsKnO6VCKpZuNqz3IVkyfRwQPtmU+f8da+coD5i3b/U1MJkO5APbh
         mjZBvz4DSf4Ky+i120vctoWwPa0UtquBQtTrWyTqZZD6+iExq3j/JYISoCTduUQccm2i
         y7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787635323; x=1788240123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ryfq8ZlJaF8dkUkfOTfrmP2SiE+/6PCtICjVZMb1cA=;
        b=GQrjlEY/XpWhPz1AxTVTHhTnKFVMbV25zV2c5aetyWQUJSAft8h9ewimih2EZhVJYm
         CgF7UXbyP7KXijWDMFYGgcZNFzNPR8cKBYchxvDpohY5LXSoxaFMB/6m1Qh+5j9CqV7R
         a9r/+0ipKZOpqGbiQTc6vDGi5peAwu7wJTvraATK3ftkKbeUJNxgjLU2ta8KSzvPvg+K
         vNn10BQp6DNeELfd+YtxcPyh5P5Bz2hhXoin6fcdn+2gKBrKtwHzTk4BfFOtnqIEBsDT
         /fD1IjJT7mKwc5XLeNVJ8Y5mgM/vMfmBR0y0VKFDn7Ls2GQCkSsCqF1HxDjzqtnqaSdl
         m6IQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2PblPGrb6Lo2+AxwtXknoA3jGR1kZXg4XN5mBm/w4yaSqklD9QdwPbcHYnO2t/X9E2B2WL+V4eg==@lists.linux.dev
X-Gm-Message-State: AFuF++k4OQ42eqaClD22hMmtQL54pCP55F0hdx0Z8sD5ObkpZk443voe
	HYzv054FyCrI5eSefxexxQjHPVgemUBC53p5W3GyuuQkiYX+tRTMwKJt
X-Gm-Gg: AR+sD11qWfjkY5tlt0uim0lLbOAH3hvQ3ge0GUADrjpmgrzEKbDk0i+5PAcpim5F9ZP
	RL1QIjV3HlpMvfQ8/CW1I4K/7Yo/9YYyaIQtJe2HZWGtcuJSJEwVgwU87aP0JRFNjBgK0MsH+QD
	x3F2JzbzMsOd3HTD0cxrPDxSwWuYDfIFuh7ecEJCJe9MaAqNXxwt+d5vu2JghrziZIWwCUE0JKc
	U5MlCw3tEzBovTEgJJDBXA2WtZQnIU0X54M92hKhBGaz09kjlWB2bUrv2gsdf0h5scuuJU/GaH4
	bUMDR7jxW0/obFI21ioIU8LizzVL/Jea1L7wCGjKVxxzD0MNaSAGBgbfOypqWUSKt0FWjZXwm2x
	Lgk3BKjXtn3jdlMFCHa6WxtKGFRyHAd/C2ZUqbYkGQtaufEyiqGalSErMEPbW20gBv7sC48flwZ
	HqJkWLoL5FrcWcwbc0GSFqM40AnYmOmstcNrqSeZoqpdKo9ppnjTmv95ndJu3SL9XBjcwDVg1yO
	fljQSGpGE5GajcPIyFvAwxq0zX73t6bwMQgx/RjeNLYCQ1FwAj1OXKlnw==
X-Received: by 2002:a17:907:8995:b0:c24:4128:c19d with SMTP id a640c23a62f3a-c24e584dc37mr325956566b.4.1787635322840;
        Mon, 24 Aug 2026 22:22:02 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1733198866b.8.2026.08.24.22.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:22:02 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
Date: Tue, 25 Aug 2026 07:21:58 +0200
Message-ID: <20260825052158.66367-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY_SPACEMIT_K1_PCIE has "default ARCH_SPACEMIT", but
PHY_SPACEMIT_K1_USB2, twelve lines below it in the same file, does not.
Since the symbol is also absent from arch/riscv/configs/defconfig, a
plain "make defconfig" build for a SpacemiT K1 board ends up with the
USB 2.0 PHY driver disabled.

dwc3-generic-plat needs that PHY, so the result is a kernel with no
working USB at all on boards such as the Milk-V Jupiter, where all four
USB 3.0 type-A ports hang off the single dwc3 controller.

Give it the same default as its sibling.

Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 drivers/phy/spacemit/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index 5fdf18fce..dd74a3faf 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -20,6 +20,7 @@ config PHY_SPACEMIT_K1_USB2
 	depends on COMMON_CLK
 	depends on USB_COMMON
 	select GENERIC_PHY
+	default ARCH_SPACEMIT
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0

