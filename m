Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB2F1A9F8C
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022411; cv=none; b=SzjWXF04yDcgfld6CMalM3/xaNMVRBaQWwiwZun/li+X+7I84SkQwhmqvljID/it0Mm5SeV2YQywTXHIlLE5rI82vDQpLEGzpjEV2OqlCMChT4Dsgv179Y42+cO91kFwgpt2aYnY457IdXloUmkgCul8yjQ/5NJm2kmddWaYG5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022411; c=relaxed/simple;
	bh=Fd0buc2DICUicJJxowP/3caVS6geQPw8Aog8chsWueU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/9rHAcGKRti8fJkUd8Ad94k32yXuRBYx3hgzdUdbpTLLUYxI0f/DhfHEoLXfG1DEwdW9b/4rB80CtPqY7Uhb7GyBHJy1OmoT3L1pjzwOQAFhRo0hwv655PSRnBbzU2rLDqDCCBrhcc1HXIdwxw7vc8xKDHY9cFcsfiRV91SjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BYIq319+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BYIq319+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0bb2f093aso35440745ad.3
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022408; x=1768627208; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbchAZCHr5FOjLOm2QkYq+0AjxbAU/srw4MJShYSMvo=;
        b=BYIq319+2ogpVit/gnrNP9pGw4t6M28zA6O0x3nxf/J3b5+5eouEQBAdNjuwP+1G5j
         qYNJ054moQXJ4fxGu6t62iM9ya4piCnaX1GoeePAtiff2YinyEHGsFY6+tfcxyy1qF92
         ALg7v8lcxX7Dk+Y3ThcuaJA7C2AbHo/jvK85LCiOSGoDO8gDgXHCF8Y7XpFYPQIJ4BEV
         yBhL+luu7XyJ9xem9Gt56MKbDCP2oEt/9hfw7ZD29uNVMVBIxVsL9Bvs82t67b/r3Fa+
         nACayMoO0hcJ+UGU6m2Qmjq/Ojmd3m9kQP+86nGcWX0cQuinh5xq7NO+ztyssDmquJ0z
         DHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022408; x=1768627208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbchAZCHr5FOjLOm2QkYq+0AjxbAU/srw4MJShYSMvo=;
        b=wS/XR+oXr0JuBR/wZfpV8qRbCJsy9zb243smXUPBn8BlEA0avY2BxvJK/rUc4uJZnp
         iNyvClSfxOYRWBdzyYwsqXKzold1PpUjOff+adQwO/V8lEBCJR9eBnqCtgciyVEm7uIT
         mNYTpsyBILbmULZGidxeUInnOV/BoBrYfv8vFCmgWPOgy9O7bROQWV53a5wl+bUt5VUu
         AvNYeoma6LscNrrTF1L7zZgxRYoFOOxLfu3ayn3ugUyTprqWXKWr4/unKxk79UHSQlkW
         n3UjjOjCCY5P85TjZBX57lIlc2fGoyRj1iTjHxh+4s8J5uvat/Uz0a5rJSHiM2sK2/SZ
         DngQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSmIbFJtYbG6mxLEB6bYV1yt0/Kzk2/StnPQs1QJIhuZWh5vYuQsxc+/CZtsC+RA3w6qaCe8Wt3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzvfadaIjjTTvVssxqdz28YAk0HHL/nmdLxF1Yd0Bm2IM/7tII
	p3905jqw1fv0ceS14My/3ECSLD6fP9eTJW8wgRJWAs8oBKzCk8TzvIdf0z+k4RJADAo=
X-Gm-Gg: AY/fxX6tPOcN4erOitOLjSt9RXgljgNJ+kG3ALkrN5iJ8TcRHeeyLLxMBFVM3N7MC/r
	0iWeWFWjpOfLo7uDOcn4fAmCFtkfgPeV4BmOs3PTiuteqXa14uMJqM2sSp4L5zBIT09vyDHPmAi
	5vtUQP/y75RlJ3JUX2Reyyz1y95Uey2bQMINxA5O863lkDSuxboNHGKZYk/LOEZxAjHT/kHYOO9
	Un3KROLpdFTlo7Yp/+B2uJxNiYxNznFF274aIZAhU9XTaFWciZC8+EfXlb+d6BdkKoo5FaF0S84
	zJGIR61wpVYhCktd1LOl2lyTI9pnY87bcWBy25jcOdTVAHBA2+S4bfSyKRKk4eEAF+BibWW8Grh
	jueGFRv81VgXd58AWHzWDflX2LPL+06PHo/QK6eIR34W4UkCFg4mr3AV6zx1fTcmkeLTdIAnAMn
	ZgujQM1nCrSkwDYasNUsMaRQIogzZuVCYCzBXcFqdEJ6GGvIFLOQnDYw==
X-Google-Smtp-Source: AGHT+IE3azJw/I++SvkHmJwZU+zeSQFOA0tCm0OjoB2dGO96pk6muEXdu7wFCQPtmLiZleMZdyVjig==
X-Received: by 2002:a17:903:a8f:b0:2a1:3e15:380e with SMTP id d9443c01a7336-2a3ee4aae30mr108360315ad.34.1768022408419;
        Fri, 09 Jan 2026 21:20:08 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:08 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:19 +0800
Subject: [PATCH v4 07/11] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-7-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
X-Mailer: b4 0.14.3

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
v4: No change.
v3: Update the commit message to explain the relationship of Za64rs,
     Ziccrse, Ziccamoa, Zalrsc and A.
    Add dependency checks.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f671299ac819..345624326e9f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -240,6 +240,12 @@ properties:
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
@@ -381,6 +387,27 @@ properties:
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
@@ -783,6 +810,18 @@ properties:
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
@@ -824,6 +863,16 @@ properties:
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

