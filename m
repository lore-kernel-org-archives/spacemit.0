Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6EC318BB3
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949476; cv=none; b=Jx4KmpUnfHkyVqDsHdveS0oKsBahzzDafhWWbeHgOIVJIhm1txQTVyC+PyKp/YecoMR2AvS2U5JdkGslyphGmcy7rSODmikI8kCHFkww01rS/kQw+VI9lqxzQ/g44WzJqBYIX2+Qkm93BDXEY49Bbjpef1vHD86Ny3mYXge1m0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949476; c=relaxed/simple;
	bh=To2Wz4JMP1yzDvV2UFHvJJLkK8aaYjCf2yPZVKorUr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXWN3gz5icImEyE8orhVWvSX99F2x05ACVMdgAmVf1SJCSulE/8LnsrQIzg3d6/kAjR7mkWvhzeXxOiXVIVtn5JKq2g/inWKhFHKsb6BXRrDi6PDVVNrQ6xbx7Rhj9Lo4LpKx/GE7qt+Nvg6cGFfjhvA95fPrLfVigekSG5f9BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZ8dlFVy; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZ8dlFVy"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca7a25cd87dso1015070a12.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949464; x=1785554264; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=RZ8dlFVyCbIZccJYvk7RsrBGcB9Dh598KILJH+sdLlEproQgs7kVSZEZ8PcCDyKO3d
         ccPoUkG1chnL4mHoMPYASl1uOBHCks7kCkvQV/8Hj4VU0tiH24e5THqTABb9BckLhauc
         w7cS4RqZ9VXiQ/iBcfcxBOKFuSWyJP1KAxWyUHxtRTOp0jNVprXuO0NKRaYtNymL4lpn
         oF8YR3qVvYPhbZ9Hcb+BfHFs8FC7NkfNYN9UZWOuu8/nLTf/K6jEx+Y+zz3rYvDWBndK
         gOdW55LNSJuvYcsaudo1/I0iix18bsGv4QvAR9l/0PuxTx5WBQhOWtwXsdNDd/MXf4Yr
         dRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949464; x=1785554264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=JWHpH/vGLp6rOPEX9I/50cfOwSCdVX6+D7/WSqjUUf1JdLCLzVanT7r8d9zIWwMKee
         tA/ZZQ1dFZ4eWTTz/WeOfiuvgMNXGbhDom87N3JqLrxS6l6/IaVACtpuvtERJ87jH5TW
         3nPW1g2fU6im46vQLrJrbU/R8OXkwKWvjw1MUw9GlDCic/x2MfNOljZ6HuyniiCL/9fS
         wP22y7A1xvgj0xETElhlMajNBg1lpUTEqiKzyAlW+uOzmP1dZ4ZSxUpQiHD9V9UUiEWm
         i71BN2YSEBC0SfyGCvvPJ5XBupavR26duH+UgBUqYb5vZCf8AKzvd5bfnbAukdUixoAL
         NVDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqofA1+RnQ49Hu7FL3S88Edk9D4t9NpEe3sLqlijnMRKZsdCKY3KqffEYqvypHeccpf6ZNty1jt2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa9CNkDKUR7ub17xHLcEA3IYw6WVCF89sAV8F00PX4B/UQJYAw
	jcS5FPZSOAZ7zxPN+cPMfsvy1FcVCMuugK/m4NzpwPSzOZ18V3EOcd+8
X-Gm-Gg: AR+sD12PbgdJLaJghxnX9sARQad8daSg0IYdZIgnzG9fYcCRFJktCuTPZAvWZ6h5m42
	jTBRREBHCBKW/bRfkTeXO1HHuUrDxgEKMy0k4NiD/eihwlOHss71wKgnO10BqeOMCrI0nIVYH5X
	4DVoWkclD59ACJKN869SNHLF1sQcgcGQzC4v4EKC/Zb++oQOrqGmCHoQWXs+3PdLPlX1lyGRsqq
	PP+XNhxmgar3T2QikW1o5UQn9oxetbrI3qAKr1pLHHoX++zuFc2NGBCjARTEwBHOAR+nlNse0j7
	vV3Djz4JXurYcd8KU8Y5wn1sbHKCO05r9S8h2qqdH9Nx/Jqc6YfqEdRHkgazRHa1v7FPGUir+wt
	9MNstAhnLmiU3DgouXQsZNEK+m9kZ40HOwIzfJRWpHbbQHhxpw2FutKo=
X-Received: by 2002:a05:6a00:9288:b0:848:2f77:e2da with SMTP id d2e1a72fcca58-84e595d33e9mr653832b3a.67.1784949464300;
        Fri, 24 Jul 2026 20:17:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:36 -0400
Subject: [PATCH 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY PLL
 pixel clocks on K3 APMU
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-4-f22a10a52867@gmail.com>
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

The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
K3 syscon takes two clock inputs the other variants do not have.

Gate them behind the K3 compatible instead of widening the shared clock
list, so a non-K3 syscon cannot silently accept clocks it has no mux for.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index d3a7c93c3c54..b8fc6632a392 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -31,14 +31,18 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: osc
       - const: vctcxo_1m
       - const: vctcxo_3m
       - const: vctcxo_24m
+      - const: edp0_pll_pxclk
+      - const: edp1_pll_pxclk
 
   "#clock-cells":
     const: 1
@@ -95,6 +99,30 @@ allOf:
         - clocks
         - clock-names
         - "#clock-cells"
+  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
+  # inputs (parents of its eDP pixel-clock muxes); every other variant has
+  # the four base oscillator inputs only.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k3-syscon-apmu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 6
+        clock-names:
+          minItems: 4
+          maxItems: 6
+    else:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          minItems: 4
+          maxItems: 4
 
 additionalProperties: false
 

-- 
2.43.0

