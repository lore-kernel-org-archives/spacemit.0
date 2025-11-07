Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE02FB62C
	for <spacemit@lists.linux.dev>; Fri,  7 Nov 2025 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542969; cv=none; b=QMWRf2sCesEIX7QYN7Y0SWd6b0EkpZa8q3NYOqBXVGmgpl/JNp/I6wr6Z2UmwWKRLb5YKPOROYFq3XyQZRtVsnHd661s4tT0w7btr6ngRaKIJrfZAB3ZiGlrevXAB2xTOnDlutNGmELMDanDsHFYv6QMo/maltUwLE4zfDGQmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542969; c=relaxed/simple;
	bh=w4sH8gKES/QyK5DTu18MOerFvzDp7pfH5YwAuXgh+W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OX4le17rSjkK2Vc8F2SVLz/ABRYbdwmPoygpUJtJBxLnzHoTpGtKQ5q3bPEFmeX0nr7lJkf2D0r7ddPAI6owZIFz+7fgqedEfB2CUJ1ie4676K1LkAZD1z2/bdsaq/e7Oc/fM9Ak3uwA6SKQPtIMCXZoebSWo2C0K3OQMjNrd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VMyhTm8w; arc=none smtp.client-ip=209.85.166.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VMyhTm8w"
Received: by mail-io1-f65.google.com with SMTP id ca18e2360f4ac-948733e7810so42866439f.0
        for <spacemit@lists.linux.dev>; Fri, 07 Nov 2025 11:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542966; x=1763147766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj6J8lcepG5DYDhxKSNWV2cRY6QtdiZGtrhbDPkQq8E=;
        b=VMyhTm8wOBpq7SAOPn6Dfk6slMO+SdINhEx/MZyDzYCMXCF61P/qFMt23pX/2V9y1Z
         AZlTSXIJb+AlrYfIr7Z5Sal5jYXHLE6NZFqzFjyuIjnWnQYwfkIJ9pZOdLmx5KhDK3Xx
         PqW2F0ZDBqS+nRUei0tmENnOiKc3OzViiopCABp//w8P/XP9qWAiivvRMOlPcPaddzMw
         T0MUNf0bOa7GwnUVzmwhcUYM7zATzDK6N5K/1y3c/1l9IlobvEW1P/X2NlL3P4Zi+pGW
         lpZYLuXiV3S3A9Pz5vt0Oxg1mI1diyfv+EWD8D+1duDiRvdNdi+UhaUCBWx1t4yAmd6x
         uX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542966; x=1763147766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jj6J8lcepG5DYDhxKSNWV2cRY6QtdiZGtrhbDPkQq8E=;
        b=PrbAVq0svTAJsb4Spw8LE65Fnv1nUouMnsZH5ql4/ytevcCppDZ/XcYSrwNj1d5pJ1
         hlcthyYdFBgeDi8dcB6JgkQAmpoV2KtLFeWC+0ZttKN8BKVQfpy4LoKYRsA8WdX+3Yve
         z7xFf72kPjqun3QutSrAV3rPQmTzKoWu7Orr312OpQnyzEF01ifY3+mBL18GnGGUYVgF
         1pafEjeK/iTBgLbFD0farwAhKfnk6s5aNRwHLdLjbJowF9Dv7ATkhLEbXIQnEt3Cv8d9
         4kJArrxdDS1D8K/LrvAeHu2lj8V0V+4atTbZO6PkkmorpC6Rg1wH5XmQjgetUDxrJLIC
         Ithg==
X-Forwarded-Encrypted: i=1; AJvYcCWT79bV0kIGeICyX6ExDXCD8BLwCFuda3oMFpdctRrUE/xAFH2j3KTh97SYCQRVtraVG7el/CdEhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybTZM2g/0dL09O7AM472eD2+glX78xXbmwcIK9qdpXTzA9V24q
	Ka4P+wzfSs/eHeGQaXPTAEuv+SpUVg/2B5wiGEpt6bGqWtoQJ3MGY4y3F8fKn3oLRtw=
X-Gm-Gg: ASbGncuX/ItKEyOjZncRcoOKOn2pXfwGcLiezhR5ZYb62ECoAP5eB+DsTTXWbRCW4yo
	sqBFmItwibJVMLiFRdXxDAY15SFnnWpbVNxgi7ZrKig3MOJ9Rx9RbWtupNshkuNum+sZhJZ2TfB
	3ctDL6Jqr2EL9keruwpbHb+g15dlW09J5u0oqOoqHw99BEcUf7DUG20URxiWL6Gct9aD+riFlOS
	Uz55t27mzDb4QYnfychg1ylJaY2oTvDtJWZBA5oMhZsCWCaHF+qYfpBLdbRhwpi7h2VbjcJEFYl
	/7ct1+W34s3kyj2yB5Ivo0xr0HkCtni7EGKWIp1sRnxJTFPwG0L8NWbklbuU4BmV/OVuf5swzmw
	Vs5vGgMbwybmhCdInz1GbdmRapjSdSbNa6gFgOwIE0FWXdR1hWCg+pSmHz0Ls+oACbKzTT+ROoC
	ykWTkFeu8AtPAYKngJEFyTmSSbb19cnlKqXS6sBFisMU8=
X-Google-Smtp-Source: AGHT+IG3g8x7X0Y0yy71Bz2h5XJh9oY9SaN95TpKTAIMsM9Iq0JL0TPx0mxVDPbKsKxl/ezWXxR6VQ==
X-Received: by 2002:a05:6602:3418:b0:948:3f60:a625 with SMTP id ca18e2360f4ac-94895fb109cmr59742139f.3.1762542966451;
        Fri, 07 Nov 2025 11:16:06 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:06 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ziyao@disroot.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] dt-bindings: phy: spacemit: Introduce PCIe PHY
Date: Fri,  7 Nov 2025 13:15:51 -0600
Message-ID: <20251107191557.1827677-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107191557.1827677-1-elder@riscstar.com>
References: <20251107191557.1827677-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
K1 SoC.  These PHYs are dependent on a separate combo PHY, which
determines at probe time the calibration values used by the PCIe-only
PHYs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v5: - Wrap lines at 80 columns

 .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
new file mode 100644
index 0000000000000..019b28349be75
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description: >
+  Two PHYs on the SpacemiT K1 SoC used for only for PCIe.  These
+  PHYs must be configured using calibration values that are
+  determined by a third "combo PHY".  The combo PHY determines
+  these calibration values during probe so they can be used for
+  the two PCIe-only PHYs.
+
+  The PHY uses an external oscillator as a reference clock.  During
+  normal operation, the PCIe host driver is responsible for ensuring
+  all other clocks needed by a PHY are enabled, and all resets
+  affecting the PHY are deasserted.
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  clocks:
+    items:
+      - description: External oscillator used by the PHY PLL
+
+  clock-names:
+    const: refclk
+
+  resets:
+    items:
+      - description: PHY reset; remains deasserted after initialization
+
+  reset-names:
+    const: phy
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    phy@c0c10000 {
+        compatible = "spacemit,k1-pcie-phy";
+        reg = <0xc0c10000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        clock-names = "refclk";
+        resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
+        reset-names = "phy";
+        #phy-cells = <0>;
+    };
-- 
2.48.1

