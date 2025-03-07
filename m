Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CC1219A72
	for <spacemit@lists.linux.dev>; Fri,  7 Mar 2025 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353405; cv=none; b=mAWlncKYFXuGoAgsjofYIgsbNgrx94DzQlMOWsELiwlRNm5/8kt/pI5Xxf8HOf5co3TsFlfJ8IQuji3rnSV6ahhFuOlTTjp5GIqFBVt+k7iYl8OtBztjyqnmiDJZFTmk/r2mLMG+nGJRJS9havlXRGkBW2qHd8pC7abrZBkiIMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353405; c=relaxed/simple;
	bh=Gc270i/DQwjrh9iRRxvjY11dqiqcfQ99KjBuKm1O9Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjTXkGazwfAdK1xnJJYL9NHykdbvTuQboHoZslzSX582/8TPfKIQPU65d6OeT3Q6ruZSFiBuBRQUIr7QuihIx0bgkM3pku55lTkfTTAwu47bIEpfD0Et3zaPdNdfyZ+FiHxLT5x7XLZqPhoakIC7hSDeis5+KG+gjjDBAwlav7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avRfILTF; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avRfILTF"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso2343551a91.1
        for <spacemit@lists.linux.dev>; Fri, 07 Mar 2025 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741353403; x=1741958203; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efgQjhR4aCabfgdF2FkohcAA8CG2VfCPk8HHcJhIIXs=;
        b=avRfILTF61YV/QQbMU5KSsPbFK06dhuqUurmfUX+T6Fs/RVoRklg8FVbU0TEv/END6
         4vnTF7gAVzskybgkK/cY762NrRiQxAqmtBi5/ba9YYlJqY/zOG8Vj+4vALpNOC1ncJhf
         eYcM4IfCdMUdBdq2VWxVfi8pJhpbvvB8jqAKBe4KZkEHEcItOGK/MmrU9muAXP3rhP7t
         zjDJH/B8yqLRJmKKcqJtptK7krQwcpO07eGLFOwK/5im/xIsvZDAflYrhaXaE0WT8UCL
         kmMC+WJU6PWGSKbLu2j6937KMRgIoomhpuGczET661MBvEi8Ynw2U+uzcMdWq1jg+gDE
         QSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353403; x=1741958203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efgQjhR4aCabfgdF2FkohcAA8CG2VfCPk8HHcJhIIXs=;
        b=n52krrjx4VAizKQ1p1FDrSaqXXJMuzMuH1pKWfeHyRlJkPZbGHrPLJmKpQwRyCqqEZ
         UWyPurklfxCx0X2p3iumuKU1z84vJMHNzelWjpLKR17RDNwnCjtaRDzQSkjbUWW3ElCW
         eTXJM37/+CE+5xYYQKhquVVYTkO+1WVI3rBt4eXfnp/W90oMBIM/GHX6+snI+wc7cE3B
         HIKuDRIUxOtQ5RF2Z4QWgOc4+Y57bqUa1AZianDcQDawcd0WAC/WanoSRB2NViMV9/Lh
         RQ80LRmmOk551UachfqQU0uZdH2vuOF+fzjXeqLo3t1vZXPth5avqYnogeTOFo4hi1Li
         tpBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKzRLMIrxf6Col7ALz1Rxw7xUMGRBKDRRNi4KUc2zaXZEpWIV/gdK8cei04MRAq4nbgUiBLfxU4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpFd8iA5RWCk8JVpeFt46rStxmUu39JmvZ1vZkYr+7shNt0s9V
	36XpLmaLUQucCdmM/stDdgoKtH/qEmr4fJ+ANtJznbn02GiyfvrI
X-Gm-Gg: ASbGnctpx91R1IJ4R1puvUxB4dzZpUWadt0UZA3qy+b9/fNICkd8RTGmNdGdn545zCg
	px1Xg0S7tTGNIUjuHFz9SgykEQstuwotcmOhSJHjYxgI8ylRSt/KgRvTTVle+kCqBt+wmsTeDQo
	vVQdgdC8Ds7umdIVRfUViFWj6NS+shWD4h3KuAISyRIk01fbRldxKIAEekxrkYuoO/7PV0wcr01
	MKPUvi40suX1UDwQ7x5rsi+qbr6ogY+4Jy0LD9+810ebMHA1ngoGzOmhcWO+mGnZS/TSOK0Z1xe
	P7sY2JOPOzUPn2i08lniZaUyHydm
X-Google-Smtp-Source: AGHT+IGOn8DDBRvJaqYmjHkVKOo2YGgRckoyLCbOPcvQyE/WHG4r5RQgaVBafk+cqrlqSRAtImzL2Q==
X-Received: by 2002:a17:90b:17c3:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-2ff7ce59681mr4835480a91.3.1741353403442;
        Fri, 07 Mar 2025 05:16:43 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693f7cebsm2984589a91.45.2025.03.07.05.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:16:43 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Fri, 07 Mar 2025 21:13:46 +0800
Subject: [PATCH v6 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-k1-i2c-master-v6-1-34f17d2dae1c@gmail.com>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
In-Reply-To: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741353244; l=2076;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Gc270i/DQwjrh9iRRxvjY11dqiqcfQ99KjBuKm1O9Sc=;
 b=uHKb/n5KV0CgdPyA2JMTLZC0UbC95R96oPXM6/QfwaU6OD4o25nhIjtQFExpRt0uPI+m7mVOi
 JNP0g1UOrxkCMLczzmrt8b1hgMxVQflzUKmt59MiHLLTi8unxpBBpEk
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

