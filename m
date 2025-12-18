Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0861F34B41E
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070765; cv=none; b=BOWVaW5es70GAdam0GwiW7KcqlNhhxAEqp/S3O64R3vLIV3YIk0lw2aZgKMnVM4PrSFDZQSC/iBU1OUge4LgEQH1F4W/ZVjwt1V7lJ4ecBewdtSJZMZeRoBx+8KWOFYpDXzBNkM66hOsJESbErk3+DTmELDyXR0JVake1/jsNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070765; c=relaxed/simple;
	bh=8LppfTqRL5l2SybiAnwAcKY+acsrML8ysTdBgNm1hLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s643vgjtsrAsh3qfKFsNQifB7cQcWdxWIBwRiNU73U2MppdfEQEQB9/5uMSC9QjU311jioRetLfB3GVPKlKC72DTMB2HQLvGWIjgRVWFN2m/CAfIY1DDSMR/LFwhQZ6mFR03cg/COe/IHHPdm0jeyc3Uzqi9Wt6lQNjBD51O05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=c4pjmvQH; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="c4pjmvQH"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8be92e393f8so77366385a.1
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 07:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070763; x=1766675563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=c4pjmvQHsbKYe8gGDBxzGDHhkFR5ysrP8k99/3RpKll+Dioh8vxwQBRKY4b7Cic9Ds
         sHg7jJjiND7EbO/+n1wX4/E8qTjLLy/9SlAZ/NEFZyU3azMXmWhRHJvvUl3tD0EWMzwq
         xeQ8CSWN5ADxpQrsn20y/bxcEaU7qBBfsTmMEYS1n8FntdG59Zrog/7D6FdSdvcwT09F
         VwGBG2JRtyJF/jNaIXYk8EPlobBpFBhWhQI37WNS0IPOK32EC/CtYaTRzbR8DMWOch2P
         Sq2zLstvg+026XX+D0nDnxyUaV4ZA/BnVyTdcD/T5DZ6FZvxQ5RgHNnRgytSk6PxA8we
         mIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070763; x=1766675563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=djI+z8XrnMMc3BdWU45JrZrz8zfumsMIRcOw4YQXYETMEgFzCR9zEDgLXS+stUnmXS
         IurVN3TTXwa23BPLFL6NR0se1znQcZcedx6VGg1DlKIyuDqZWPIuVJiX0IITnGTfUU7T
         TF03Mm8gkzCdDRpJze+V1cKJh/NLtl0lCtNFW5su2sGC36JjKJSN+cnWUeLNxS778KTf
         mHpnB9wdpyl3c5kIjxsDjPyQiByy6kPc+C7V9L7A9UR/9sI+Yr6emuYgHeM62xc+5XIn
         7RXL5kPcxSaX68sRInBPNgfdYc5odJxyAdD2Xo6Beb0FALPI/skVyCQGj8qmAXuq51Lb
         z4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjolycjUmmvHqJ6Ptu1AFY4yihLUPZg9UGeA5A+qW4/bPDF8UKqO0AVKOniArVzTeg2BPeuglhhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDwUOugNxlPbn7cpwDIBRF1OEj/C6fgAENcj+7jny9xFQaitg0
	OxTmx9oNnJ+dzC9OYZedIWxlClB2QKHD4MeJEFhejhZJblSL2baoz11utqoHMscevDM=
X-Gm-Gg: AY/fxX6LjsRlKoetTDFwoDMg47l/vPHBYfQTOTekBAKuyqWt4rIs/CdntK/ZCdOyt8c
	CMsk6VTu0vQLAdqwvE1KPZHoSw0OkOXsHkPKJ7tNRs6p5yIOaJXL0Ebj2YourQiFSbINU1+zJeP
	iqWl0jaTY3ID1lKS1bFr3zz3/XkAD5ZDjBCvsw+JY31RDgUbSsmXn5qZZwTuhGJS8dnHhUxCJm/
	K0HWeVPp5JunBZYUP7UJF15nyWKujXN5oDtgVCGmnX8NBExfkpLsSGHbn57yDXc2ahYloJT+7Un
	GQlrwAfNY7dKbPcaW+G3RBlXCW5fW1xndpRqFlMcg7fDctHbBcn+KVzYO+WYU96QF3FUnYRJ5Vt
	2Jradz6Nw5h9qPA94I1zCPwkZg6tvClWpBl7lP2b5Ec0RXVBgNAgG4Bu918b+dmWz2c/Dl6HWl5
	1pZJP6UCeFuHEZdCtGAxkFuQfdvt3lJqKXBkcJnyp0gaEoMio5ClGb0Q==
X-Google-Smtp-Source: AGHT+IFt4skkDsPUjK60b1wetqDLMvA4QbKiBZIS/djWkmayCVcOzRtJDIo76oiNu2+mujPOEGHHUw==
X-Received: by 2002:a05:620a:1912:b0:8b2:eebc:64bc with SMTP id af79cd13be357-8bee75c3e36mr423410285a.35.1766070762753;
        Thu, 18 Dec 2025 07:12:42 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:42 -0800 (PST)
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
Subject: [PATCH v7 2/5] dt-bindings: phy: spacemit: Introduce PCIe PHY
Date: Thu, 18 Dec 2025 09:12:28 -0600
Message-ID: <20251218151235.454997-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
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

