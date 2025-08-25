Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4AB3019B3
	for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142468; cv=none; b=uI2eW8V/RRko3Sido2a2E5x08GJM8zSt4ZUB9XDaXk9bnKIVMwUWYUxW3T3AfuzHuWgL5qs4R4syhjh8JT3o30TnIk8mEkW4Ph6oZNzoisKFa0YFSE6z96Bq08tIV8XQSxqHViJe0X0yGk5kIL1YdHDIiYFQ9j+MSBNAzNZeqO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142468; c=relaxed/simple;
	bh=aevVzKjUd0a80xeiBDUHuCUKYX/2tnRSDd9e11O0KpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7sVSG2A7TWuzsVQ6sK12zKUyhbXY12Cx1Su30OAaVTTD1/nsvHBtz9PKb/Vhkd622IwfPykI5B3BEc+NSCahau36sFMKJCQivDTyf50wvgr3Z5s7+9vOW0VEl4sv5llENCSdXspimA7bAgsEgnY04imVceQFZkX9Bz5lhy9seI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nkf6ckeu; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nkf6ckeu"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-886ec1ac877so4512439f.0
        for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142464; x=1756747264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYY6dLm3K5+01OXDQO8emoD1CldXvYvk8MiFXHZCE9A=;
        b=nkf6ckeu2r05c1jWi8uC05pz5K3nk0AFYg7ng8Wvfia0CyqnYRgn5ZLs0iNOtccWRU
         XOH0hFSv1a/wYNjQgyVQjRo/RPWWAk0OHM9b24KgJC6wGs8MUddrEgjTrfJFlhmITuQ/
         joPZ3VVN2A7IA7IdBJil6jCOK94jkokiSPaWwPO4WTuCrsfMK45NkvJyP+OmTCPma5sJ
         bJOU37GN+NS/AuV5FOHIHWsoOZvsqajZdQq02aHquiHp4H3um91EoXWsYnA4aEzcYPgL
         PMweYlMJC6IKDJYM+w3yX0AQ6/bAASSaA4ipedjKVSbQR0ipccNxiqrIdRTRRFs/AOnl
         dD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142464; x=1756747264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYY6dLm3K5+01OXDQO8emoD1CldXvYvk8MiFXHZCE9A=;
        b=LDCfIwbmNSqiNHjqrBhYuKJELgGbkAdhO7v55+zvE2SrG3n6irHB5ipFsVLpj+8AS+
         gnfVzcxIl/qNMceySun8MQxnWaB3sZWcqEudEQ/cIgK1exAxar8tyGUdngXLfRgWsYBm
         N3J1VVH/WDXGsEYiatOlIZwpKnroRDpgGzCAePep15hMDXuzgczid4hDAT09AG+HURGX
         zaoB8BHEeF7PhdFtD+3423lM6GIShAssHX9Noa2YdxKIKuIyXcgORYfhCrZF6IRM3ro+
         Gy5T8qmBOrTX7ZplmRtnGPknixOKa+hVIIkEreqzMsA/ky/wj58joDr8gOHDuY1vtypm
         +fPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGBxmXyZuDNEUKVsq8g3OOasCOsiDlUWdRWoU+5FgxG1SS+WV+w6rPuXbMYYGZ8mRvX6ylp2bxFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqWB2ZEVM+FRp7N1Cbaruz20yoQ5BJ/LiOJauFjsFXeLKfKhqq
	rFunRkB9Pb07GFc94nCZKDNxq7lbrl7QNZMY8fDtN5JHoPKHjC2aexbWL1C99KC98/g=
X-Gm-Gg: ASbGncso0fF1i1b2IDgdBIhP7q6e830XlnrlQx7EWz463jmVkX3KIlAl+EfWkgZ22ey
	EsoO0KSx20T5TBvKoNMyjMeB4BqWxRr94p8OGpWHHHFRkIp5TtZDcZ6KHlUyclFGLvdinO677e8
	gTQF1UAlL2xpWC8/9MjbLeuG/w8G2nT4dVTMkNk6B6i+u/IwJ1Q+IwwcwWx5DB7FUvUgNsLRNBG
	2wucccZO3aqdiEJpO+sZbgpXjIpi4bjvgx4eN9dWV+nLqr/qNQUC5hCm+PgvSYyviIHQtXDqyyf
	A//OOxy/kvm00CLNQaU5TBWOY9svrsfhe471LYpl7zPr81qE2w7qD/MM+BmGNkzgnAjRGGahXaF
	i0GCNGdLRb5o9zDmeMd6gdqBohZVCAKZNbvBETwr56fyI6UYXJ3A0Vws0n0SULAUbgNoWvHVexO
	cG
X-Google-Smtp-Source: AGHT+IGBXlU1oq7Hq3Hx+zyfwUPdCk2dB9M48YVwvfYPzgOuu9eQp5VooSY0xSGbyY2yI7LdGuyEug==
X-Received: by 2002:a05:6602:29c7:b0:886:c53c:9171 with SMTP id ca18e2360f4ac-886c53c9338mr1220679439f.17.1756142464463;
        Mon, 25 Aug 2025 10:21:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:04 -0700 (PDT)
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
Subject: [PATCH v13 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Mon, 25 Aug 2025 12:20:50 -0500
Message-ID: <20250825172057.163883-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
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
Acked-by: Troy Mitchell <troymitchell988@gmail.com>
---
v13: - Update Troy Mitchell's e-mail address in "spacemit,p1.yaml"
     - Add Troy Mitchell's Acked-by

 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..c6593ac6ef6ad
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
+  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
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

