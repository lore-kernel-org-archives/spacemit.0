Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64C13DDAA
	for <spacemit@lists.linux.dev>; Sun, 22 Jun 2025 03:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562990; cv=none; b=m8H5roNaT/q4NKnnV0vj7xCCUARPCYn503HVJI0ddVok8eH0adeMNTIFukoVWSNzuKQapKRcMozxA7sXnJaSrBQNJ5QDakyC7yBFZJgnkvP+hMZDzxfNdy+grCDqHVEH/rXUceLocUvdYtirQh+Bkvds5xdrNVGtMQpjGoOdV7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562990; c=relaxed/simple;
	bh=hMn6z2AZyzcbL/cGMK7HwRD4mhVABvJkOEyvUbzSheE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfbiwcjH1rbh04GHIj5DKcGppSVWBRYKRTOk3V8NvvHvHgG/4SHNa590MGroMbS8BRQkA0N2Cc06QHS72ns/OY/+iddHIPYd4fzjAP50M+nikW/Iex281noDAyiPbQaoOpzwqqXJxHSg95AQ5p3qf40fLCqPE3gDykLX6R3vyo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0IQf9sl8; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0IQf9sl8"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3f1bd7121so302769685a.3
        for <spacemit@lists.linux.dev>; Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562987; x=1751167787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=0IQf9sl8af4K3VOsTwYGm1GNvsMBxjzkGdZyJb/3VispsujuJ/7z4jmZBwxstYUHNt
         5ZjDmPcMG8ozFMwnuswB/IWlVsjffP7QnfN0vayJvcrB8GG4dFLnfVbERqoW1gB2KsqM
         y703vSI/sJinok5BRnRzEgb1MI+Tm2yh+srrVIKaK5z7bvFUUdiReDq70zzuz2jQfmYP
         l5mEpx4ARoL5PVwbNvT1/gWWAB2pO+M5CgsUiJLiyYhmjeJnihtqU9iXdT3kw2qEZ5cZ
         32CVO2AvsRkXdh3sV3FCVF6L5NsBtEqq0kPYxOcwccv3YOLrL+sovtcAEdzvLi7nBxFn
         WuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562987; x=1751167787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=cVVlPeLnoiQGX6UuXeDnaMZPxMsM4MRFZPRqWgqWzkC1jd+W0Lk4p7Wmk2/JQW/fa8
         SrHGzqh+l2YXIiqor2+Zk3qVWPvqoL09BTVUKmb5Wr+57LoM71EZoU8fyi4zJUebJQ+I
         9+bEOQfy+LhCurILelo3x4jjWPaN31dShOJDrHHPno3kWOwRoeXPqE14tkMK6+2Y6h3h
         kFeOJvL6h6JnmcWLYJ/TqrmEJcnOjyNLHweNyt/YNCvg5VQvTeQxVNZ0aIIj3AKDLUrb
         Y4e+1D2qUd/B/juuRWe9Xorn34yvCjmN6XYOmZ8fGVtQEPlml5NNNJAp81sLg+Uji551
         zu9A==
X-Forwarded-Encrypted: i=1; AJvYcCWUJfiCDTtSc/vx7gJoflqbSjj4UWnOOIgj0Vwp69kwopwcM1M6k+OHNRDuD29J3+QuIeogYyLLZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMDLx6Zo9lFjhrDNKF1aWnlzxhh1LgmmnXSINUd89+XqOeyoab
	TvjnlUvRJhiyCSvMHyPD31g48yIK2rv/6Q34RP0VS8wiJNCG1CQfnpRTiFZZdDtQykE=
X-Gm-Gg: ASbGncv6NPR0oZVNgqAsefA2JT9rF2Jt3HTsGzIqj/a+GGqWf9VrbDPwyjx6BoHbu1v
	03UiHq96tGIVjD1dXGLoxE/VPKAVqKyL9TqWh1kX2sWu2HBdghGeHgqWWbSGgJlAKwTx5cF9tP5
	B5w23JOSn1+zso5Cf3EMw7PU8MWX9ucPuNIb6k8BbLwPkFAWtfrQuxWkkGrQ+71iqE2ZIpWZNnt
	tEZ7XtCezhcvZ/fglONlz/U3MOswjaOj1PPAzgFkYa9wYb87XocS7QHmZtid1FGYxhN3tE355/A
	XrRgVpfeGMiV73W/R4QuINCIle941IsmahgjBbbkWgmlX32br24g8jW83/QpE3CfBIQcXsWQ0bj
	H+0Gnpybwj9UoIaWSb6Q1xU2YJWKL9oFrBAs=
X-Google-Smtp-Source: AGHT+IGgC0s5tLXnKubHAjilc/vdE9TsS2rxF7dNnxQoxPszakpBCgqiPMG6aQ5v+WXvEF2OTx3kZA==
X-Received: by 2002:a05:620a:3726:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d3f98e8ce4mr1234323785a.18.1750562987233;
        Sat, 21 Jun 2025 20:29:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat, 21 Jun 2025 22:29:33 -0500
Message-ID: <20250622032941.3768912-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
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

