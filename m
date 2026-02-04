Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5327B4FA
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211397; cv=none; b=Koze+ZYDbAtwWGHLERPmVDSu1un56HCOHLXDFEvEHo7HjSZO3m2cv7eHN/TX8N8d/fV1KdMwxfA3Y05Vf7GIqot0lqksEfvvAT/D74zr99PR3m44gU5XU8kf/sRyO/byJaIS/n4O58eEgazTaWJDH521lzQiqqzLZ7iBxaKn0yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211397; c=relaxed/simple;
	bh=4zb7DJEBy1RtessL+tA6ArL1y8kBIwpVEsbmJH+s0rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWkKQYVUTnGTRWZNJJ/Fy5mC9qvBJNUfyywHYhtCldXguDw9u00x0EvZRODenPeAQ7eXW61AlX5Z2ROTCv9Dr3+85n5pGw2NQRWZKn+1fVmVBS+FWSVj2Zqu1T4O4o70JpMZ52fKibhf2zoIOEh+w6VqRG5LwJn7Yi+s5gemgMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=glaHr9y2; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="glaHr9y2"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1233bc1117fso552414c88.0
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 05:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211397; x=1770816197; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=od7qXbwDJz6jtm4G2t06KDZlfQtmuOYuFdFOxoNtva0=;
        b=glaHr9y2VdEkgaALkF5xLEutYYt+PzBnElpbLHpbQgwhbjaRetbWNuk4wdyhiYRFqB
         GvWnbLkq+qrLhSofGCXzggMyzLCFU1Y6aWl3YuE3H8LovX3VptaUPnRjUcZnGOkO9M16
         ihCfzt9BB9LKKG699rXJi/dgwxizgZNILnkhK13hfcuVQFLCyh46iDAf8G5bUJOmOhnB
         jOL52BApIUVPImMMzHqdEGUB3KaCONN5wF2k6+ph6dqz2G+UJqIJTnWNqj+OZrsr6WQJ
         /XsZzx6jVMBPC5owzF2hOAwR+Dy8qbPQEpLafeRGsyt5LNJrOyyLqSrCUaKJzGiq8+W6
         GVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211397; x=1770816197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=od7qXbwDJz6jtm4G2t06KDZlfQtmuOYuFdFOxoNtva0=;
        b=M5cZ7A7W9lCiOsmVuK1QJIyxki1PTS0CoxkvPP2YjIVv7UcOlJ7P91AiULab1i+9UT
         dweoqOm7dBiiKN/7NuHnXeFG2/vRHu1m0GRJT49cbW7MCg2C3PRn7KJgJPHxEukNce+F
         9e8CfWtDk/8y8MalENqoTcG65r8YyFXc63CER8NtLAlUMPVTQGUYY9UGziUQ7kR+CfME
         8fhZUhOXT06xbmt3InKb7N9KHUqJvr1HZN7Xd9N1JEFbeH30Mgh4iHQ9qRvkTcRLwy3+
         1pjyC+nZdkH6fiKStKEbIw03QVr1CExQjm3X1S6Ikq0VaQyQgvEKoXn7M+TMCydwrXrr
         Garw==
X-Forwarded-Encrypted: i=1; AJvYcCXZyVPRbV1GP6+tDHTAX/hxmEGl3v1inr6F0X4KcT6pPYuupRQtp0Gn1yJEkbd/0e2ncky2LBcC/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8cCmsa9OKDOLggQ8TTvXfs/lpyKnijzT2peRmjxfUQdoBM5Fu
	wciwBVf4nqP4yFlANw6FaJQbrBzp31f/iEjkQqgo/R6jVqnkxOOdm4Af4PaRXWUBQOc=
X-Gm-Gg: AZuq6aJz5loDBaR/gxC1Opq+KzAV7wN7YaTQeumPZaCAQIjjqbNMBJrNkoJIVuFtfl5
	Scd74fWrd98myGwJEw73wDkLhTpMVSeYD8qowNCpoRmJXo5ZT0gbismhmjIe0l+kjPHmBSgJmmU
	AX8cZw1b9tSjIU3UjeuwNMrbmpXk1taWaYUTl4A659OQLRHHWSatVAgNofNrEJg+DU0+zvyhr4H
	Fd3EcDCKMRVuLKwDVMeW0R+XYSOrHnFC17woAhPgwCUiKH8WcRh7Yah9O1C/iN2HiRIdORAAbGa
	fhXgSXBEWr90uxgmb2N0JjcjPeaA9Kz3XKgVQg8hGqRdNAeUlGyk5itJZ00DaD2WxB8Eh02RbRo
	MWQ+Hq9e05f0Dc4HGKG3ZLwVXWUvC0Ir5gRdlZw+dbdRb0jGb6JyiIrFszTFxvOMalbTCiD/AXh
	L6qjiP2SB9tPUAYZ55j/ZMxC2YBOZz2fU=
X-Received: by 2002:a05:7301:1988:b0:2a6:a306:efdb with SMTP id 5a478bee46e88-2b832d7c5c4mr1189345eec.3.1770211396750;
        Wed, 04 Feb 2026 05:23:16 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 04 Feb 2026 21:23:01 +0800
Subject: [PATCH v3 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
In-Reply-To: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
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

The existing "vin-supply" is marked as deprecated to avoid warnings
as dts and dt-bindings go via different trees.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Mark vin-supply as deprecated.
v2: Remove providers from the dts example.
    Pass the 'make dt_binding_check' test.
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6a..41f784408e29 100644
--- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -28,7 +28,46 @@ properties:
     maxItems: 1
 
   vin-supply:
-    description: Input supply phandle.
+    deprecated: true
+    description:
+      Main power input (deprecated). Use individual vin1-6, aldoin,
+      dldoin1, and dldoin2 supply properties instead.
+
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
@@ -58,6 +97,10 @@ examples:
             compatible = "spacemit,p1";
             reg = <0x41>;
             interrupts = <64>;
+            vin1-supply = <&reg_vcc_5v>;
+            vin5-supply = <&reg_vcc_5v>;
+            aldoin-supply = <&reg_vcc_5v>;
+            dldoin1-supply = <&buck5>;
 
             regulators {
                 buck1 {
@@ -68,6 +111,14 @@ examples:
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

