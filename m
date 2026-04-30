Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B74227B94
	for <spacemit@lists.linux.dev>; Thu, 30 Apr 2026 02:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777516141; cv=none; b=rjNp82A8/vzMiZAcxAPZU1eEYZTjcn1UJwCjOjmbaune/Nq4Hr+/SH0vv+K2kfMzGTInRoI6Rd0nPyN/zJltx05t1Wo1vaJpeGCQ9ZHmsx99+3EztE0jsXRmF/rfa/uq4bysWCYYviUkjnfEwR/ZY41iMgvC3SHw9XIhtHEsaW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777516141; c=relaxed/simple;
	bh=m/Xfc0yttr790dvluLCktuZe/Qbje/l2mIZp0WYNOos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BScrzLZQdJz9N+n79crdgMdbZfhcAaNOW9P2tuNmb/FrDTzGcGq/ssA4+YjueRF2qf0u76gCydavlCXmRQbrlUFTDYktd3FWAzd1B7RKbGrYGf/mPH93hFk4nV8q07Kh4gWh2dJBVMFsr2dUr9/eS+8H7TAqWPZhKCFeDaW+r5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUrDGdgg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUrDGdgg"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so123129a12.0
        for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 19:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777516139; x=1778120939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yamg2LURb/TSAJp5ESv6zShjxXxQYQ9667SLJMB3Nuc=;
        b=KUrDGdggrF4RDl91175zyrfhss3+17YDnlVV7sZEFm2xd0Lo9IVVtRyMwOwIRhzxUC
         NMpzBc0BNjvVCjiu8u8ktpiWKxkTHsO103jVEaBJY5FZkpna3y1fTck06yMvtDB7kI15
         xFEFFtFM1UzEaBm84EJRAgIcJf97HYo1YEW3+bjSqGg7gE0dADzmL2DV0EwISB9NnsID
         zb/1xBfXYUPGEgOoVMjUpmGB1mOaugN+2lbswGJsUztcQ2qbu7HUMlyZoHaQzVXxuv5C
         e+jyUNhzysemcW251efGQyqSkdperycYvRAcDU+MJDhtHqYQOoblMG/hoMPtnkLgbWvC
         bKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777516139; x=1778120939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yamg2LURb/TSAJp5ESv6zShjxXxQYQ9667SLJMB3Nuc=;
        b=JBZSTVXg//FkcdCKgGRFKFSvcL9MQGJ0vFwBKQh4RPgDfYZjf0zophs6627ST4gTyL
         2UoadCYgKWO1gWcYTAEtAwTS2l1AlEjaTNO8ZD+sAwwPacyQbKdVi6gTFmAxNQYCCPFR
         WavW0upAFpCy8cSKCrqN49rs4R6wYgJDioW7WmsWkC13sIBpImwVQ9StOlHHQ7eTrwHh
         m44zanktcE7c6CB89m9D5MoAA1UDANoEKAEgbq++dmWGX9q0BDbUQ+Of6GmM8y0Usiin
         KNM5kh9RFE7M3JmEviD+PknUfTY4Sx7+j+4CyemtAgyDoMFLj6cmCuCQXcYMLC8BBMw0
         iM+w==
X-Forwarded-Encrypted: i=1; AFNElJ8WKynfxc5SJr6cTwAhbPsavD/Lmb/4l47jCwvfh0IMn7nc4IDIijmjJiC3n+/wHnwDjZm149n4TQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh2v0dCGgSVt56oTymyZ/j6aNtAkg6yKG2jfY9GaOZK4RjXFuj
	mHdHn2FX7fB7QGjEUYXJXpJWLtT7zuF8H0akRQ4RgmisZpyQHZrR/x71
X-Gm-Gg: AeBDiespbOwG/rWk8HWDoWLiDmN+nATns/8rHcWp7RyoNDpfVqIDKGtKH4t2IrjspY5
	VST9ntn/3diMX2+d8vA7eoOLn2y8bW8Yikdd7ykUCE/aAQ8DLLL+fBtQpUGUUCrSf1lrg04cswm
	8rfiyxDrEvEbzhkX+CdRABULOjFvTaOVjnY14FkOJ3Tj1DTuXq0Oa1UIJdcrBQtFVAvq4UQ6bqD
	B5/Nk0D2c4NjjvzHAN/Y8gHOE6xPxaFXDlVvHlar3S9CKCuQ8wiwFy4ScqEinfYs9uV5WqkM4qS
	Ab0o8c3E6JmHoDe3VnNTTUORbgR8ETDzRvBAccjZHMUekLZ7A/MR+/8dizDfmSDbx0wpnsKvnSP
	dpJuMbVbccK99yayD5GlqR4EYpiG3t2NhWtXXWVk1311EAlZ82rhVMfs72e24ydJowRzDLv9Y3P
	iMPPiKfi0MSERV07/Nc/jpQK9FLJGcGYkgdQ==
X-Received: by 2002:a05:6a20:1aa3:b0:3a1:90fd:dcd6 with SMTP id adf61e73a8af0-3a3cf6b2d12mr738604637.31.1777516138751;
        Wed, 29 Apr 2026 19:28:58 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd64f0a08sm3373649a12.15.2026.04.29.19.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 19:28:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
Date: Thu, 30 Apr 2026 10:28:40 +0800
Message-ID: <20260430022843.1090138-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430022843.1090138-1-inochiama@gmail.com>
References: <20260430022843.1090138-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB3/PCIe comb PHY on the K3 is a complex PHY group that
can provide multiple phy for both PCIe and USB controller.
Its mux configuration is controlled by the APMU syscon device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/phy/spacemit,k3-comb-phy.yaml    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml
new file mode 100644
index 000000000000..7aa2cf9301b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-comb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 PCIE/USB3 Comb PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k3-comb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 2
+    description:
+      The first one is phy id, the second one is phy type.
+
+  spacemit,apb-spare:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to APB SPARE system controller interface, used for
+      PHY calibration.
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of APMU syscon
+          - description: configuration of the PHY lanes
+    description: |
+      Phandle to control PHY mux configuration. The configuration
+      is described as follows:
+      bit 4: 0 - PCIe A x8 mode, 1 - PCIe lane share mode
+      bit 3: 0 - PCIe A x4 mode, 1 - PCIe A x2 and PCIe B x2 mode
+      bit 2: 0 - PCIe C lane 0 is PCIe mode , 1 - USB mode
+      bit 1: 0 - PCIe C lane 1 is PCIe mode , 1 - USB mode
+      bit 0: 0 - PCIe D lane is PCIe mode , 1 - USB mode
+
+      The bit[3:0] is only valid when bit 4 is 1.
+
+required:
+  - compatible
+  - "#phy-cells"
+  - spacemit,apb-spare
+  - spacemit,apmu
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@81d00000 {
+      compatible = "spacemit,k3-comb-phy";
+      reg = <0x81d00000 0x600000>;
+      #phy-cells = <2>;
+      spacemit,apb-spare = <&apb_spare>;
+      spacemit,apmu = <&apmu 0x00>;
+    };
-- 
2.54.0

