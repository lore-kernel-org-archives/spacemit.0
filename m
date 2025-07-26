Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A7224676E
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535413; cv=none; b=Wk3aPEPCLx2f5e7KbcSjFLbwwuz7AodZnCJeNq450BuJtnOtzVy+l+bPBWoFdtHhtAy+kieMlrdOG4mg5mEd1YrR5fcV/ryGfuGZEL8GkZyb176S0QyPc8UhpmL3h9rltIwGmLWux4IbvyDVmOQ30iDQXOulsCrwsfAAiLge3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535413; c=relaxed/simple;
	bh=f3e7VDZ5RpctNbfj+dyIcOXKfTplNtROBxfFMgGp3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPN1/zbtUOynvFb3ceQqrXf69h2VdKnT3DNmJSrFVi4Y/e/ah2qi1Xs8oXG1FW6TX0s7F00+HOLHGrcW+nrW+Y1VRyixWdfwZHLkfFGuIzz2CnAPQRwAHtLnPzazAhZ4QyyKGFTrQMvWqOTCCQpxWnoURmWlQ2lghb2F3+BqXYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WcrioUDs; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WcrioUDs"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-875acfc133dso122696339f.1
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535411; x=1754140211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=WcrioUDs7B5tsBQ1wh0WDIBzUjwaEkQThobzhUF6kol4EZphkEnelZ6XrsHXC9aabE
         bJSbqg2PpGkRvHrA9vI27sQ9z+vDS+r+LdUAbnLxaxNXUWS8U364dpXI2uekLBqi2jQk
         2Ofmx1GQT+xyIVCj/OreX/EhJJj+P2SRMeU592ixeo/idhFtzwgZee6mVTc7c1p8BW2t
         5f89K6DRRePAUDv4XKc/5TbkMJJ3ftIyiX8OhzOLwdbgH75ovhI5BgPa4M9Ji7YaICkP
         Xm/zXpBiz5BZI+ZXehVIwyR9JbtdUtsCQZOmS9Ji7pLDBhcr9VRq1RsAOq5uQTTgZRrx
         ZKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535411; x=1754140211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=VNWmUQ6HWNtIF8qO3V3JeUhczE60+IcIs2HwGjFCsl2gYl+4HRRVCl9yplPHmf6E89
         0SQNqQyyRRJEslqQt11PnQnysxV68olczuWdnbutshzNynEXomgCuam+RByq2Mrgd1FO
         Js8eUuqWvzA+4t9w5mSm7U2hLCvJd2ZqaeX/V6x6KBmMe1Nwow5AWqj3gSTJN7OUaT+L
         REBEB1epDm4uU0nAdeWpCHKxN4t9fvTm+jJqNkcK6C/u1dpJPNjSXOwI5IC3q9yFZS0B
         tkPzdmoMu/+hk8806N0ZybKb8+PxUtVzGw6/PNrA92WGItjRel7YOApR01Q1xZOwlTTj
         6pKw==
X-Forwarded-Encrypted: i=1; AJvYcCUbu8dRIw5IhocW4xb+7i1VB0i84aLQQWYrCiHicOOfebbqg/mbzKaBh4+rzrvqkn5Od+7KgtkQTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDrcjPikTZfFAHoILNPKFQVchlhAQoqBlYvUiCgajoqKnW6Dqh
	62/GQeSch5QbG/ekMj1IZtO1oTeXrhA5pMGvaUKxRiTP3KtI1Er5VKG1ngbzipZvIyQ=
X-Gm-Gg: ASbGncslzcuLGrD0f1gOhSImrmDvq+6KwBTXKAHCtu0VDHi0pRcjGTE7uPkWQEDAJmE
	L7sACEujgzKAsbgswaGlZfoF2PH6aunGO6J5lE6GyxS+ahDny5Shci1WJfAlreV4FOWB4MV+s1C
	ZgYX5iXuQIqtufeT+/bzSD7oFw7qAQPhPJvEekf9wzDrijIKGHu9508sVql7vbUHzPYrQt7pexY
	MaBuBbmCIfBcaXNe/vnlysbj0tle3FatEOmx/9hApwgWTXctQwrEKFX1Brgl0eEVpv39xWolvhD
	aOLkTUzre07DczRJunFKwtEQUbLb3kMM22wL44XUWH0usDEgZV0gGOoNnduNS1aEX+k4NFn13kw
	aiwXWt347PLghRlBED5pHG5YacKb7laT/avJ9fSxCYTVdTBXV6n9Oq2CMzNofHGmlOjrgySLNlb
	an
X-Google-Smtp-Source: AGHT+IHyyfkAGrv7e9QP0fqrvp0iqIuBvwoIPIrl5BUPHk4N3KVmqmw/7gL1AW8CJAs0LQjqCf81DA==
X-Received: by 2002:a05:6602:29d2:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8802293bd79mr912922239f.13.1753535410568;
        Sat, 26 Jul 2025 06:10:10 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:09 -0700 (PDT)
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
Subject: [PATCH v10 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat, 26 Jul 2025 08:09:55 -0500
Message-ID: <20250726131003.3137282-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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
2.48.1

