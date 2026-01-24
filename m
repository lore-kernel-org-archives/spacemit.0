Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814221D3F6
	for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 04:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769228987; cv=none; b=OFJ1p7ey9v/4BiYAgrYOq55QCo3wgAb3kLq5myz6vLMwYlbL35I/9hN525iNyCbUUs+fRP1JJbh2vaxhXAAbagvNzt4daGiNPjDOaaJc3xNychTHhl/0yNNvkRNg+0fjK3LvztDufBTtia2A4syOfc9b8XhbkfDzlrGHkkSunGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769228987; c=relaxed/simple;
	bh=PxCbbfZ5lHQpEo34pLqxhp0zyI/8m4vA8l4kj4Ftvrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL1W2ZI8swulH6//NozHEH6En9WUIvdqCRArMQGKkVXZcWgshQSlGgaC0Hr1W6R6Nui9sWFrJ2YUhjlJEbCwib+7Z2ObQw08lv/5o7xpVeQGHnwQocPUwTT7EPK1Ktzaj02TgqEZ94LwlLaJ/QASlA2kQDhKP0Rh1TkcspU49/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cGj9L+V/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cGj9L+V/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8230c2d3128so1114904b3a.0
        for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 20:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228984; x=1769833784; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTPYDNMkVOo0iJht/gmiXkCD/RZGstsRjMC0icZDXcM=;
        b=cGj9L+V/kYHsc17as3ZQGWwPwD/b4U5GIahKoc6EGXmqtEEXt5iaNIm4ejg+PXm3dP
         tnzHNnOcgeCpyChvzBtahXMtPJ0SHYlg46sXpCYu3iRlP6u8+X43ev0qyEJ1l6iuwWVb
         /Mjo+LG2VvzrCDz7iDIHhhIFKhSw30A+/MnF6uUF9kpLrtgSJTwOYw1NTJQH36m02EaX
         nlzlkdScbwF04vH7JH8NIyC1sfrpm2W9YLMgXmyUvYhoD/WFHgEHmA9JV2AblWz67R3n
         wrL5UxjRADqeMCu9xCFrUa5/Igx5rGD1otgD07a+MbeoyqUXX1x3l8c3qkcmzDd5GolD
         +SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228984; x=1769833784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dTPYDNMkVOo0iJht/gmiXkCD/RZGstsRjMC0icZDXcM=;
        b=DRf9p7DvrFZa6V0Kb1Ttvd1HGdsdXlE8T+LldNm9X4BSve+1PMHIcanY9vqiKfmKZ4
         EuKj9enhfmhVKX+P7dVzbfMU4BH0M0gvlkzqOv4z2lYuoiP0xDvuZs8JVsWmFLXStZBk
         ltJlExbFQs4ucVWDMAEyJ6bTP//4OdoyNCtfgEXmEzlsf4o8s4HxmuCHZtchZPF22UDe
         fANw7ReQGkBuBwT9xDnL9/daYn8uMMCOxciFtaqR5iDQhGLUG7nX9RXDx7H8qoRcfmPb
         MzIvvReK1SideRfm6s+yhvLsGQMtAXDFOW3IItuKeBvL0oOSsHLl5UWFwOvUSkurs5bw
         S2ow==
X-Forwarded-Encrypted: i=1; AJvYcCXiXhqM6PHbSvoO/4shYNbn7jPi5uy0DN4JEZe6Nsc7xdEHLK03MuDL5HlhCOAOg7ZAusUlb6vKkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ687mpNFHKOXAqQ/qF/z3wrjNKktOV8wchNXJ2oZw31rpJC4m
	iuT/qx8BGvnsU5zsVpTvMBD3DbVg8Dgrugbsut6WnygkrSHl46l+CtPkFHv17liCspM=
X-Gm-Gg: AZuq6aK6/xyXhc6qSaYlgcCdZfGWcsBZ+NTcqXyuqky3siC3O4XZlsq2o70Ytc2AGKg
	SeKjXW7Zhr5SGKeiXmgKm6hPuExGy/GBpPnbGbDokQH2YRYXT86s+nLKp80HELan+dZKTtzkSWA
	s1x0FrxePrBfC4p/PjuJ5x+NEgYBu7c87CZDClhxvk90fL0YAJPK0mub4Zkk8RwT6E6kxrMI1rx
	kgJb3xRlShPS2DQohLmwacc/QrhqrWXo9F7dKlgTtJJu3HSuImF4dwuZ9B0kyuKNEJu+qz8nlmU
	L01NfYUmBqiPNTl+/h9e69c5RjzFoGywHpiqYM9vxEbsaYmRYJWNn/qrKyZNnF2y/HOCmMNsh2Z
	dvhbvz5Y+Ki2M9lq76iCEzVv/hwJATrqwNU/SPPY3WyDE6UG9FlZOuJU4D7lnhUT/glEjIqNTPO
	7LI621slxuxyzhbX8ix7/N1BP1i/BmGnw=
X-Received: by 2002:a05:6a00:244c:b0:7f6:4922:89cc with SMTP id d2e1a72fcca58-82317ee9cf5mr4325829b3a.57.1769228984246;
        Fri, 23 Jan 2026 20:29:44 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:43 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 24 Jan 2026 08:20:17 +0800
Subject: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Add supply properties that match the P1 PMIC's actual hardware topology
where each buck converter has its own VIN pin and LDO groups share
common input pins. Supply names are defined according to the pinout
names in the P1 datasheet.

This allows different boards to describe their actual power tree
connections in devicetree rather than hardcoding supply relationships
in the driver.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Remove providers from the dts example.
    Pass the 'make dt_binding_check' test.
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6a..c67b1c6e4e4f 100644
--- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -27,8 +27,41 @@ properties:
   interrupts:
     maxItems: 1
 
-  vin-supply:
-    description: Input supply phandle.
+  vin1-supply:
+    description:
+      Power supply for BUCK1. Required if BUCK1 is defined.
+
+  vin2-supply:
+    description:
+      Power supply for BUCK2. Required if BUCK2 is defined.
+
+  vin3-supply:
+    description:
+      Power supply for BUCK3. Required if BUCK3 is defined.
+
+  vin4-supply:
+    description:
+      Power supply for BUCK4. Required if BUCK4 is defined.
+
+  vin5-supply:
+    description:
+      Power supply for BUCK5. Required if BUCK5 is defined.
+
+  vin6-supply:
+    description:
+      Power supply for BUCK6. Required if BUCK6 is defined.
+
+  aldoin-supply:
+    description:
+      Power supply for ALDO1-4. Required if any are defined.
+
+  dldoin1-supply:
+    description:
+      Power supply for DLDO1-4. Required if any are defined.
+
+  dldoin2-supply:
+    description:
+      Power supply for DLDO5-7. Required if any are defined.
 
   regulators:
     type: object
@@ -58,6 +91,10 @@ examples:
             compatible = "spacemit,p1";
             reg = <0x41>;
             interrupts = <64>;
+            vin1-supply = <&reg_vcc_5v>;
+            vin5-supply = <&reg_vcc_5v>;
+            aldoin-supply = <&reg_vcc_5v>;
+            dldoin1-supply = <&buck5>;
 
             regulators {
                 buck1 {
@@ -68,6 +105,14 @@ examples:
                     regulator-always-on;
                 };
 
+                buck5: buck5 {
+                    regulator-name = "buck5";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
                 aldo1 {
                     regulator-name = "aldo1";
                     regulator-min-microvolt = <500000>;

-- 
2.43.0

