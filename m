Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459C61B532F
	for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132681; cv=none; b=RWOLx45G+0V96eLHxaHusO3g1N/dlXLqJ69Flot8OuRpRLTYonTVUTfScPW2be2MlJIksxJipxhfLEsfw/kDwBFEwZvqsxsNekkzddlqTgMVNxbZfxOiITWnDEBFPjfFkaTbTAmo0HhdIJ/SNRx6TaTMmFjnLjXRJFJmFk+SxTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132681; c=relaxed/simple;
	bh=t4jNLYsfRo4vYlN02mWCuLhLvvlCbpD5ApBbAIbVkFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZu/BFCrrz8ygvmrbY91EGYUZ/JBoGxOzkGyZXP9ewV0A0nRtEinh7GuPOgdBhNc9WrBVznivI+2IftrMaCJUjGVb/N4OpL63+MIS181jER5WFKyjBjyOQsu0VSAKltu0qNPFuIRegjxZZlNqjKhLdW1LzvBsVY/cycvWK4A1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Y1zQINyV; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Y1zQINyV"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3465905a12.2
        for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132679; x=1745737479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEr4zoqSDPSh3q/NPZGQ8bjJudfKjj9SBhXWOyMRmJg=;
        b=Y1zQINyVTjRs8FCtjQqKak3KqO4MEdPtxad1tWuVJy01/NP9OzuxF4+sA1HKmmd4NL
         sjQ6698tPA5ApxqQIo+kGhBXaFXFTILtxbDzeBGTgc7j8RusjNBDCsczCpO2OVnJ2Rw0
         eU1sQwN/RKHNxoXEov/hOzwrRPxs/f7WQa6VYdxFbpxSnqYwdf+CpkRso56F08HMrwc6
         +TdlkjZt22FHU1yvpfpAu3inlkKxQkTqhTxNP8rP8PHlYZDolCt5fR9ePsOU6Ajl737o
         XTI4lal6QsasgKaEU/kEw2gIGpqIJQw3bdUbatRhSUnNsHBZlivyZej3fO55lCKr03np
         Iakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132679; x=1745737479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEr4zoqSDPSh3q/NPZGQ8bjJudfKjj9SBhXWOyMRmJg=;
        b=Httj54lCsv+rrlXqkeHVqG9vbPLn68oYa+Rqqe1BDhAZ/SkIk/1IC/HtHifIF+NyH2
         uZkvkOIMrEAp7kJ/YIxcUVVmwni9CgHScdpZjUc2OLSCTwKDJZt3MGTkBY7hRjW5eTBm
         pBZcuQIth97QfRLVpc3jGnkQIAzBCKsc8qzeiFJ1Jn1is5x0QB02Tm7+WLpwHuxgZxDC
         VlU0dPO+lFwv3DGqQFBcyI+i1P4De6k6mYKpevENq0zyfMkupQx28rXl98BSIcTDaWzo
         PGq22B0db71IDQr3T3WPWt5b1y3UmnLOYW1AXmrs1fb+qGlxI7BO+L9EJ2zbfE5jRcLx
         2O9w==
X-Forwarded-Encrypted: i=1; AJvYcCUKEzNzbZ1XfIuK+ZEAI3UtCBIW65OJTniZ/FgNBwkcj8VdWcK+FrdaDLS/0keR3XJHu2NcqPw1lQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPBo0jjtr/ASZUAiJfONaPmAkfw9xZ+mK+pNDXVTx/Wp2mZnAc
	As6dsKtYlIbI0bsagwgdarUEtGwtZFNUIPCIVh468qYZcA/R+/lwPt6ehYYcR2o=
X-Gm-Gg: ASbGncvKu0LfqDqQ/p2gAeQFYUFsUvJi6iQ9cy5wtGsgieQpFFrHPaJ7vgI9mEt27u1
	iVlCyHDDSKLYfAzgctDCIWemgozsNIRmUzrdkiPascZOFNFsV3YZsuOhW/+UK9645mXQS1ylohy
	V6PBH7hxHPhn8H4M4QXzI7/gSPWeg1DlqQUbgx80CIwLuSQ9/xNnnq48qf+69Mu0+DqwsCGETqx
	qGgjJcIAoACewl5zqeagyYmweksyv8ZN7BLjj3JxlzFWQecN/XJyZ1iOEK9rylu4BdQpciHLcIP
	Gn/S6UkDlA3cuFB9XP1dSKxQdKZWPQ==
X-Google-Smtp-Source: AGHT+IGtYXVmqBAFmbk7LXbpDxQMyWUw0KBDYgsDqkcEnZhWP8dgPJ0odqZrRswxh/DPQhqrHeH9wA==
X-Received: by 2002:a05:6a20:9f46:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-203cbc056f1mr13712467637.1.1745132679468;
        Sun, 20 Apr 2025 00:04:39 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:04:39 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 1/6] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
Date: Sun, 20 Apr 2025 15:02:46 +0800
Message-ID: <20250420070251.378950-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC reuses the Marvell PXA910-compatible PWM controller
with one notable difference: the addition of a resets property. To make
the device tree pass schema validation (make dtbs_check W=3), this patch
updates the binding to accept spacemit,k1-pwm as a compatible string, when
used in conjunction with the fallback marvell,pxa910-pwm.

Support for the optional resets property is also added, as it is required
by the K1 integration but was not present in the original Marvell bindings.

Since the PWM reset line may be deasserted during the early bootloader
stage, making the resets property optional avoids potential
double-deassertion, which could otherwise cause flickering on displays
that use PWM for backlight control.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Accept spacemit,k1-pwm as a compatible string, when used in conjunction
    with the fallback marvell,pxa910-pwm

.../bindings/pwm/marvell,pxa-pwm.yaml           | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..0d97333c7fee 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -14,11 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - marvell,pxa250-pwm
-      - marvell,pxa270-pwm
-      - marvell,pxa168-pwm
-      - marvell,pxa910-pwm
+    oneOf:
+      - enum:
+          - marvell,pxa250-pwm
+          - marvell,pxa270-pwm
+          - marvell,pxa168-pwm
+          - marvell,pxa910-pwm
+      - items:
+          - const: spacemit,k1-pwm
+          - const: marvell,pxa910-pwm
 
   reg:
     # Length should be 0x10
@@ -31,6 +35,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0

