Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE9C2517AA
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388721; cv=none; b=lGzDGonFCUDv7/brHlhhxHXU2qM+V4Zya2elqFYZAH8m3St+uXgFx4tPVK9Fuoj9K3dln4M6mi4p0PBBD0HFPcr995ZGQyXHEgGS++aDhuKxvlrU7Nja1kLat0R9kNSCCL7osodr8hUrnDCW2HrJSW+KfSvK26o3egBeWCRBTpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388721; c=relaxed/simple;
	bh=bU00eIbaxTlZ1yJH4SI23SGz9SQnCl2cghYFI+SdoQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3M2YQmjvG//i1OJPug4Xpl382snKqlAB9iuVqnRinIbcEF75KqGpOFSa8ieSnAOid259oThm1KcZX+P1HgrG2LFj7kn3fu4YfJCgG2gdv2WmoLdKfIWtA98Ow4wr1xvTbZ2oUnEXi5LE1Ou/c2Ju8WVYQ1iccs7JyKghx4kyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gP0J3bc0; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gP0J3bc0"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-87c28e9e7ddso104031939f.1
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388717; x=1753993517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iG+v28WWuHGvV9OeNkoKxEvvahkCo7ownJvbOD1hUw=;
        b=gP0J3bc0dyEE8V/Wxkjs4hvHI+W3ulk579sjZK/cjbCcDSGmhLCD4JBbR5CT8eUBdr
         qISnfJeMtOHlih/aNVzL0MZ8Fw2mhAelrBh4OWYrf7uIkhl9Ug64rsQziwkWf0fYuFaG
         gmtur8IHvEmhvPVHGLMGu3hSyrYLda62dhCBJ4p+mm+fNxic6jpsqRzfUbm0aEjq5BtU
         mAr8BNvmKg+hYOjlMZN55xolWuBZsr3iMF3fmnkiRXmTTzYjypa69B0xwvl9sny+7ayj
         4LWgbT1TQb+cYhtooy2sFNIkO7HZr6mA9t2sXevimszHuB+N7FXGBEuTUP+qShRecuP3
         x9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388717; x=1753993517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iG+v28WWuHGvV9OeNkoKxEvvahkCo7ownJvbOD1hUw=;
        b=uozP9cujY2DC2yDAGzHZ7IaLVqF0iC5zDiQPOazKYHDAHm7WgZtmioBG8+YMQD3yPt
         v4mZNAnMSddq+hCOp4Js0ofrwXnQxb0ENzg3hQYdVIBEJMvQgy/QOSZwFULwXa/ryh6G
         6ksCAZOze3HIFXp+GkeAp0wA+SNPZ/NMxVHiToyjkMPfgsahit4Gv59PCQmLjgI39Hxl
         etML75Yo0H0SVyr563ceBFdMaiEu6ZVFfyqJ4xUUTkcjF6mtWacoL8cIHsAcQ10V+MvB
         7mHK/Q9DRCFZmQTXGvA/eT5J6MjJY/4jVsVKEOfrON7Jlg8l2k6aCs12T3AnqtjyGYMM
         fMeA==
X-Forwarded-Encrypted: i=1; AJvYcCUs6xqprSFnAfmr0E26x0yQJut4SoF3svsigFf+tHCC6cjLUyTTfOqZ28MOVQBx7N+nNmJf1l+Yng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzccw91d3qAlQg71OFeh0v+rlo51qAJXT8moXgTcp1+khRPgXLl
	F3C4BbJ65Lhvo2He1G3okDo7XFiwfBLhiZ+S0WJ8n012PFRch5X2VdTFvcOLC9jRlYo=
X-Gm-Gg: ASbGncsGvlMSUf85E9HkThdEOShuv9aaRG051Aew6XnM2nfUuhfBpQrNh7EFRr1Dq1J
	UnNPYLsnvbMt59SoovWOdDlnBSabYx68btNSsBRakR9rgh1b20DhSKpQlIQqVuN4Xxuela/WBcP
	vhbyKRuFElBGBLsQUuAUcayBB0zSmXQiX8R+Gz4c/x/EEezW+J2lXvtL4sqRinK5Cruekv5grOW
	2Zka8FyCWRch8wwcEWqAXr7S3mz1DPPvsYdUz051VIQzzWh+RNw/8R8+e7h4OjL8egYeHFpIdtB
	3C8htJ7BImlSZpIUS2xTGHleNZFQFO0sSKPqZbh5OxFGWQ9p5v6gtbdq2YbTABlLM08xDrnEr3h
	2ud3CJjDDetbAwttZMAVIG9nbymGXGW5UJKiUb8q3B3DDcel4OWI=
X-Google-Smtp-Source: AGHT+IF3MGunKrhFL7OMCRuAamAqvXPpD1zcQkVbRcO7EjbuhOz10E5IrYVw1aiHLFsX1ofJu4g53A==
X-Received: by 2002:a05:6602:2cd5:b0:87c:31ad:abe2 with SMTP id ca18e2360f4ac-87c64faa2c6mr1456048539f.5.1753388717180;
        Thu, 24 Jul 2025 13:25:17 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:16 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 24 Jul 2025 15:25:02 -0500
Message-ID: <20250724202511.499288-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
2.43.0

