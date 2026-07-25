Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F438886C
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 03:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949592; cv=none; b=pMEr3XJBZwG9RZpf2TEnbUXWiJJM1vs3dG/FOyhF1nsOmN2p1YRRPLwOx8mDY3ogYk8r186IY/vbq52znDcH9QvZDj9jSfKY7yYWfwTFMlgGdiR3iyfLko2CQtYLmRsAv5nZva95EzL1sPgjT+nPWv0HSgP0fhRsMnX0t9DMWuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949592; c=relaxed/simple;
	bh=w6ttYgU0lJiv/SJUYAPaXSKPoe0j2NwHgYQpCKODV1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnj9IxAgNzBIuhNnxgxE4VUK6vUmT5s+DvC6fhEd1MNwHpNNBvOJixbzNEsWECt2kZZXuUDjAJd0E2bRas6UDDXrmZYuyEpw9yJf6584Jmo3naq7e2bg6r4TRqke0eQFXFplM4t0x9Me1rzrf95kpRCDYq0zsX3PXJERhAgqXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X59MxA8X; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X59MxA8X"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca7d1dc4554so538834a12.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 20:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949584; x=1785554384; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=X59MxA8XSj7X6bZ5yrQCoRUdFbiIDAgIgDlAam5N3exzoTPCCLFKTPC6DygBKWcsSH
         Th3+KMdZ+HgAc3+RbKjZg9dp2NF+7kP4kyCXEB7CRFLHRJ9kX8ENMDMjrDdmNH29jSuK
         BrwHGaVjVoqVhzRUCHeME7nPk3J3JIHzTx8tPBOXbA3ZiRrzCpbZhFGTLnDZoy1hJCen
         MyfX2Z7+wd+0KfZ45TlwFErGoVK3V6yDxtXIWEx0UX6togS0Cwe2wDnFDjiaMLjCOVpJ
         Krq3IgjReJs9ys6Slk4wyDNFIME8+j+G2lU2l3rabN/wCqx7sGqtmBlJY0oBXmZ+qQUU
         Nj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949584; x=1785554384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=ahmZ5hJ1TMunrwjn6aOnQclbbR4ynX5virBMEb10FM3n00TfZIizvt4Sd7HRyA9sO6
         RexhnhH6zfo1WgdyovoQyMqiW5ab003WX2yRTO7ezdq1bcxf8LOrrffsOX6zNroWPaoi
         u6HXIBnJGhBkuCn68ChSpYGNxeKF/Rgy9lbClZ+0UMD+M3jo4hkTcIzXB5xHmYvqzYxb
         RA/SqQC8FIS5jg5kS4txZB4LR47pN9jLZSuv0aspzCHlAbbiggIehMi9zkq7Keouz8yO
         S4GypNZt2PvJgqyTpTALLi4QS7xGK/zO7oE+QCTp52vCoE2MJHdcyE05WhxpOgsfxzGu
         JTEA==
X-Forwarded-Encrypted: i=1; AHgh+RpQShPsR3LcMb6+QRjGOCNn02XoBQ8S8OeT5WHQwfTe0RGIhS8LoMO2A05pTROR4nEf6+IDzamBsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpGRKgsmAHQsDaCOHDmWg13GI095NyUln4C4phlbIxrViIBSy+
	+oseVRx5UOcph3xl51g/59yzAPhydYUlPjFZwp4Y5GV/7W0XwSRfYvpN
X-Gm-Gg: AR+sD10FHN9lhmavV+VyaOA5TCDP7FwCcQtE/D7V+eotiLSLyzI2MxlefInqmg7dBZO
	jXFP1a5XvMbshLfa6nBmNpfaKFt9TuYlabncbRQUtEiRTeRl8EcoAMjIbU2+dW1kRXRKx452bOM
	M8mlPoJFR/MTPs4tQ4y5NvgBNdRCDzFCWFrmjVjyZBZgAZOjN39lyCxkWJfMSx8J+bS8cPgWs5d
	R4j8dzW2Y0532IzTrdg3Vb3KLl1dG1gt/cXR0LZhxLZ96K6FMDPStDqrvPt3jA4lOOoGjh3KObe
	EvMBLfH1AEdAocnQPMjZJSydmVgMt2fFKpqoHn9lGJ78joxDBBnYqyZHsLKjuJzCOTp0UIv5J84
	XCI7jIuK3hcq3s4wyTgErqv+r/D1EJcbx8ApQaYLG/Q2wVYsB5EcOWUU=
X-Received: by 2002:a05:6a00:4c11:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84e5942eaecmr647092b3a.13.1784949584567;
        Fri, 24 Jul 2026 20:19:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:49 -0400
Subject: [PATCH 17/17] riscv: defconfig: spacemit: k3: enable display
 driver
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-17-f22a10a52867@gmail.com>
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

Enable the Saturn DPU and the DP/eDP controller as modules, matching the
other DRM drivers in this defconfig; the DP PHY follows through the
controller's imply.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..c38853d69d55 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -191,6 +191,8 @@ CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SPACEMIT=m
+CONFIG_SPACEMIT_INNO_DP=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y

-- 
2.43.0

