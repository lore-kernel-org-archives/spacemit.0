Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A459B465F7F
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875261; cv=none; b=ozngE/xDDIpuH9avtJ4yPz9Gndsin+FNq/omV2N7hTgYVYcKGZPupxd9D/bnOeOVFbI2U9iRJlQ/rK/EqCS4y54KAGoVRcMRFgV/BziMmC41P7T8bYmYnFgRhcWHzJjrQpVQmyc8nxtNEoXgE77RT/+K/qfs2NdjxcCFrEhGOVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875261; c=relaxed/simple;
	bh=bv9dzoM+qQXP0CaPNIJAe0gHl9Bs1Sb05T0zGPjfK/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bw+OhnPUqDJy0aelBy2Ko7sPIEKAdZ6lfWDCY6+kVLCb/yQyxd83gSvTGzByiHK3xdjCpx95akoyM7VJjiv6/KtDXRn370qZp6Ct248/f+c2Yp1JpD1QqKTCx201kJlHl5922J7kh6jjOZdnMlnCROTpgUQw1paOf+Sw+yTD9nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xQk+8Agj; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xQk+8Agj"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-81db1530173so18318b3a.1
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875259; x=1768480059; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSlCL63bjlWI7Lu3zwai0kdDlIJMrGyFIXeM2/6yxPg=;
        b=xQk+8AgjI0/g8qEHwznNrvNRUJb3Z1E5Zjes/cnbeNhFioSUNEh0qFBzf6HIhf2kGh
         JU+f5sigh1Tm1YEhlIkt7DwMxUiyW6vBhOEEtLOY4rokGmc/QduaMOzLMe+BJPCKgj9A
         +3/lQUfmYGt48CfziDUw0D6x9E+RAj926lNxr/UPOWA6eKBU2z7x7JMc5ERRu4HTDqSg
         nxdV1geFH8Fi5kSyVmnDbBYR/xpKgjfBSS6OuEaBj+b6qtvM8epF2B/qdtP2S1L3orK+
         +tKnsw9lsXEFW1iWhWwmqAtrBrBXYHFNrPzrEEuI6Lv4sloXX+8kZzZAoe1T61XCrYUk
         7FcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875259; x=1768480059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSlCL63bjlWI7Lu3zwai0kdDlIJMrGyFIXeM2/6yxPg=;
        b=w1cmCIGMvty7l4qgpTpmVs7olkkzy45454trufYM8qPIgGsliY7Quv6/f26hUVH/hl
         YCnN6RwdcD9x+olvRVbqu8G1BtNFCmlIS9cO+thHBc/77/Uvn4g3AxvGJ3j51mLIYPJE
         +EZTmGbq00sziSngGMfCHyVDgwlcfLSb3jZsuCqNtYqlWWqZv7lN7dOO34u+i3M/MJtc
         fTQX6Sw3bpDhGmE/5O8UyzXMliqOt9vICWT6YfuLsASw3+KZquNNW9zEZbRfTSDVzEWf
         XPN/JtF/BUyi2xH4Ftk/sataxcUnnkqIu6KOh/Tma65lHj/4dxO4j8an4x0e06/jzzff
         kZFg==
X-Forwarded-Encrypted: i=1; AJvYcCXF+t5oHCUSaNCIzSStw3AURETnSG/DGXsDqIq2eXSSVXsPMHrcwEvnxOVyFzMeolelk/u31Fvg2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkTvxxuMMUte3V00CTb5GKiuMkGHre6N08aYeyBzCwbxNn7X/n
	i5eXqAJtlwP1Nt3/2stjQyDrecqcGvM43ClxOG1+GGkiDZMH/8UuBIEUBg82ICvZQ4c=
X-Gm-Gg: AY/fxX74ehrGtZ/PwIeyzeP2kVW+Qbx24Nux6Zo53p4SXhAW6rMm5piGSbw+BIHu3GA
	RzuuUe7MiVmF5LOi+agErbqKVT4PdhK/TJHkNl4JMOBd/R+AsvSvYayTO/6bQVSLEWU5IdTvdfu
	Cw/aH4uBUPhn/gGiZqD9JaZ5GqJarrs6Mtu4O4RGmMM+WueTUpJsY2G2cso6Cp3y98cQCFf6tpT
	S7eDtX9Cfh+gBrRoSfdumgSg/d+CtgC/HWv+OEVYuMzj/MygDMoWqZuQQHorwg1WsEtJcSOyZz9
	Qyy/IwvKVxmcxjHRQZsIDFN+9tqaJ3HiSMkTxJ/UKnYagwDnt9S9thaJ77VeVinTMgaXx+YZeGN
	Vf1wwGkeRx9ll8tsqvl4b4lZkVUFO4my//yUigwK41JFjiEzDV9wncED2MUgjzEuMl7M2nNUCzS
	eBYqJ1ToZY4fqKreaWi5Qgt8DlpVPfjb4J/Tj4ATyBHw==
X-Google-Smtp-Source: AGHT+IFkYm2SREYy+7WJ7uAuLhJAJVWSuC3ES+DlILkoTqpUr0EQ9J4ASyAuPfOv5z6+UGv+JulmOw==
X-Received: by 2002:a05:6a20:3ca1:b0:366:58cc:b74b with SMTP id adf61e73a8af0-3898f91d2c1mr6221633637.21.1767875258815;
        Thu, 08 Jan 2026 04:27:38 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:59 +0800
Subject: [PATCH v3 08/11] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-8-ed99eb4c3ad3@riscstar.com>
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

Add descriptions for five new extensions: Ssccptr, Sscounterenw, Sstvala,
Sstvecd, and Ssu64xl. These extensions are ratified in RISC-V Profiles
Version 1.0 (commit b1d806605f87 "Updated to ratified state.").

They are introduced as new extension names for existing features and
regulate implementation details for RISC-V Profile compliance. According
to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, their
requirement status are:

 - Ssccptr: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Sscounterenw: Mandatory in RVA22S64, RVA23S64
 - Sstvala: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Sstvecd: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Ssu64xl: Optional in RVA20S64, RVA22S64; Mandatory in RVA23S64

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ee2cdd3856b91a5bbf486e8a2da0986269e82a2b..78b75ab0a473b60508f72fc30d4809a797a2c40a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -160,12 +160,26 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccptr
+          description: |
+            The standard Ssccptr extension for main memory (cacheability and
+            coherence) hardware page-table reads, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
         - const: sscofpmf
           description: |
             The standard Sscofpmf supervisor-level extension for count overflow
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: sscounterenw
+          description: |
+            The standard Sscounterenw extension for support writable enables
+            in scounteren for any supported counter, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as
@@ -178,6 +192,24 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: sstvala
+          description: |
+            The standard Sstvala extension for stval provides all needed values
+            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
+        - const: sstvecd
+          description: |
+            The standard Sstvecd extension for stvec supports Direct mode as
+            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
+        - const: ssu64xl
+          description: |
+            The standard Ssu64xl extension for UXLEN=64 must be supported, as
+            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
         - const: svade
           description: |
             The standard Svade supervisor-level extension for SW-managed PTE A/D

-- 
2.43.0

