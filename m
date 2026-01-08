Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452344D68B
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875248; cv=none; b=HsX6iHcyetM+cAvRJa+oGg1w9KP5EuTDU+fX3pJ9o53nhIOdlaesQt/7pO+h2pnOEz90eEOIEo2+3ZyU9PPQU7lU2HQtgtt90qaj4zgabvX+/vLW0sksTWdKxNugq2u/ZLDJbkoccScTXBCQLhPLQ/G6bsQU+ZGqXsfQkN2sf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875248; c=relaxed/simple;
	bh=b3TbBB/uGCPBAgc/CZlMEVAVW/g+2p73yz3LsGsKSkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnEiFjB3lB3GxmSD7k6MOfQpttA1ogrzI88hw3tVIS7U+/yn0/uWAagGBGZl6BYStLL9OVidGGOXG+etBcK+CI9gME77EMKT+g+dadEr+vDtF0D0qYlqnQjz0WzrHlS0UTpGlqdLvh/bkWx56CWU4FyxV/yxdsForDAwyr1aZUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qCaRGgCT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qCaRGgCT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81345800791so1786547b3a.0
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875246; x=1768480046; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwaC+shKtPHF9hxjazt9bdYtYDRjr/r6esw6vyxkzGA=;
        b=qCaRGgCTuEFzu6z+f+nceO3QGRFXwnqLuk1TnGLiScxtvh1xnkD/j4NIb7/Ptlx4ho
         SUQifyUqHrVHpAzqQST6PG/ooHytjnUAVJka83vF4dntxz6ugZvfYgVib06i9m5600Ez
         FuR48hVN8F2XUaGI8moQPoWqFfv1N0dd458MJkDN4bYyL31iysz0VvkbSoXZLblZlfhb
         z1tfxCLZq/HlsnUIXBTb3yoT2zfBNW6YqGNW1kwPExePzF6b/t4NQB7uHW/6Gi8mhlOi
         9YamDVKp19mmOAgokljlCFf2Qhwcc6HP4HZUj24pWyVIlJpM59CeNMpsUNYLM1zWdUBB
         tY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875246; x=1768480046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mwaC+shKtPHF9hxjazt9bdYtYDRjr/r6esw6vyxkzGA=;
        b=GSeoYj2SZlpn83XVo61EeJa32pV0+3SkwfHOKXXCBlUSxlL6LK9fOPrWZ00Gz6eCoP
         CEsAGlpdd+8P2I3Hgv9RtklFsQ31hq1HvqBqzTkzKRSci04XE9eFsM13OztS0eLgI4l0
         1YWCpphDJYnHI+iEDxq7cj46EXPvGi+GRU9LLl1icDRcYDQ0eKpN/9Nj88lUHM6oKJ+/
         vDiVNouWDfo/s+vSUl5/cTjCyFD3La0R/CNrT0fo7CZECETo0tasvqwZfkny9PII3EXH
         XmjkR87mHvJfVxcVe/zz5HL0OIDdD95pvLPDw293lGP+kFwU6PcAdJs3Q/E601FPf9jO
         n+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxgZ9jLqIj+U3/hLowcr9mBLZ1m8YBTLVlYpDg9zL661tqm6y/UWTg8YoykYDkwDR2ipRA2OPaNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzckigTfWrcHekJM+Dbo65v36gT4gnUo6GWUsl+ZWnzu8DNm9dh
	ywU9wo08+PsVUjNnRcIfkKDs3m53jbQ8WpF5Gb09ywkjgPrtxD9ROtYHX+z905+TYrs=
X-Gm-Gg: AY/fxX7Ukza/ATm6kUU4OKap7cP2mqpeIykB9YRmbbL5q/wDy6jTPN+eiLdjdh/4ycB
	eGO/uvbLd6XOmpqlisZFSWgJElmk1oDHbpe3vSq3XGiB4zjUjoHDQlCYQFL2Q8s+dJVbDU66jeJ
	YF4qbASgeAQR/9AFsU6ATCB2ZCPdAwrT/RLwlc5lhj8gNPhcnx1eT6XTvfvIJaF/PLr7QPdv1b/
	jxeCLcWi5OAUxTG2U+ADqsyGCtB1x2qynWf3hQiaHr0yzVHbw/KBgS68QJZ8Wuh9yGo0+bmytPD
	qWBZQdrhazCDK6g+XH1J84+QNfbAgaUc3HXxckxTs72nJgfrG4/jlPRvfMtBdhyehB2sMnhWJ33
	Lrc02kz2f+JFv0+ALBTnIlIrseenkc0fEINambZ8HaxtCSw7pRd41mQi8p+8U7r2cI3F3xXvoAF
	gXMB6Pis391wvzY6je0r5peRnENh77VZn6902cRw93DQ==
