Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF6259489
	for <spacemit@lists.linux.dev>; Wed, 19 Mar 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376729; cv=none; b=mRZbGfWv3m4d5TIHI2W8fiWAwB44svkBNvUm5UQOWOxgYEK08l/NBNbZJLmu20FL8oJQA5ToemOBSz3REFdFB9wbxptTe6DkihoF6J3kh84QDfiUwyDDwdT1VR2ykSfP6Pr9ILYq8MTjBWXV7XiNEve5Gu7yuhrkiInluMCRoDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376729; c=relaxed/simple;
	bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izFwHov3VrD3gRMLjTy1+uYp7F0+HPYQIrjskUmXAVc4bvsMx7kLZhmzcWymZlmr+/McVVjqcHvewfigR83+c+u5RoltV1UkpCl1qR8nIGzCfKy06W4F5VHixjkqA564QCDnnIqe7RXvHgv3B/KJBpJIvzvYDbCA7OPgdKKGXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIdYwYPl; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIdYwYPl"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22435603572so107777275ad.1
        for <spacemit@lists.linux.dev>; Wed, 19 Mar 2025 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742376726; x=1742981526; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=EIdYwYPlrE8FfmIlZK+VaT+CNxG68GwTiybnM/YSGpk0L3GZxJ9MXYbgy50mokJ36A
         i7BD74t/hZK9SVxqdhc/QhBE8qi6HQVfZnyIA7+IVtZ7OJvRKPOO4/BGd9VreaT04FWk
         IjyItKd5YH9qRd2OOWgLfDKeqsQkFRyI6i0TjszrYawdYugFWLGaLfBsoZbEii7AY5nt
         fpPw8wQwLor5emo7VaI04OsJBVi5Kkn/gO4JV9fOzMvqlz2wWmh9lHe0GGSug1/gJLyg
         c+aVkLrDuKWyNWjpbwd4W1hRCMswtynHD2cn53zXRXxzrtai1wIpi0ehMA8xBlIdFXJx
         KWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742376726; x=1742981526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=BtPuL9sA75OID/r10ZZOMFFOCWReUqo4sf1nPt24NMqzgrs9RXaC1UuabNolNWENpi
         zCLfFlr4Wslt+G7YwHPxPqYK3CWFG4DLfqKBuuMVs+sS0VXj89trAWJjTo6gQkYqTlnH
         qXyzEEZHSJSFQu/7e9g3YUY7LbQz9QB2H7EIqbArQTcZPJfK5gCttBrmE1QxMSjebi8A
         SeBULYPe3Tu57vV/n2B4TJh9/G6xEW5eUjskDSIHzcs7E029lLcYE5f/PilzzNCM25fh
         z926F4XP/7Azu92VHwTJ5pKwXaqJUNTabinvqn026X6ra72HBw2Z6HaHvyMGxYtajkM0
         Zzdg==
X-Forwarded-Encrypted: i=1; AJvYcCWZy73pc1oYDF6vTOy6wPiCkUaZEDlo3h5rb6ccApRBujIw3rfbZXB0yZakrJwZMwzcy/5DWeZ6Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBqO5T+7uLarzvf/NOzJrvMsezBW+Zl2u01pqhYq8cFZIzMR9L
	v8ffc7mD2+gTw3cAwIUyuToVy4RPLZnwlmw03e+wdfBgJ8il1Um5
X-Gm-Gg: ASbGncta+xVN2VsvwA2brapntmNUcMnp28goG2b295BhB7t5N6HIpnlXCA4OfF3sgYq
	tYdkxk4wDNi5U7XSJlXa2P2wPdMk70NK9mSiCxBAGka234B9eMBPbiY73U5WO1iH1HXXsS9C1g0
	rcQu9B0ooTzWLndOGtRHFR5YGGcxYIGhpUYEuY6R4sqLCY66aZ2le6V8c/lZ5zoNGuGwTcA7XU1
	drI4adUUAp7clriGEJZDUb7IFKu/GBHXszVLCHsi1aePlkE+96URy365MsmjReHL0qq372ZuWdA
	qrsgJyfv5M02QjwOCgA1nWue1wOy
X-Google-Smtp-Source: AGHT+IEJ7BbacbEjBca1zxi+l+r4IWpLrgxPdjplfun8EpRskeUbZl5L1DXxfpSILrv8YPi3IzkmNQ==
X-Received: by 2002:a05:6a00:1950:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-7376d602e89mr4285875b3a.8.1742376726411;
        Wed, 19 Mar 2025 02:32:06 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115294b3sm11124315b3a.5.2025.03.19.02.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:32:05 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Wed, 19 Mar 2025 17:28:59 +0800
Subject: [PATCH v8 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-k1-i2c-master-v8-1-013e2df2b78d@gmail.com>
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
In-Reply-To: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742376553; l=2169;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
 b=ZFqrmrmY/RWmGj7gLZCWgUTyAZDH/C6mwYsfTc7zti10F5HuSECxeuGJzGC70nnaguSUYNzC1
 XRwzIOgU+UbBQzELodEkO37GCtbQMP9WNVPJcdR59lFVF2Ap5222r23
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,61 @@
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
+    items:
+      - description: I2C Functional Clock
+      - description: APB Bus Clock
+
+  clock-names:
+    items:
+      - const: func
+      - const: bus
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
+        clocks =<&ccu 32>, <&ccu 84>;
+        clock-names = "func", "bus";
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1

