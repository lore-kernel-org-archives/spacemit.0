Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8C23B61E
	for <spacemit@lists.linux.dev>; Fri,  6 Feb 2026 02:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345148; cv=none; b=M3eH78NKL/p7mXWUOS7MVazyrZAKuJdKf00WeJLuggTUCa7z6IwZ+Rq/0HkVRvmEj+UEGrD2bjQBELRISdwGqdhiJhM3KuBKlydJXaS+6OrP1NKoUHmP1mKF0ZP0jbJpE71LKJlvSRkeFCwootR7qhFP7+/y9dz5/aBM650gdDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345148; c=relaxed/simple;
	bh=iMy9rZHDZ1KHqUwkSTaauxKt7AwZPgsiueniWIPJaR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rm9VXRxqick9W0P/vHv8veZUK+zz0a/AG/jd6oBazX/tvKkoESWkuUIjp7JVgVS0yL8UJDNbuIYBsJqt1mshJsRQU+INzRPmi4MRWCFnqQb+ZW6rjXUbvsr8ZLeclS9TuFsUuWEaTmF5yFaBhDZTpIU9eRd2dkeUoR0imVB5bQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=o/afqS1E; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="o/afqS1E"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8243ecfbef4so293987b3a.0
        for <spacemit@lists.linux.dev>; Thu, 05 Feb 2026 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345148; x=1770949948; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGIwbpL1NqbuM+Upk52hsWmEQVIHxvtG9sbbv3Y97oI=;
        b=o/afqS1Er56bwAbVA81QElXMtiS+jXjxGVSJ+H8cMdSjDeFBvZlSj2c7abAFWJiq38
         lmyF2x+UtErRUyooRqc9HS9TzvZxbeAM+WJ7prirjMzUZxIKrMnP/FSkwqfksDjupFLy
         4IL+r8knFcCK8QdTyTMEauD8nRdJUPMOxCK4IIOxlY1p9XvzSFVAURWb1gFpqE5FNpXa
         NbPJGefu/NXaYeU+f1eRwdIYsKr0mjTxsdKihXq9fIZAsdSf6c/VtyucKOV1wXmM1kTp
         iT7BDaofK0YFVYTk4JSVbvmtxhqDaH8h++M11eiVDXH0CuX0UUcXgYBkfsVtUupS1I83
         iECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345148; x=1770949948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGIwbpL1NqbuM+Upk52hsWmEQVIHxvtG9sbbv3Y97oI=;
        b=IAxxHCeyrHfaPL7p4PvAl+TWRH/mmhQ1SiYKJxuv7sG/98fBndxKTAwNZ8yDIcGLUP
         QDynO3XZFjMRut8CHcaOQ+DX6qNKF+OSdKg9tAzrfDVVNoB42txB7t+GxKaB2//656ew
         6PYSrOcPvikW/Thu9SSumtp9qyidAqPQPZ9ibbEGvTHrAdM87/qaZvGZRj36y9o7a2RR
         e3FJODuZLRJreHtVOB/Nv3yvaMOmLhZjGj5y/0qtCa/Mk5R19ze6ASN1cdy2CVj3HhZP
         EKqCt9u84xQ0mqOm1UA0lXZG8vgtpZzW0OTMDdnGox2Kr8yIO4gdNNpGV9aoUZkD+Njx
         yiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZCKmCMSR6OOhGwho0clrHRptNdy8TMwosWmY983ogV0JXl0hYV3jZFlOVRs3g+OwDjc9w6JWL+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkiB+k+XNtNldOnJnLWic9ctBysOAweIdEz2QXDEFXC7bxBByc
	Bw5OYDuAbefPNmXE8Mac6cNP7VSgPnKt9FsbQOjCKd9jEdqTRbHoSgnOYanuiblDwW4=
X-Gm-Gg: AZuq6aLvAyD11/1cV1kgQU/hqkXtd7/rOc7w7erG2ybq6frRy04CwUI0w9rlCOJXkBi
	fjqwB24Kh94AIY3l/dFhTWazRUqGl4mfflhGOtIimKRNX2ge7Bc++XtbhWBbMkCu3R+fHYO0AIj
	IdjgqS7BFT+k6bwYA4mvuaSI060U9bEoQlxWRdWplGOtkrrRBhjMOiK4LxY4bhssEiWIp7AY6Iv
	vgU1ph2VmIX4+EIe9tT8G4ZMPHPaCUTskQlu19GRjC8sahraOs6BTDrdk8kpfFrQ3OxfN2RXafl
	rLadh2rg56PJZm70dfiVE+RezcUt5vZ2tKjikGJr3N0y+ldbvCYFdXy0QQmNwnpk9IAZXPWIK2f
	zFjjHifBSyC77s6/0H8CFfaXdlt87GQknt69AqMidGH+rH4oJbe3iDQwDnud9FWGdnNt8j8snDq
	5+UdFeRKLDfx4YMAdxeYKgballFx5jsJWYxTRzo76/+s8JA5GWWzJ+I2LS5owQjLVD743yUHpDV
	/B6Swfa3f+YawWJilg=
X-Received: by 2002:a05:6a20:4c7:b0:38e:54b8:6085 with SMTP id adf61e73a8af0-393ada2dbf9mr1053712637.30.1770345147770;
        Thu, 05 Feb 2026 18:32:27 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 06 Feb 2026 10:32:02 +0800
Subject: [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
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

The existing "vin-supply" is dropped from the binding document as the
updated spacemit P1 driver no longer parses it. Only the per-rail names
("vin1-supply", "vin2-supply", ...) are supported.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Drop vin-supply and update the commit message.
     Intermittent dtbs_check warnings are expected while the binding and
     DTS changes land through different trees, but will resolve once both
     are merged.
v3: Mark vin-supply as deprecated.
v2: Remove providers from the dts example.
    Pass the 'make dt_binding_check' test.
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6adb72fc48af570dc13fc9edf77ccb..c67b1c6e4e4f9235bd3965be6b68f397734530a5 100644
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

