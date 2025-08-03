Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D117A2FA
	for <spacemit@lists.linux.dev>; Sun,  3 Aug 2025 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189900; cv=none; b=APwdubVnArOY7YgNoanlzg3k65TPs2yskqmSVmhfkimuoUFwB2uK1TNs77yEp6AHVIE49G23JHJ6nkARyEV3zZ58tOgHDS8g/tMFai3Mma+QN0qWzbwEPhY516QJTY9RphhKHjJY+CDPrLhmum5Dx+Nw9xJbedvYg8Y9L/BfLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189900; c=relaxed/simple;
	bh=f3e7VDZ5RpctNbfj+dyIcOXKfTplNtROBxfFMgGp3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XI7LtIgfdRfCsxTWwDRxUA2JUGPAHgxtDbFq85eaPeP/BXOepii4kEZJG5jeLHITqbKCDlIy1seWAymy5gyMYtjVb8Qa9S1zs0NgDNhfF+Y9Ww+InW0gWYG6AtCaaQSoY1uhlR0OIpXQvEiu9PDYyqO0ZhjmGAshj3ej+VIT0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Lrfwz6+L; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Lrfwz6+L"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3e3fcf5b150so24715045ab.1
        for <spacemit@lists.linux.dev>; Sat, 02 Aug 2025 19:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189898; x=1754794698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=Lrfwz6+LY9iW5SOMGKMGA40x26+HujzuQpIk9ovuGmgORlADLndsVakLu5NmVr8PfZ
         g3vjwrNx7biRp69ojWt/Ue9fJpw9okuMcBz8V5v6ETgmByJg/j7ts2YeFweIRh3ahwAx
         9ICw3HnXKL0Qmn/CxRWsJEUt7WjjY53/yQnLpyJpbBD05dcMlGQYhxaSDOFP9b94+T2v
         cVRxdSQZBzdP5B8QpRJ/NgMKv6oSTwMB3vRbk2nld6x+RHX9QXF1bAxG0uHgLxPUtvhv
         7ViG4MJJSEYvm+IUzzXxSlkzsd0Vl3FxRT2PubdpCcTnTKQRJ4qpSmqgKyBQfGArIkTi
         IMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189898; x=1754794698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=YNwAK941+I/Hcr1hI/SBvTVa24nJ/5p1sV/elFsPFLibzFk46ceYw+oTd5jb2x5lNk
         Uvit+dXDWwH2ZwUaUyi6AMm3z63gFNLeKFFSM5qQ9r7PI1b3YcD+xGhEq4UVcV8tgf7Y
         XmtYOSvAXkdlCztFmEsc2ythYKAD+RtlEk6f6/czP1/ZyaBfiTpQU2FBLq2D7AlB9d1q
         PNVmSMSij4yw+o17BPPYgeOmK6tH76ycLljFM0IsVDSU3DhwShr6YGx1n6NeiEmyuj3i
         voxpHNVkiR5Z/r1QRamNwS+V6K7Xj7E5Qd96Lk1lI04Hoibk45+PqwZpEJrodO7D80bo
         htrw==
X-Forwarded-Encrypted: i=1; AJvYcCXpBXnqXnm1C8f22FYFZdBDF1+dFQek62r5Dt2kYzPNenr7AiUZPMZUz719QSPvussf3rGFnY9k2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWTfnlAlDuLe3AvPUQGIK/2c7Eqq4ggScYpnlh6CGgqmTnrG5J
	BwUrgdfAB6tKM2GxTvoSj0yLgrNhNSiVJ4Kz+Lw1Cf/U627ftfWOVczVw6uVuHMghDc=
X-Gm-Gg: ASbGnct/BfIimZH3woPdi8FQTk9MnZpbMStzWSuZGKKOGhMXS/kmunB9VjKLjlV7W3I
	LEAJULMSPFJDqxBmRIoEjsMOfuiVUBmas9rt2Qs2HLP9F/ZJMi/DBMEj/ePqZK1dymis4q9YVGp
	U/VXob7AGxxfevvjEU1bXioxzVawydkCbiprybQVgz1vs2ZlN3OICfcQG7p/B4Y4Vo+0Mk5LxVh
	Bv9AAVe3XoNpEhbge225qPHbsu8rhY+uHAgv71cn7gKcQfkWimLZvAHbL7ZheLuV4qfxBOwHiN+
	bEpDnrSgc1I/WQHZIgrg8z2XE1BJ5NS2QeQ5BLH0EXr405vH4ufkw7EUxnCecAniJdvPeQmCJNO
	WmfXxhGRi119lWJ/wwr+x3McJxQ7UpqP2f6lYx4HiOzhg32008frQTT4uqKJrUcJkIQ==
X-Google-Smtp-Source: AGHT+IE1EI0ik3qR8R9p6oS+/rMP5rmrF5tbzg4vFpoKSdksN0WY5toRor+4wX4VhlAJ+LsTRTCKSg==
X-Received: by 2002:a05:6e02:1485:b0:3e3:c6a6:2799 with SMTP id e9e14a558f8ab-3e4161e006dmr100052085ab.21.1754189897967;
        Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
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
Subject: [PATCH v11 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat,  2 Aug 2025 21:58:05 -0500
Message-ID: <20250803025812.373029-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
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

