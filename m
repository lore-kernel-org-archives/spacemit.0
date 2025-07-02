Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F071B27A452
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492230; cv=none; b=AH3zftcChCRTTMWNJvHPrgh2ZtCXv5RPpDKhN6hwrpRZSzK+e84R/C5S37+vGe6S2j+XN1dsLsgiMDqlWXmA5NdjhhhIUB1XgOmpC8pkzlAmKymPfSCpL63TxC8dwdT1sqgynBdB+nRHqKjkvQ9kvugaRiyXPL9mKSRQ1qnllfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492230; c=relaxed/simple;
	bh=TcSAvv80iECU+EemBY/QAFaaDjBspFOa95X1JROvb5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKbmwoRXHs6GD+q5e+ZE8unDedbPUNz/DE7Hy8n+hFf2oyw44y5of0kJMnpnk2qHnrElp9I+CUQV7CsWtvRt3FecINT6AU7OMsuEEuh3h3N19jcqfZKNijiG3r6ejNu35AylfC0ULWOf3bf+O3QCyMTBACz7eazqnIEah5Uk3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wq+gVScG; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wq+gVScG"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fabe9446a0so66713336d6.2
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492227; x=1752097027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=wq+gVScGE5WI0RE5MlYw/esvBiHj0ev6jYgbGBYrT1dOHm1C+Gf/XaDNk13pprvABE
         DICo083laI4ThNAzcYVXiO6JjUxP1ZXuiFZnYHcdB4CqU18Mq3Mc1C089cocskkrHmCV
         n4eV5Fr7EWR7hk0f56cPp65wFNW3affsK6Xv9WWpDEA2h4OsT7ksnHLUervMbUedE4Nk
         4vAxnFyW1ZmQFedS6Ntr4mQ8hv2C27KMFxkmjg+r2pVZuJQCzRBkzheG+3VO1KaVPn6m
         SsKxYgTQdwgs0c4TZuptzTRDOiNuHuWaVTO2yCyVwnRz49QtdO6meMHa4GqqlayUHE7h
         QmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492227; x=1752097027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=G/ZndTbNGPq5P7iREQ7a/zZaRk28vPCG+ZsPhwhS/q3/FyYyrB90PSlG2oswC+vKtx
         W1XEwnaeKJTGknMxavEcZoRu0sBD0YkFINyzGGMRNanTDeHAhbmZi5eCbPorAgq+84Oy
         2CSHperOsD6yW02QeaozpHPTsIjXk85lCrvxOqd2lSysqhJxwoG5gnDZgeOjUeejYD+B
         p5CjEbN9RxAqD9sndlHjRf7WldKSJgtjeE7rUN2HeBqfSVszPB6FiOx01QINZrNMi5Ae
         A7qZsKCUeyPdLBl2qi0D2rPf6JRt8KqagI4l+szepsvdLGThQ929fynxlmuQKz/MPi45
         1UXA==
X-Forwarded-Encrypted: i=1; AJvYcCUOWwONzwJ05SEGeuk1O697+6p4t/nTvCPjiNS6zacBzQAcYpFWXvvKyVPGheRE1KfFQQKxPsj2fA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOUam1EtvoIwRWmkiWHgnZEXIBkOOXx1CbpzyW4/ZTBzAkGBgu
	6DN6khhNAW6ycF81P1XxzijhlJwgXflh68gPJeCDUjljJ50OY47BYbXRBXuLCIyOir0=
X-Gm-Gg: ASbGncuVwpjpYZW16qv2FfUwRXB2U2/OXqiLM2TPl1x7KfubIsYlQ4w5I1si2a11jUp
	9i13GyeeaXjwY8hoYVAQA7uZpax9fAev/qEvrEQMBWpbjas25nMkbyDfuN5zijMoSShmmFraavp
	ULMNC9g71O9QQU0PVjt6DZUL7X/9+vi29bbruPdMd6RRb1X0cEEPwqdXozKvQNKJJiEe9MXIQ0m
	3VAyODHANK2FRp/qnVGDy1WsnBsswZ2G/BDLPYkV6D320eWJsL6xhxTHSfBvD9lrRWaA2+ENgh7
	cToPnVUkq/2watpBikGp5L3AVGVgS+bwCwm8/4L5lAlMEM78nSmj76UebdPtPoVVGIMS4VDgfEq
	F/yMRgtZv6BEHrRq1iuamWxxzRKLK2fmLL78=
X-Google-Smtp-Source: AGHT+IERqJ3BfOxhUmxkupeyUkDeU0EnZdd1PTKHpA9KaSbcs4c73pcX0FmI8fCh3xwn7Djaw/yz5w==
X-Received: by 2002:a05:6214:1c0c:b0:6fa:b9e9:e799 with SMTP id 6a1803df08f44-702b1b37a43mr47892906d6.24.1751492225372;
        Wed, 02 Jul 2025 14:37:05 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Wed,  2 Jul 2025 16:36:50 -0500
Message-ID: <20250702213658.545163-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the RTC and regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..5cc34d4934b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
+  constant-on-time buck converters and twelve low-dropout regulators.
+  It also contains a load switch, watchdog timer, real-time clock, eight
+  12-bit ADC channels, and six GPIOs.  Additional details are available
+  in the "Power Stone/P1" section at the following link.
+    https://developer.spacemit.com/documentation
+
+properties:
+  compatible:
+    const: spacemit,p1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vin-supply:
+    description: Input supply phandle.
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@41 {
+            compatible = "spacemit,p1";
+            reg = <0x41>;
+            interrupts = <64>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
-- 
2.45.2

