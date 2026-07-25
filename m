Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C265353A67
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 05:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956786; cv=none; b=Z4m1nhHFbigE3uoip+PxgDqQvYZmns1tAZng64HuLVj3F1CUKQlBRU5VFU+jio9ez+xCVFLMrYSafAAWGJ1abnizr7pjqDsv27TtrWeL0avW6pNfNwI7NlXbZsim/i7vqU2SmUQMGZxBW7JBsu/Jg21IAxyBrGD4kKmhEcoDHbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956786; c=relaxed/simple;
	bh=xr0oQcfFPCJzaAeEJhH42CRWzbYWKnP3e2i7y0AjEKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mD1sywfBc1rzjN11pQrdenGPxz7mb/rhTHyxKQjMH1dc/5ra+fl3zgXCafkEsbH8pCvuW+ezEpEGSm33u0bBq7lFPXzGTt/wSbGo270Nde/QD+YuBuXQ9dR+D97CJCgqgOOPUlMkKUp333mLoBcZ7/ol54To7XBfYiEf5NmZZKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx9TH2Wl; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx9TH2Wl"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so967983a91.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 22:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956784; x=1785561584; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=Lx9TH2WlhWep387E8d5ZCEnjRm5TfjJXng8Q01vn9LkPVCVcLD3EFvFprqoGpmAcnx
         XL/RJh9RbV/6jqkLgCorF3v3d+xtLigAxKKZZMmAiUwn6KOb2YBSwCjXhbTLSUVoZpy9
         q0ZKzmjGz/FUNq5Hs3OTZqRzTxxitOZDNkrgRgsBXyj7wlTAVFyxifVqM7VH3B9YU7oL
         b6QxnlTj8/BwbJnh/focuIdkGpXxZvc3lO/oaYOdUdGlCmroCrCLV6ba9Vuoz/zkyT8C
         Sa/XMw1YQuFYtnVZx9nRrim6c/WAEh6vzTSoHG+Yom//I5AJ/dIpldNDThqqOnIPvIqE
         F64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956784; x=1785561584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=KuoaartMeZAuegwH6PI5rs9Zfuc+sZqulGdUg6ElMunJVXpzLwz8IXHW/uoA5VGZNE
         mrChJ0b2IsuScmAf7EjqfbpjrbV1MnBD4iMIaX7gzPyfxF5a988eZFvNDQhx9woMlJjp
         a+wWNryt3A0y/diZdJR9wHbKLgc3oyM1/k1LhXpSGzlub/fuychr1LPQloxfgM3elPo5
         ueiuS3reO5hNrJhiRr0fW1lpKPRHF9BnDAPSFkpt7WenE0BtV+ruGbGs75MJqGgaOElf
         v5OuRNq5gaTU3fuytmOj9BVFStHRsBWbazuV00/fjMtmljutSMuZsFBK/Z/kmg5q2/XU
         zrHA==
X-Forwarded-Encrypted: i=1; AHgh+RoqXzmxfIabCSJyfWDXOKHgRU9LlT5idbZXctnihG3rsRorc9VQ7k2AbAtSJ/wREjCZQ61nlNklIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpf1TCfTwPt4+9P0rcyJSvfl7RIQnrmekrJg2nbOoFZqUehp5n
	oTnv17Iu6R19Hp+ykV1qrwRvk2dxPMRjJEzLRNKSGuT+7/4eh2qaCh+N
X-Gm-Gg: AR+sD11Sf8qlgM/flR050Fwdtb8Ipc4tOuSStD7LOPmr7kq91KkxT7NTNp+mkSBrynH
	NegcXmLECA3WD6EN4CD4rc0bz2NAOcFjzX8YTEi1pMRjW3noYxMMhRZcSuJGRARcJQ9P0Z3MkZm
	s8ChbRp1yMjQu8rLLh+44AMO6c0BlyMQDBzmjuHMFISWB8T6oDYfd7G9sFWfUb1VjDNtZTmGkC7
	xdsp+JoME8txHESTq50YXzIEMrPkVoSrTtLzvx1KBYBG3XFOmCO/3YE0GjyeJpP4wwo1E6uOejy
	zu3vpL50XggDRY2R8W3DhvkZQoFch2jesmyaM5V8xhdJcoyZGZYMQx1kLc2X/wvCn+I6GoTGRGs
	x9SaC3Y213aOuJLcSNgCda4jGtwrzmW6XnqhaNOWE9qHzbA4BC87cKkQ=
X-Received: by 2002:aa7:8885:0:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84e594330edmr623584b3a.9.1784949446508;
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:34 -0400
Subject: [PATCH 02/17] dt-bindings: phy: add SpacemiT K3 Innosilicon DP PHY
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-2-f22a10a52867@gmail.com>
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

The SpacemiT K3 DisplayPort controller drives its four transmit lanes
through an integrated Innosilicon DP PHY, one PHY per controller. Add a
binding so the controller can reference its transmit PHY and the pixel
clock the PHY's PLL sources.

The PHY's registers are interleaved with its parent controller's inside
one MMIO window, so it owns neither a reg nor a reset and is modelled as
a child of the controller.

It exposes its PLL-generated pixel clock through #clock-cells, so the
APMU pixel-clock mux can select it as a parent through the clock
framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
new file mode 100644
index 000000000000..f8f1ef372951
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort PHY
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon four-lane DisplayPort transmit PHY integrated in the SpacemiT
+  K3 SoC, one per DisplayPort controller. Its registers are interleaved with
+  the controller's own inside a single register window, so it is described as
+  a child of the controller and owns neither a reg nor a reset.
+
+  The PHY provides the pixel clock its PLL generates, which the APMU
+  pixel-clock mux takes as one of its inputs.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp-phy
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy {
+        compatible = "spacemit,k3-inno-dp-phy";
+        #phy-cells = <0>;
+        #clock-cells = <0>;
+        clock-output-names = "edp0_pll_pxclk";
+    };

-- 
2.43.0

