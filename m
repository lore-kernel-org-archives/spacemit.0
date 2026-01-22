Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A14219FD
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067038; cv=none; b=pPd+QuNQle4QiMHtNrZsE0ELIh4ANHCdvz5+7o9bLiZrYQ9UVCoElA37dC4UKC1h284qyDDraFEvvgpPLRT/T5qjoIbKtQ31oYMNC3TvJlkLsUCWNQDkb4B8MHH9/bZISQFie1S1aEc0wPNsVqV7DDB/eIp8CXjUbkCtO0dbodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067038; c=relaxed/simple;
	bh=GJcIqdinoJ8Cp9/UqzllyVA7y/YmJi9zscvo1d6K1aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUOMd5u7goHeaT0pAJkU/54f8KdimrPl8v93g7x+VH3jTRbwzTToN0acdLm5KXQM1uw74HoT7auYXO5gT5oM/i5FZz8caOUd0AN2v3U4FzOoFL47dBlpfO+WEwyN9nlnhN/apetNSwTzpmkCs4sMmpwm6I7L1rdlbuqVuPQ3L4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3Rxrajhs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3Rxrajhs"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a7b23dd036so3625295ad.3
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 23:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067028; x=1769671828; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/UtC0xgbxRNfydioTj9MKeI23LF8ZBahNkg1gMzORk=;
        b=3Rxrajhsw0yUpDM+woLYy836juPFXEAuRhKbL2RRTYLGBUhg1pM9omaQQO+BTY5BZR
         TUHzDE1pAfo+FjyTbpKiVgv9/guaJM4VgafKTpCU+fsCMdtu6Z4Py1Wn06kuYFov8cby
         Cztrq6gvMKjRwxg91PI9V0gtXUwvPWAyXRDPg5OpkKAmwnkU9FKUgtXRCx7xOhevUyNI
         tOA3cVb3BRchUahdDDMqpulWxRweByEJe+yZCS0qpI02U/Sp1woW8Hhl2t5XTykUMR0B
         XxXeF9RWy2dkXhN8kD4EFfgbIn4i9kVIO954CTSRVpHcpmSAERseEMaN3TZhZd3u8gjL
         NQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067028; x=1769671828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/UtC0xgbxRNfydioTj9MKeI23LF8ZBahNkg1gMzORk=;
        b=jZLwAn/b0HYKvwOXSORA8Wl3iNRea+IJPff/6tmDN5hakdbilrqQs5VowC45A6KSBm
         p/iIBGFu8bpdUzfZdBnJUtRQVSXR1FerjZUy19suPd7pC5BU189BvpeEmnGOtEPjN4Dy
         sAj9J8Vpmd4s5TM5jU48ynVGYKn5NOmURRInLTRVI6Kj5wWkNjVU2E55/3BfcCuRjvUU
         uUHequhIDDxyLBoBT64PDTM85HzQZWqXc5yh9bOE1RrwuIA/QOdYke9D5I0xdF5lkMCa
         sia6dpczfIsrSCIZJFfmhrERdzB/Wh3LWaQ60fcMdHHOKz9cOCuLt8L7XcHvvdKYpppw
         tZOw==
X-Forwarded-Encrypted: i=1; AJvYcCWXaPiVk+u46gCGGaRZjs5NXoJn5WsuLZtkLqLlk+2rgri2HkNRN3645pEabRKilq3xYtK0VxMOvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJNFaighTYUuKGzHUYmewYyEG5ECVNEcv8YriOdGr6SR8IYtFR
	WeHIzoqMQN6SU43y0owu4qQGJIhoSeZlVwjcX/f3whRhZNivFe9WpuevODI5MqNsEVk=
X-Gm-Gg: AZuq6aLgPn4SH8sIALXiosL66wotynL0X/qRoXEFxpT3/GhY7c9++PRR6HX8t79K+EN
	Xb0J9RMkmz0dxgi9WAMC6Y0HQEgx+NCBiPeDrb82NnWr9IwtNXaHp7JF0UY0N8AY37z3FOpu+G/
	YTKNro815uX8Fmd6GUc3YnK+UxPH0I9qkLzjblIDGvjfdRsNGXA4/lagpWgAXJNGdVnCGTFg/Uw
	WI61oc3TF69jkEIF3B+En+J8QEU3byZKDiT0f2q7tdFHjCYaU1oZbs6119Dl7tDjMDdHg8ZTeBC
	bXameAIRYEXCL5564o3TaMlI5/QijCdHin+5EiKDn2x8GnIqbtX3hMqxbBfpJBJ+ZBtNR58B54b
	lGBbeYA1ODl8cAmud+a3y8j5q1CvhNhBfzqXkfECDCLUOx0N1tJ3PDy+7L9dmyz3W+eVmDxfNm3
	2cQZh1gIAIs+dnnOE95ceBUehxhlwsGRg=
X-Received: by 2002:a17:903:2343:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2a7188a97ffmr177066245ad.15.1769067027753;
        Wed, 21 Jan 2026 23:30:27 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:43 +0800
Subject: [PATCH 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
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
X-Mailer: b4 0.14.2

Add supply properties that match the P1 PMIC's actual hardware topology
where each buck converter has its own VIN pin and LDO groups share
common input pins. Supply names are defined according to the pinout
names in the P1 datasheet.

This allows different boards to describe their actual
power tree connections in devicetree rather than hardcoding supply
relationships in the driver.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6adb72fc48af570dc13fc9edf77ccb..abdc93b9a67b1872c8fe6955abd950622a0b69e8 100644
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
@@ -50,6 +83,15 @@ unevaluatedProperties: false
 
 examples:
   - |
+    / {
+        reg_vcc_5v: regulator-vcc-5v {
+            compatible = "regulator-fixed";
+            regulator-name = "vcc_5v";
+            regulator-min-microvolt = <5000000>;
+            regulator-max-microvolt = <5000000>;
+        };
+    };
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,6 +100,10 @@ examples:
             compatible = "spacemit,p1";
             reg = <0x41>;
             interrupts = <64>;
+            vin1-supply = <&reg_vcc_5v>;
+            vin5-supply = <&reg_vcc_5v>;
+            aldoin-supply = <&reg_vcc_5v>;
+            dldoin1-supply = <&buck5>;
 
             regulators {
                 buck1 {
@@ -68,6 +114,14 @@ examples:
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

