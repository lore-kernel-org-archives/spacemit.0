Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D5928C5DC
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916685; cv=none; b=E5KB56Gbyoe4i5/fMfbRZDVBouGUmdCLwHWMJ09vfwUvTpi3YN35dCKACrndmYmMYigF4QKucAmQQ1o48E4dHyc4DcTS/hbqYL8LtDs0qdhDSQpHSta0c7Q7ohsXrWNqjCCbADAJ5gajflMdlXhMZY1sb9rTzFjRl+aYgPxnpvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916685; c=relaxed/simple;
	bh=nxp0t+VHyDDz8Zh9ljfkEOJVql6306/CDvJb8L/acNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tej+gQiG0E2j01XtGldeHapqu7LLdcbcZmUJ5krnFV5++/zIlyEti6rmYvrcnBKG058eAzDL7mackJt5UCncIsm9wlNy+R6WQRgxx9/X3Sb3ruhKN2/WXubN6AC+9LWsIeJyZSE1APO1tmNleSsT3SniQwT5QkcO0Zk4hHW3QMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=O1GIKX7A; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="O1GIKX7A"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736b0c68092so4998781b3a.0
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 01:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916682; x=1746521482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHJACfgxHpPYnkt6IQy+Z0WabgJ033p5WN25OiCcmgQ=;
        b=O1GIKX7AEzzu6a1eSxRWjHBW0YQFhOlq8THNnqLJ9PqKsoAAjJLWrNnExLrJ10NLIe
         WkOcfIAgJ+mPONcFeqIpPFVnm8u0BG9u6uo8WNx2M83CYcCOz4fsfej8vWUpONlNNGAN
         wZMkSozNGOEJfd4Ekcyt06JtnQ5POxxnt4Tm9dX5Gq3bZs/xMOt81jyPwQYQaZMD3oF/
         xafvqsRo4q/Uka1afoCNwb2m9nrodRqojZvkOFNE+Je8qolO8W8Y6/3OJG1xSpFHnqk1
         axlEwVc0rtHAVB9cRfWsNvSQV1eQ2CPD7rwRTsEyzWRC5dEe1bfFPjBrfy6JWLWg35LF
         a2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916682; x=1746521482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHJACfgxHpPYnkt6IQy+Z0WabgJ033p5WN25OiCcmgQ=;
        b=jtXa8jVYmB6y29dRpiXt9L2ihOk6MMgKvVhlfg9Sz+hxyHo3ZinRIOGeQA+5HVoUSg
         lK0C3To8KaW1lIPEPBwb2POMJzWomPq8RrkZa25iTyXm9Tam5xgRYq+fslpDumRlr3cP
         iEc8HF5URLkemz0tAzwZG0b4tjMRNRv5uZl34OYrEg+FQaHyBZLxrv0pcMXHZH4vRZo0
         4pCADtPCutlZIKaeq4G3b6t0+GdU1SNz27itZUL2OZn3oS5JYnrByU0u/VbipAAZfQtB
         9YNXtIezTY/1wP+fPbA1lTszSzxEHr3WQqUQxSu01+EQG85aUkd3NJpq94OUTzHu1TUr
         DJOg==
X-Forwarded-Encrypted: i=1; AJvYcCVqQRcakXck/nJ9yvqZMo3LDE4Aus13onZqSlL5GQHrQ/M7tTcwO87EDlTOaEbYVkfMF8FJtViL2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw0JCqUFViGT1yKToCm810bwfci0qDMQ+Fu9Zwu4X0kKrCcK4i
	QPB8hgLBafG+Xq8jFpcgJfoIwS2JFkTgxND0CInjdwwC1Zw64+1PkGGjUM3DNSU=
X-Gm-Gg: ASbGnctM8/vB+iww1D4Ey1N4YDuDc/IudSEbTErif6D+HZa9eJVRWhA2DQlpW3Xt7H2
	RQVZViOFkVFumkb0HX5veFH8NHm8UICCFNO4AiSGBf6DyPvBrWJJaKmIPZYHNXKukBGLvu+fY4X
	wGESYBI5uIKYW/UsmoUP5hQWgDpNv2Bw+B0ijn4sqo3Qq4f7leEwUlS7aCXTztHUTki7CsSEQWF
	mmOZLlyfDUb2RECdn91ahhKohN6/qIK8CV2qkReubRBiepPZVUt1Rjfabhr0u9rv/dUlPeAgN3i
	Ka/J2ulIRzTUyhyteqTOzQwpydnKQOnEYXLMQ7bG6KrenYHEfJfrrzx+u5/aXGFxUbVoZqidGBm
	TR2QdxfDtSBF6gcY=
X-Google-Smtp-Source: AGHT+IFZEuQ6sdfjCY7tfFhs7M5WchmJ8YCpC4/JeiDTSPbAo3pUkubrMOUkP8IaSDenvQAkORYC5A==
X-Received: by 2002:a05:6a20:12cc:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-20955d042b0mr2744549637.3.1745916682223;
        Tue, 29 Apr 2025 01:51:22 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:21 -0700 (PDT)
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
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 1/6] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
Date: Tue, 29 Apr 2025 16:50:43 +0800
Message-ID: <20250429085048.1310409-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
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

Additionally, this patch adjusts the required value of the #pwm-cells
property for the new compatible string:
- For "spacemit,k1-pwm", #pwm-cells must be set to 3.
- For existing Marvell compatibles, #pwm-cells remains 1.

Background of #pwm-cells change is by an ongoing community discussion
about increasing the #pwm-cells value from 1 to 3 for all Marvell PXA PWM
devices. These devices are currently the only ones whose bindings do not
pass the line index as the first argument. See [1] for further details.

[1] https://lore.kernel.org/all/cover.1738842938.git.u.kleine-koenig@baylibre.com/

Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: When compatible string contains "spacemit,k1-pwm", #pwm-cells must be 3
    Added Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2
v2: Accept spacemit,k1-pwm as a compatible string, when used in conjunction
    with the fallback marvell,pxa910-pwm

 .../bindings/pwm/marvell,pxa-pwm.yaml         | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..8df327e52810 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -11,26 +11,47 @@ maintainers:
 
 allOf:
   - $ref: pwm.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pwm
+    then:
+      properties:
+        "#pwm-cells":
+          const: 3
+    else:
+      properties:
+        "#pwm-cells":
+          const: 1
+          description: |
+            Used for specifying the period length in nanoseconds.
 
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
     maxItems: 1
 
   "#pwm-cells":
-    # Used for specifying the period length in nanoseconds
-    const: 1
+    description: Number of cells in a pwm specifier.
 
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

