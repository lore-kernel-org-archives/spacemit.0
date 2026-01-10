Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CF279DC3
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022420; cv=none; b=g7FPduihxsXwZEqW48iCoVFvXusrA1QVc7hqxlH1lI45v7V6Z0cDIeGEz1dTc71RoWlOyrLTV3KErkIZPUSfxjTMEQJRQXzX4PAe3Z4FyVyA2/qUs56dvV81bFFcPmN4cNg2xnwM+eoBsFmvnwieV2iPPsFLwaaESj1hgNnUTDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022420; c=relaxed/simple;
	bh=80EhE/OitNlYB1B+6VQ3QGxBv250UUMYzSB2ImKLAxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuSXcHpuk+B7r0DKtzxah/oN5ZWEloSXRPIqhTQkLxm18LFAaL38SQjosjcbbS+luTjkzxR8kf1ay8Sw5sNtykXbjrQdaRuknXdZuqupykt229q7FAH8/K302VhXp1AxawIB5lsoNCUYNsB0zJe2FA9Ww4PaZdPZA5tUnbgiI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xY6hmBYl; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xY6hmBYl"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a081c163b0so34013035ad.0
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022418; x=1768627218; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zN0jIJOhzutug7gLJze8M0eK2qEZ0NMWNu3NtKdrP8=;
        b=xY6hmBYlO78uVUt5eLHlZdITr/PMNWKBQz0h6vZYI7Stc6GaCb+CrphkZiSNQQhwHr
         1oN2GkiUyT+Qv+mkGWry1pdKOiKwCVwxb2kO/QRaGmrGiSNex++Fh9yC4KU7ch9mBzHa
         HJKY8HANiqgmQTJcTpUABp0xSuY1ggaQmXYYgD8WDBm2SouqH+41MT9LOGohI4unfUxG
         9dXygsuDtkV5aO6JyBs6sQgXjohqLFv2iosRfak5XMaxXoT4ZAQjTFj4yHWrZxnXLOmX
         5tJJWUhDPAdnVe0e7UGZN1njKlDMYjV1PeB+pD64e4Yj+ldK12rwqm6Az3CLxsmpUpNf
         KMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022418; x=1768627218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zN0jIJOhzutug7gLJze8M0eK2qEZ0NMWNu3NtKdrP8=;
        b=c6KV4P3+czu0Ma4qA1c0FhhUyARIrxrP94i7QdJFziV+AHAgPu0geVe8kJv4cQ+ARK
         OWuW0KWIk5YoOCp0ZnMDyjWH+ySD1QE67gYpFU+YXD04SOD4zrPKedvaM0XZ47vmfxnt
         WOyUVx93uUMudpVe2dTnITAY9xDyxcaKe1NDfsgPAHy2HhWIptreC08zPBstMIMYZ8Ji
         HXxE+9yHruRNxQi8Xum62TLAxIU7TUvl7Uzokuny156AKwmb2y3/AOuVZKGdGyJ9tx/d
         ID83IJQuOv+Ief36U3tjeEo3sjMDMiCyTNtOvg/+SnOAl82XzKGusopckM61dWXw8UgO
         Tmuw==
X-Forwarded-Encrypted: i=1; AJvYcCVuAyT4jjc6KiJ1pFoeNKPSQMnHqEQ6mxFYbP4dKdknJB4z3hGp0I0lQzw4L5VxFKWCr8N8uc504Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhB5prS4m27r8newEp/EjFRS9IE0gX420GoQ8C9J4N/GXThWCK
	+3z81wfqGdV2qKJvvgfiory8p0oMjpL/Wb+93zgybEHk+WBd8sePIYLiQRF/iJaBBJ4=
X-Gm-Gg: AY/fxX4cOzm1DA3O+CQOCSXf81Y5gA8umCTD9Ugn6NSUMdioT0kXOrBwiF6lGnERLXs
	ewjXkf7F02Rxmyf1TtxiobJd7Sk8MkL8HsQTOyp1gOPX6X7Mcqd3virn6yReUB5p/owuqAENL6Z
	M5uKyF/7qDoGlp+NDT1sr8qfYLqRsl1iPBY1FJDMksIf1KoaYPY2yUHZG5jWhYyWPxxAE+/we8g
	XNTSHqV+fhnCCB1nhVoRlxy5rFHUbiymUDcnT4lhJRazXvR1RTP/Yw7XKJSXMbtBlnAWEzOuqQr
	6ghVv0jZJ5V0lccByXginPSaMaW4ll8KULsmHVFcFE5xmzeUJ/N2YBxtzVL1gFfitW4Y40ZwMor
	OgYVMxyfF/KKZLn1wFS8Pv7882wKzMK+FGIfdgyha8poGVm73iqGGrxddSWKeWalclyOyr8kv/c
	wmEChHtIAadZ9hdMT310jyZtmQ8rEGO6ImCyW68UBzwrKmrjBC2U8UEw==
X-Google-Smtp-Source: AGHT+IG/YASZ5bP0G4QlJrDOO/Py+JE5tERCJ+CHN75BwBTQicN0ixi/wKAyrG96pxluUrT44Q9eFg==
X-Received: by 2002:a17:903:124d:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a3ee4902d6mr98631605ad.44.1768022418148;
        Fri, 09 Jan 2026 21:20:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:17 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:20 +0800
Subject: [PATCH v4 08/11] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-8-d492f3a30ffa@riscstar.com>
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
v4: No change.
v3: No change.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 345624326e9f..900270e8d22e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -161,12 +161,26 @@ properties:
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
@@ -179,6 +193,24 @@ properties:
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

