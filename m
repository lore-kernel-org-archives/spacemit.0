Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF942F1FCC
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169875; cv=none; b=dBhk7p/iLvB+7jxi/EOUAgXjg509briyUl3u/IjU3IhRH/1dUm0kR8BV3FTU7gqwRZFJfMBlj0hXnMV21ljkWqRVOdNDUqEK0TRzC9za5nWTmIc8zvH+2JA0DRpyLSkligQLO2A/CRy7W0iKE1XCx8Pb7fc64RGXRl4ePxepaMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169875; c=relaxed/simple;
	bh=TcSAvv80iECU+EemBY/QAFaaDjBspFOa95X1JROvb5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5GSkDK0agRqTQf8kEtFDR25864Io/nYyrHuYcSKfqEKXFcSmyBsl16GDpYRJVBgAUOPGauPdPU3TiFGjw2FxXR5hDElN8FbLwMAMqvZ1zE4R0eo0L6kLOvlQsGCkTNpnlLSSmSmuOLYbYEdUMNKSDCSd5rmwM1IhmGTP8WHwXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pSidIlux; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pSidIlux"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a44b0ed780so13957661cf.3
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169873; x=1752774673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=pSidIluxe2zm0VK6znyMhKbKZKSgW5zIg2OeEAK4CI3n6Ck8g+i+p2OXJceMocyT8p
         +a6sDtusKxlzHQ6aRPa82E9Sb+uOxfckltgylCU9Ahj2kH7kWXuybQhD71ySQSzhIZy2
         RaVSy5rGVxf7+Fj7WECPjL4rFn8KF/VNUsHgpv37UeuMoTzLL699GGRJfCRK9wu8NAwA
         slT78QYoqABg0Tcl7FRoIfnaEtgTpZYjN292e/UaWDPFZbVKBhm1oO4S3MPb3rgRZ8jT
         iQ1HJe332JCwp6ZlC2fCTuQRsYslHNUBbKR7/qj5uU/adks/zcP+EHGX8V9bmZoEMcNG
         +Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169873; x=1752774673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=HgfhHkV8UeaUuEcwPNuAbtMqg2SKyVF/vaWB8gtmhQoB/C8aQDDx5bpsPHcFpt6aCw
         78C0hYHPJdClIZUwRwsLQOUiAkz0najDOh46mtRzBEjLmZkWJHfsveCHyxHWDmQiTmYJ
         Flbtm32dfCIoZC64bgjTBxNqc01L+Koi+vGNqdL9WNtAq7noN137vsCc28bm6MdnGPYK
         iNZQT97YnJSJoZCkTZkKRD3c0rIwCNW0NjFu5B6IziU1aFHV/FzS1bYpra48/dDG9Hia
         LMIV1ap3zi49rSdD89OnyTrVs94Ne7ou5OPKQxqUt6D+Gmy6Lg1fdZkOsDyrixdanMZ2
         Nczg==
X-Forwarded-Encrypted: i=1; AJvYcCUrL4qZvY+3Dbrg9Y0ZpiOSCyPMk2/9ajZ5carDpnLVMAtCxB5SyvJFS34Bz0FM7J9llmotSRJpDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyApjamm0sWVjLzh5/1L2YzqiAOGcoQwfa6VwkDX7XOvm84Rxe0
	iDD3TVhlZlN/HdhBHhReo46m36ZbDpv6ONVW3EBtk99Fm4ga4f2RPBcFwiYJqv3NLwQ=
X-Gm-Gg: ASbGncs4yv0jWPPYuBIzF/wIuiLA3wLxbvnBp2wQqIhq+V4LR1qwJLYo0GsUF8pzMea
	AllP6eBID3uHJXnmepolg40stwHu+FTlMiorFpPkhB98DWRcYtylH8/XzXudtF08eSX0eJ0KyQ8
	pWOmy8Y765uSCCxF4OzMTuapX0LXNOnXGIXMEBHV9ntc8N2kF+78kvsOx0U6F+ZSFXsgHKylasM
	JDDFR1NUWT9AKORmTdYNeHODMLF/P4ICMg0/LzEWS4PqjaGj2noO4LVBsr5jsXhTP8FyoxqL9AJ
	BjP2fUlHUGGAieuqwvvrFa0iUp2KID/77Pj032S7oKryuq5W5zH+yMI8lYzGvQH/jUVov0CkxsC
	ywEu2Gv82qYGiTO7tumqUcb0AYZIkIILqfDk=
X-Google-Smtp-Source: AGHT+IE0cJRHVoq9k9LOPhhDX5Qx0jjf0lgcMuAEVcjuN5h/JF5bteKTincAlkOQmKWP6gWojXJAQw==
X-Received: by 2002:a05:622a:4acb:b0:4a8:1a88:7208 with SMTP id d75a77b69052e-4a9fb9a670amr4227831cf.48.1752169872379;
        Thu, 10 Jul 2025 10:51:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:12 -0700 (PDT)
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
Subject: [PATCH v8 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 10 Jul 2025 12:50:59 -0500
Message-ID: <20250710175107.1280221-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
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

