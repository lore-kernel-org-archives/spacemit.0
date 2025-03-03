Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CB1C860E
	for <spacemit@lists.linux.dev>; Mon,  3 Mar 2025 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740980028; cv=none; b=dHzJ+ilTXYxKB9dOM5rSljAT9Wp23uSJjht/7EcyhqmQXplZbOOkIoBf5b+EAl3tQIuOuT4m7JT8rTXIZJo3Tz613C+0CZ60nmz/0cNBo3bHmaBDjrokQvqigF3Sbb5ljNhA5pLOJS+/Kv7BT29SXJcw1Hbj00SyUH13yx2IVJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740980028; c=relaxed/simple;
	bh=WyvZQZnkegQJcav1opY1yTg+77W2I4l0eYIU9UQKJUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfKgkwXVHIoe5SHCsHvGRiAPyyWyGL1kBijIunJrNY1MYC2zPAxeOlkM3fPsG/+kilLaiBGxBE52k43hiFr+e3mXSsyL/De2NiosS7oWOCKqCmqA0P0IvXkD2Je0gIik9mr5X7K1fwZ8oyEvJB6nn3zerGlirfQVCNjjFVGbx60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMuA32o7; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMuA32o7"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22355618fd9so65219585ad.3
        for <spacemit@lists.linux.dev>; Sun, 02 Mar 2025 21:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740980025; x=1741584825; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+eXT9z/Rb3KNpQtDwfjs09oHkg6BFqRPNyVa/Q2Gt0=;
        b=XMuA32o7MaWoMuQfOyA4As2xTYarbL+ECVoA/Vd5xGwX8fI3SHJLZS69Y9XugzUu9y
         W4T2VPDCZIRxgDDdLsaNe9B+xLahx7lJvRAoTc1NmWL1SNo+C2Df9Vu3fqlkuhLREufT
         vBuhp4nRbDaJXhp85joPIXWDEFmh07pbKPEU7hkhaA2eUMv8etq09Aa5Z9WDeq5pPcYt
         K42iygqCMaV/AxntQ7hpxezK7xWLaq568KH0WBZzaddD0WZY7kMlSGikOv4XgkvuipBy
         esK9FFCiILNAtZSzFZCokIou0WnPHkJ1lIAR7qDtge0M+j+Hs+JvTvLh/l9WO2Mr132H
         ZFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980025; x=1741584825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+eXT9z/Rb3KNpQtDwfjs09oHkg6BFqRPNyVa/Q2Gt0=;
        b=PXKKPdiYCHDLxJS4X1P7yAJBt0q4BmkOWnHT21O4hIu0VegIywm2FmLmPZzo8bPjSS
         wV+219RS3+o1CoJfgEzvYxMRZ7zCkUcJ1MNxy9zIKz9VAaUS/qtkwuWgjoFwFbKRLpYi
         M6rPH8yEN0hTQbtnYbRfZZ0aQBaov1MUKmoYKKXQMR8EeDAZvUu5bk4o+u6Mhn5wgQK/
         ba7XLfxYxLluy0kTZX0I2jCrKI/l3Aro+shUHTCQ42oPXVguRGAGA+qpJ8Vgnn4gKDyW
         vX677zg7WGohPGBgTmmRA5pn/FniT09150tlVwQHs0trDHF/AwQ1oTNlssOi9xU6ioiI
         NFXg==
X-Forwarded-Encrypted: i=1; AJvYcCUhAiQCCjR3SbNVZ09uuevEpiaPhHNSnH4ocnQOkU/D8r855V+N0Wp76ZR0G9u1Grg2cGjQph0fbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKw5gAPnOgYLA6n62FBpuwAyQkb9OvAoB5mn662DZ9fgyLSMWa
	hoJG16vRdBwN3l7zbno/rZj0jmh5uu+ybA+6oGpNq/+3nDcxEn2i1RCJgWdtamn3E2hJ
X-Gm-Gg: ASbGncu27iW1PFhoE++HfIuZl9Hy1bHb91Tq/ssz03oi+g4y4GCRMpHP0D1+txfGu9O
	6d4WTbJhaZA8+9JqWYiBMX/5pm/uQcYbv/6s/I113c1T23/y2GMYQFssYuAkKRTGpBq7FdH18jm
	RK9D4u4v8iC1rQjjfmdrHYNotNAASG6MT+hczAxXGOIJV7f9FHc2owEbUFj8+DSXSsMc5fJTRA5
	IjZ34gr4rhin64dYzjEJivJ04DQvTpOvbT5ZuMZlaRzSFrVwsTmCBq0dnp5sqih0ce+7PgvGv5W
	KiWnTkWB6a2T5/lXbBbLB9XSWavQirg2e+BCF1d+AjQ4GXvuz5A4
X-Google-Smtp-Source: AGHT+IEyaUjmgSlTtj+8k2F773pN9r5qnqS5vCYIihiuZJW6fbf014mZKdFIuFfygmkGDpk/z8yWag==
X-Received: by 2002:a05:6a00:2191:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-7365504e9fdmr3983858b3a.19.1740980025412;
        Sun, 02 Mar 2025 21:33:45 -0800 (PST)
Received: from [127.0.1.1] ([240e:341:e66:ce00:d50e:ead5:2cdd:617b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm1856002b3a.83.2025.03.02.21.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 21:33:45 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 03 Mar 2025 13:30:55 +0800
Subject: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
In-Reply-To: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740979868; l=2000;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=WyvZQZnkegQJcav1opY1yTg+77W2I4l0eYIU9UQKJUM=;
 b=0ubbWNBWTlWWqmCoMVoGa4yBgAQyxEgJ+1WF2YIEEYL79YMfXOo4pMDgR72wGcovLwLiSJ1u2
 Qu2PRZqdELIDEThOa50RkOtck3dt3NFvAOJrN60sWZKm694J8pP/IDm
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in SpacemiT's K1 SoC
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+
+  clock-frequency:
+    description: |
+      K1 support three different modes which running different frequencies
+      standard speed mode: up to 100000 (100Hz)
+      fast speed mode    : up to 400000 (400Hz)
+      high speed mode    : up to 3300000 (3.3Mhz)
+    default: 400000
+    maximum: 3300000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0xd4010800 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks = <&ccu 176>, <&ccu 90>;
+        clock-names = "apb", "twsi";
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1

