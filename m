Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099327472
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053118; cv=none; b=WTuOZLDdIUSvMSED2AlgRKKN/tQvxhcdbKNeu8/QQH6TTK+s7byILTy3q5xk4X12nzcMduvYjObEw45H/YXQuLT6ji3oPWqv/BX0ktQ2C1TaiT38tcXHJ0b6kx2WuigWmbcTT6lav32EWQ5n03JBx8iBjO1+2hGdGbxHgvAmwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053118; c=relaxed/simple;
	bh=f3e7VDZ5RpctNbfj+dyIcOXKfTplNtROBxfFMgGp3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpA+w9G7OFXCY9ymWSiv2Jmy8cHBfqZV27cN0ga1XTma8qcSI0cbBd1sA/oAVOs5Xr/bch1j4Rf9ejTbChSCSFUfTfGn2ZMwaUN5WMM7uEjrdFcB2O0FUq0XA4F9f6TkQcfHYPv+alSgnnpvrJ71XnGws6rvdrsRDno3qme12ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=usoUXOUF; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="usoUXOUF"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso25687895ab.3
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 19:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053115; x=1755657915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=usoUXOUFBrm3LMkYTGADpCcpEtzupQ6+QVqZUY5mym4BMAA5EUHj4eBQ11LYaMldYA
         n0HcIztesPiMZ2x086DVhaCWNpGm0E3POb6ayH4FU894xEZ556JFGQLG5Z/9jpoCL7F0
         2DwcjDAMqsOLP1IbhVbMu92IfKRuYJX/41TwXLVZCsNp6snqo1PJZUqy14S5IOAwKgXx
         px+mLQJ0rphNH43X4egtUUyCFQa0meBdhaugWDe5Wx3KelCsYNS6PvYgIiM6Rjr/zVAn
         LsuQW76KK5U7K0Id03bb+i4uoBoajaFMdXKE/V33RQu2VelP8bSYvojlXGC3EgLRFULX
         /CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053115; x=1755657915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=xR6b99T913ngRjQ6+IbI/pzzOi9fEPcw/ukLBPUEQz/B1XiWpOCwvZzG627Oa3DoxX
         9No+1yO6k3KgW2IUZVtV3Pm6902iO2eJRRfYHzzo2MZvuvCYDx5jKGA+ykDJIlu+FCoN
         aCe9rObsDUxQhQSqc0VpQtlukKg/ClvdTaoFy0dSm6a5PcVcrrmXtFflNu1JsMEW692v
         pHB9lwltzRjdoEBVfsnBBZ2l1s8peLEMUf8ATM/eZ/I+8dWWG4TfyXLqa51hSn07O4B0
         4BASS0HIRbUDozOxdKiXWofo//2hk8KBVjfaiMnWnxRSwA2xwCUKTbruBnwqKOdqUOR3
         LLsA==
X-Forwarded-Encrypted: i=1; AJvYcCUfw37D38fOXfFuv2qssubpLNapa+/d0CO/SH+9ATBfCgbNQmASZyr65f8s8Pju8ejNdkmFbVIjgw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4L6KpTN/hDTjwaqzCmWgPfwoOG1+jZFSZm0iHqOnn0oQZX9ZX
	+KffRIrCeH5ADfEKIV2gvnaoJYZGiLyDP+VUyyTRplmkbHLJSFdkC4RDjLW60ntJRxs=
X-Gm-Gg: ASbGncvOHIesIEfzmjf3fN04Zcvltdqm8Od2Wrg8cb3KD/+bqIRXy+TusVArSlsMq0Q
	XLKrusYpk1QFuIKTCLo5/wI8Svd+KFmAr4Ma+o9zb21M+Loxb0KnZftbS98ZlUTtZLkd32x2sjB
	W/wThXAeM2FFnusB8ClLpyBpHRsp7LpXrwXwy1IFrE2nXpxp7jXvXFTBBAn8rruRI2CZgP+hwiw
	Vt6QO+M1AcTypJmRym8tUZrNkjqFDngTy3A004hKPGx4dj6vAADjaj7I4n4mWJNxF6/kE4Ffi/s
	fHH4av+XZy3vOpcWIc57Cpl5+slBFgiqaD1ioIczIzLVa0XjdazMkb54rhhxkJt9gESvPuTCni3
	Eu1x6XBvnseP22WFrta3ERBvD1yXochTKJXim9UuPxeq2/8jAViOZTMK6BppwPr31Ag==
X-Google-Smtp-Source: AGHT+IEIj1vS5MVYprDokhwZ6AIsmFX7Hyk7OB0z1ohQkNDbaDoool+pCm1v0mkiT6rf8e612agvcw==
X-Received: by 2002:a92:cd86:0:b0:3e5:40e5:bade with SMTP id e9e14a558f8ab-3e567367d43mr30922625ab.3.1755053115415;
        Tue, 12 Aug 2025 19:45:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:14 -0700 (PDT)
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
Subject: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Tue, 12 Aug 2025 21:45:02 -0500
Message-ID: <20250813024509.2325988-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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

