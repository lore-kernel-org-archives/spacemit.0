Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E185271451
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341119; cv=none; b=b8/Pxk2t22KtYmg/uV40N9fKbaOYihPDG63GkIyHlYv6lw/yEUrdJ6h23Z/ZHWNRRGqr3tz9czYLhgOHbU1J2/OF/h70JwlMqNB00P5agyjSqNHRe+9I8Ic1yiiF7iD1CpzMV4+QZzg3j1NvPQAEWk7a5kApUcQPfcQ2uyREo6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341119; c=relaxed/simple;
	bh=cAHhOLAHGIZflg/S4SymZ2z4viws5qDWxv85YpH2WPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqUW+yzhXwAsp89DLgkEMWYb3uZTGARsfMfwmiGm0qO4hS8+aVJfCTQ7JV8rsAulTlGVNBt4S8iYXhydT/3gOml+yg9YNka15hm7vwP2MhPTJrSbgb7+1p64HBExZzu3r8rXzstlPb48OWBAnedasWHOxJIK0M8XfTt85QY+Glo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zOUZyNH1; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zOUZyNH1"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3de0f5ff22dso2400765ab.1
        for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341116; x=1750945916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9OZBf2ZEclqneULzr0nY5IJTm6h+hkq5rFp6zftd8k=;
        b=zOUZyNH1d3SW2qdaGElhO49htF5qB+IwxGYAbpoIUcEBBpEcLK8Nram0XPVQI4u0lW
         kT1VIJ+00HqGuqhMCwqtIobveJRHpvSrZDI+nBn+eItaOy1atD/0GMYMLD/pg38/45OC
         Bc06P8WTbkfdlUc50RpW9euUeAR/1A4AKR8c3XIrlIxD6/8DfVzrprVOmW4tuTYyLuLJ
         JS7+S7LWaffFFI20Qzjum1No/MZniXorBD+4WJozXQTbEYDa1bRuEtCOAYcy7odDKEcQ
         v1F7jRRBcN7FDtWRETCceqPA5iDgmGTyqAxTGyL7G/8Itkv7dl75Cp7lcRQEiZFRKsUL
         0ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341116; x=1750945916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9OZBf2ZEclqneULzr0nY5IJTm6h+hkq5rFp6zftd8k=;
        b=D/3xzNPK2cn4H44Q4oprs3NJAvFjOcKWcETalOh48PRFm8otWWIMUi2sLUvY1w/Tly
         lGgZorTK69QHRQ7IZO6h71Tm0XPD/Zxd79XE96WWXRhndujWftG26Eadiymy3wmRsLUk
         Y5hIXAhjUOr2N9KI6m6KbzrJ68t6UfkeuBRfmpI5l3X8VXuPTuz0yC3dHFIRDAZxbUQJ
         Qh1DfM7qS1M4LJVZL/D/1/8K9iyG+TI4OGo7irOiItxpBdtoTx2xZWqtVX5yT81InC4D
         MsNX9hVGQzkxnSO/7RbhmGHOEXO6wB19BdFJZXEJ7lzFQa+0W6XKo0CAdlkBM2BbxJkJ
         oGMg==
X-Forwarded-Encrypted: i=1; AJvYcCXgkNBBve5zIhDm/EduLCu61sepMlmWdmqqC22z9APKref3gNYfA5utJ0Jva/6T32XYNWnS4wQOzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEwqu/eECHk151dcd8yLbIU+BUUD/8hs7Zsx6zQtrHTWPcX5Ga
	qrEuJ5nBoAOFHjzmHs21+3RDdt1wOpI99QZsDrSoEM+HxKfUGOvkB0NGmXXT8vdrcus=
X-Gm-Gg: ASbGncv+Oqkio8pstt3QY4oWS4A3r/AGchtIy3knTGBuR8Hjb2uGG9oc6xCLSE+0s67
	UUOxY1kYo5hNTiQE7gca+HCUnBaCIGX/uAXBecrBDXYxMV5OF/1vaTxzoaVdwaDhvXfCC1Bak2r
	P0S7GZoUQrmRWI+Nwv7Gd/0Z1d1v//KgfPgdHInwbchuZdWBh2PVjc7i5U7FC1mbXkVYo3wRqVW
	ZGTxBPo6InsL9ovQpJsbH0Rhb4C7pUamGFKm8v58J2YQFE1aPNyh3oY6BB8dgUV/6lR+1kExntv
	XISQMfRetjr1QGKT2vD4+InFMLNQpgm6/gvqP9CDkzqhx8uAFc1ZugEzEPV6zdzRBugkg/VGzD5
	rs2NLCQGWWJPRajg8X3iOcyE3b/Hr9YQ=
X-Google-Smtp-Source: AGHT+IElaXHZ2UeHWaQiwWXotIWz/yHFM2kkgPfUkrNCPfPJv6aoAzGBdh75tg6zZAr4XQkckxbbkw==
X-Received: by 2002:a05:6e02:378f:b0:3d4:2ea4:6b87 with SMTP id e9e14a558f8ab-3de3029bcd5mr30770725ab.11.1750341116498;
        Thu, 19 Jun 2025 06:51:56 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 19 Jun 2025 08:51:45 -0500
Message-ID: <20250619135151.3206258-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Spell SpacemiT correctly in the subject line

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

