Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4972D540B
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869688; cv=none; b=dB4AW7B3+uJVdhnnFFnHjQM8+SUU+BHO5lUah0I6YEZYgZc6VAUiACmDrROhKBkCmiSlhhYZykB6Hd7Pq6t7E1QZqBjQdL66FwNgu5MpywWwIWEHRDBMjHrNUEp1ckUNWfyY/FD1cAdG/jc8Tn5gDnhFqXKO8ZCmLokdpD+hMKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869688; c=relaxed/simple;
	bh=hMn6z2AZyzcbL/cGMK7HwRD4mhVABvJkOEyvUbzSheE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSUiKb0a2jpiqsvgu8o73sXokXy6br0vNAeEiutojyh4H18E+xpqDAM8C94BjqQjnroXxH95b61z8ljRmctAJoq3QHrD+dou/v9b04vF6vnBfOZgWkN33rNQbJIwcCVwIekAC+tYOr9Cae8dzQkW0CT+/1nHDemYY3FCpw0WLQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DwWUX9Q9; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DwWUX9Q9"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fad8b4c927so1526776d6.0
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869685; x=1751474485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=DwWUX9Q96X5PkeLyp17rZPAewDk4EXYAEyFtLLnFOBvhe5cVsEx6hvFr0qznVdlbzx
         ljK/PplWtmWdcSREJ1OLm3nkyZl80p9LeKbTKE1UxS8N4KswtiUk3sSwvyzOsU+6tjFz
         7LYuwi6tFR27AKHMCfWUJOJbppsx02Kcm27Pa1TLOBHPZEBg4WYQXiAXOtPlUIzmt1KO
         aVcm6DN/gyFHO1eBEXRNe9z+pP5I1p95uq7tR4pJD+64Tl3mtiVeiPEoQK99Nd9rYNgV
         t4WXaMCxY3DyQwj3FL6CQKS9sukpQV7YEJoSou5IhqUdbSK0hq9C/568vfxBzfGza/lO
         13bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869685; x=1751474485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=Npw8zLUMequA/vE+kGaysDlk5Xxn0fxt9bg55jh+bl22os6mZV0fmebDHiIN/D60af
         Z2xFONSJO0vDltBpQCA2EdojebE17an3hPkBtePj7kIoJ0ml7pGXsuGy+PFendBDL4n8
         fBljijBCjlHHkVrZJRTQwjIVXw3PqGn1lPzo7cV0f1pFmsuxKYOO3xW2su8bJdMpxafU
         0YFKHTyE89loiTiXNpSJeyUpvfu9nUYPs7Dlr7rL7W+JxjL7rq9MdyIqkVj3qnwI+yuT
         KQW0bdrz5jfz9OI3aYphy4aEP9VQkSHDd3s1KWDBgdyW5APg6jPS1mBrC4FNI3Emi1Bg
         CfKw==
X-Forwarded-Encrypted: i=1; AJvYcCWkVy3Y1kooAwEEg7B4sqtD6jKJE2V9hLz7Lu5t1Rgtb5FylJKNtkowuUV39ALB4DZieXUtgGQyyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGcBheHugngIP34oHYEGfWwioSCnCDgnl1B88WurQ88v5P1ghI
	FiGC2OJj/wv5lDLb/vllBTWQYvL8/dVgv/Aol3pNVIXmvV5WpvmssqCjcvxvj9wPcnI=
X-Gm-Gg: ASbGnctT6/u4omPW9WsRCaW8ne4FfW8lZqs+7mvJ8ma0IyKtKUtvIdXrllvCWNnlyWO
	eqMPpSIoQl0l6W6VgSVRcZXFdXZ4RrcmuSm/mZFCds6lGHSb1ryKJtWnn+9I17lfb8dIzww13jh
	cdLeN4R0EDXhn0O3m6boyfGvRDndTyZmwjNPJij5TeqGXRX9AY1uYCbJ6sziQDZ4V7EBpj4IRxR
	bt24SqYsMvk6YTy1O0OBbf16v8BZcxv2M/slGQvsCfJYLH5fLlAA12UGIIK4d5L+wvqZeN4fuCE
	TRLlzWbatwvdUrvDV1MrIGVnPwsC0ucTMC5XnUmCdbBFny5UfwqR4wl8aQCjUsS6G9ZUnrXqKV1
	CRd2uvmBO8EuwC4hjMFLCa3X2NP0yNYk+cdcPpTKyGGduTA==
X-Google-Smtp-Source: AGHT+IEJjH8bQjuNwdtdMHcIqr7TaeXw94sA8Sz7we5uKf6oSd/0mHR3v6BiNGUMN+0Ha8bqXVo/yg==
X-Received: by 2002:a05:6214:dad:b0:6fa:fcb0:b88d with SMTP id 6a1803df08f44-6fd5efab193mr58692036d6.28.1750869684773;
        Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Wed, 25 Jun 2025 11:41:12 -0500
Message-ID: <20250625164119.1068842-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
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

