Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026A924169B
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848518; cv=none; b=l4KGbNqNrCd9s25+j/WmhAEIWdI4nohkFtpRXLAxG7vKLvcgj3QOdJGoxRYOx50VY4pp8BNUNK5xTtvnuRCCZ/+L0CgFAwcz1JPIeRDQsoXnq0WcxmqryaOa0URJ72Ms692q7p76IbvCrHREyz9ff7aPdKRn9UvTlRYdz+FovSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848518; c=relaxed/simple;
	bh=M3WU8j8D3ectPH33ard93KigKB3ohcn/1yhzmCZv54c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z964CXm0KzHUAuQ5RZiL9kOdBbSrpJ7/Dr6/rqcnpNRZU00MhfsOOPbCgk7cwjg479NSpjxgwAXBeOaU4IwpWtVVYob37V4CxX4o+tfm5orHz78FC4ybvmtCMUAupo23jpac09E5BNqKdApQN7PVh3Mq0bHhoQ3QOO3TcwjX/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hI2jKFu1; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hI2jKFu1"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3da82c6c5d4so22182255ab.1
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 14:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848516; x=1750453316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+0/C0PNGm7MxpNKW6kFIim9vzj9ziDhSWBIAnwFt1E=;
        b=hI2jKFu1n8UvFSizSZ+qxlDl12OBOYKtkrAsyAAbzn7ha2pvjx16lFVZWClEsbJ9CB
         Fqw5nCA33L8y/zzJ4Tc59P1wFghBkzJsfcZY56INTZsmYNQWigbftib54x76DsXYcw3f
         /n1H0B2iuMXrH5EQ1brYxhcYmNVDIoeq7w/UbqgrCqBMa5CFRARQjon5n9WWq9PPSwLB
         X/OqbTZzr4WKvfc6ndfKkccB3PjAIpSWTxxukumBVdbOjSBVuda/DuSc/QgJY+XZhpWF
         cH+NF0qh3JRZaoC9Ebg91Lh/QSiaRWCigTx6K05l2Js2lXw6IIMYaAp4sm/d1tCHluMs
         0cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848516; x=1750453316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+0/C0PNGm7MxpNKW6kFIim9vzj9ziDhSWBIAnwFt1E=;
        b=LRh1O3lDMAZfLe6+qQwsy6B8LaUugjkLzepnCV616eHxeqYIIlDGxHQfV1hFazDDsr
         pAP7B5c5MuzSs69vVQPzmfwRrtjjeJKTl3bxx/B2QQJ9ni4rIUk0n+wrync5Dacg37I/
         B7yJB1Dv01VF3GOeKtNp7OZbWZQ4NJPokPpIvZBj4DjOm6WDOp4qYSdsy0x6CW7QIxCg
         N1WdB5TDchFoypLhOP8viHk+ZQmPuU74XG1JwkRwUpPKbOtDozVQrXw0GpuOJsQzICsQ
         LtDHcDP2LPqP2bdphZjcgTqqcHJEJolEjycDS23EMzQRINenewe4jDo0sqPwt6ExGZ5X
         Ay/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7Gi6DoD+syZ9lUWISv5ELpXzdYbog5WuxKiPu3WYpoVJC/oYliwC50zEuR3M5/uNKtSwUw6a8cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgdSVN5YbfwjgYBpKYJW0do53JQmeGyw3z1LN45BtZ+8TnMs8s
	cLCbtoTrfhKh7zt+FDCMCQg07drZXPC1XPUklPbwyHfemOlR5kNd1cm7M7GnKeNqL+Q=
X-Gm-Gg: ASbGncs7Gqcrgf7rRcwU+9625UU/jaAr2Vpr9od0+Nxm3WB5bbENMIFnuXGPshbnh+g
	PMEJNlKU85g7AGc23xOF/cI/zMtJ1PWFy8oSubpQtPZqEKcXirfAIDmBYDVauRS17Nvwuzh5dca
	fPK0aGHftp8QcQCoY67dGM9oY+P9+e4Aplr1fMcioh8SJZ8N1vhsnDy7islnLeRhDg7mLGmIPJR
	IoSp5Uy0LDMJKUDvFJRXifbW+dyogSiKMq5Fboba5jetyrPbVtJYS+Zz/H23cm/81ZJieMIvKQY
	7ZTYZpgjPN/fwiMMDT2pdTrq3EA89rMF9OzhlBmOxXBfK/T/fCnxaSxN8kryOVf1yjhM3uzxnKA
	YZTKdGMvTfByi/ECUYoZXgNzXQykJUrrE0VPJem3YfA==
X-Google-Smtp-Source: AGHT+IEAOZ4barh42QKEXjGCUuoE1CDyPc/l1EZnesaJ69ndQkqwdIOJcioQ8OP3PoKFNIqk9kUDPg==
X-Received: by 2002:a05:6e02:184b:b0:3dc:76c6:436f with SMTP id e9e14a558f8ab-3de07d018b2mr17478295ab.21.1749848516110;
        Fri, 13 Jun 2025 14:01:56 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
Date: Fri, 13 Jun 2025 16:01:44 -0500
Message-ID: <20250613210150.1468845-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
only the regulators will be supported.

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

