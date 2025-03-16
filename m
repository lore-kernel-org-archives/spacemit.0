Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A31607A4
	for <spacemit@lists.linux.dev>; Sun, 16 Mar 2025 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742111176; cv=none; b=cU6RzPlS6BQHnEHHdRACnKOKJ8fExXx2aksO6YHDQ76kdNUYjM0ZNG4L7W8y1MHKnHG/xpUMTy09lI9llMo2PvGNeXphm6X55SM+muBjSDtYPnqnTNlB1cQj358kAUnuh68oYhfgP4+oDmGhS7Tc7A98O54kh5fpsGAEEMUFbvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742111176; c=relaxed/simple;
	bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwfOSt34DH1id19d/g0BwBrze6qYuMSwS16/7MetnckM/GFwdOhCMMO4rlKQpUF+AUutJMIuPTTkG3QGSVNS9UouDfqQfxG5lkoEYjHWAyflTGUTWlQOD+MjBgGQ2/pnrFv83LImWSyDjEXN8Cvd2G8qGi9MzYHCZt4dm2Rg3Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVPBaoVQ; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVPBaoVQ"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-223594b3c6dso66730865ad.2
        for <spacemit@lists.linux.dev>; Sun, 16 Mar 2025 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742111174; x=1742715974; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=hVPBaoVQoaEE0NX23XFVu2DVDp7zPfLAB4YcZAPcPj6v/vhR0azWkiifxbDBTozS9e
         uMkWvdNxkq6h912BpzHX8gQLdUHqutj2AX34gMvlEKD697xJTkoEuqtTCgLhs0mAuvYt
         DCZ+yzmvtQxbAfwFgdO+aDkX1Takpx+t+qhaQntvg9YsyKguKQB6F9mOZNxxekAYJOdy
         ceMqeZwt3vzL7wKzmySEyyr+y9gllNPssYzM07mR99sdyne1blrwzuCO8SuJq4B26tg3
         PP+2ZFilQaU+cuRb3Otw5S0Kx7qKsFemZXr4LNNACdxMXLvbn01dTW1Dc4Oiq0Xb9Tt3
         a8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742111174; x=1742715974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=WzcpAnARCLCL2ZUaCR2r8AcYXder+MzsdTr+xP6kjR+VrXqBt/6b6FzDA2DXhpJIZB
         3s9rMONquAuBRIMV9TrhSswsD8vyMZ6S5SPh5rxi2LDzjA93ubIQaR68jTD9bElZkMWs
         WMbsDB4/TVNLt4F8EiD/rI+foFP2IMT8fSqnjjNktO87etSpYIGQlQB6XRoX6jOEXCzs
         eINrkfPKDOURgfXWs/0evSjSqqYDUGqh1JWZIy4BuxEbtD4z30LPkv4QHLPkFVLmOYLa
         LZcnXH1yeNnoTYlun7lqWOlpMCcwr3Rq3+ROQymwE7zk/rvIOYhACH8zCt7qJf4pdVTB
         wyWA==
X-Forwarded-Encrypted: i=1; AJvYcCXc2S+cs5ZynxMPdI2Xm/TBsXT6+tbttvAdwVD90RymcKO/kA6ecQOCX/5VUOUfCzeRYCqIXkBTjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv3Ht8nQl7DkOHpOxPm1kMhVQL6DFiTH1qFKxdd/XQHrda90eP
	vSwzuaM4DaIcvFYBQg3hc8/v9TRZihOFqRcjBiAO95AceTFhTf9C
X-Gm-Gg: ASbGncvJmmV5IhVeOjoGu+na9pFp1sCanEeBNE6dgn1SWgKvsv7+AtcpCfsy4SN82z3
	elbkk/69KjLgi5mwGGnTS30lbP+p7gEsUJkEVAwOBEwQV/PBnF6qdMIYSNiKLtMPbCTIMjCXVGx
	Y0TrCeR/inHLOpfP6wyhakI6iUxPVeEGFsZvoxSOC009//gaYswszExTZTLM9LomSGgdmULJ8IM
	9T5mFinXRH8bpW445HZXLlPegXiDWfFGLi+lfNDQGyOcLj/IBWpCuLyZlYusgzLo0iUco/TOBRR
	2c7KQkAdNqGgw8RIbnDNCQCS/JQqlt0WMW9yiOY=
X-Google-Smtp-Source: AGHT+IHnoTX4HvYj6GA+XsaeR/Z5lsvK9bYDQeHmDp9+70ZV3nun+eVO850kkAELvfo3/3lwtE3oqA==
X-Received: by 2002:a05:6a00:4b05:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-737223ed33bmr8204799b3a.16.1742111173585;
        Sun, 16 Mar 2025 00:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e56sm5575907b3a.130.2025.03.16.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 00:46:13 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 16 Mar 2025 15:43:21 +0800
Subject: [PATCH v7 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-k1-i2c-master-v7-1-f2d5c43e2f40@gmail.com>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
In-Reply-To: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742111004; l=2169;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
 b=QN7vDkWymm9DXNpwH7BLID5XKsUCIqAc8T69dLCpf51XfHi9rFbn0wEu2xY3I4LyEJhNDsdQz
 kaS++L6eUuDBi3HmNLXanwqZeQUZHTc52mLBYrp++RilH5LSBEKkPkO
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