X-Google-Smtp-Source: AGHT+IGhCCDZv7bjh6IErkPehfJ2jVcvReECzkxUQUoLDLwfeIJZYdhcoUvkJgdrBLVOE06Ipe/4/g==
X-Received: by 2002:a05:6a00:1bc8:b0:7aa:ac12:2c2e with SMTP id d2e1a72fcca58-81b7d8563a8mr5548416b3a.25.1767875246380;
        Thu, 08 Jan 2026 04:27:26 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:58 +0800
Subject: [PATCH v3 07/11] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-7-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
(commit b1d806605f87 "Updated to ratified state.").

They are introduced as new extension names for existing features and
regulate implementation details for RISC-V Profile compliance. According
to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they are
mandatory for the following profiles:

 - za64rs: Mandatory in RVA22U64, RVA23U64
 - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64

Ziccrse specifies the main memory must support "RsrvEventual", which is
one (totally there are four) of the support level for Load-Reserved/
Store-Conditional (LR/SC) atomic instructions. Thus it depends on Zalrsc.

Ziccamoa specifies the main memory must support AMOArithmetic, among the
four levels of PMA support defined for AMOs in the A extension. Thus it
depends on Zaamo.

Za64rs defines reservation sets are contiguous, naturally aligned, and a
maximum of 64 bytes. Za64rs is consumed by two extensions: Zalrsc and
Zawrs. Zawrs itself depends on Zalrsc too.

Based on the relationship that  "A" = Zaamo + Zalrsc, add the following
dependencies checks:
 Za64rs -> Zalrsc or A
 Ziccrse -> Zalrsc or A
 Ziccamoa -> Zaamo or A

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Update the commit message to explain the relationship of Za64rs,
     Ziccrse, Ziccamoa, Zalrsc and A.
    Add dependency checks.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index e026b366c8f5dbe7d6988d3ed374183c165de35a..ee2cdd3856b91a5bbf486e8a2da0986269e82a2b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -237,6 +237,12 @@ properties:
             as ratified at commit 4a69197e5617 ("Update to ratified state") of
             riscv-svvptc.
 
+        - const: za64rs
+          description:
+            The standard Za64rs extension for reservation set size of at most
+            64 bytes, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zaamo
           description: |
             The standard Zaamo extension for atomic memory operations as
@@ -378,6 +384,27 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccamoa
+          description:
+            The standard Ziccamoa extension for main memory (cacheability and
+            coherence) must support all atomics in A, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: ziccif
+          description:
+            The standard Ziccif extension for main memory (cacheability and
+            coherence) instruction fetch atomicity, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for main memory (cacheability and
+            coherence) must support misaligned loads and stores, as ratified
+            in RISC-V Profiles Version 1.0, with commit b1d806605f87 ("Updated
+            to ratified state.")
+
         - const: ziccrse
           description:
             The standard Ziccrse extension which provides forward progress
@@ -780,6 +807,18 @@ properties:
         then:
           contains:
             const: b
+      # Za64rs and Ziccrse depend on Zalrsc or A
+      - if:
+          contains:
+            anyOf:
+              - const: za64rs
+              - const: ziccrse
+        then:
+          oneOf:
+            - contains:
+                const: zalrsc
+            - contains:
+                const: a
       # Zcb depends on Zca
       - if:
           contains:
@@ -821,6 +860,16 @@ properties:
         then:
           contains:
             const: f
+      # Ziccamoa depends on Zaamo or A
+      - if:
+          contains:
+            const: ziccamoa
+        then:
+          oneOf:
+            - contains:
+                const: zaamo
+            - contains:
+                const: a
       # Zvfbfmin depends on V or Zve32f
       - if:
           contains:

-- 
2.43.0

