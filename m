Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449DA2D9EE7
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408903; cv=none; b=ESitWR6o0JjFuu13RNnKGJox8PvzNTz4j+udo3V28Fa44B59+quuOA5RCCsccPpMfBp3A6f0OD0QY+ljPvGMRQqPS8ekkOwVoD4Wi1p+k/vIMykgG4EfEqQCQmsKbUnltG9S6T2zXjiFvRbTmwz8eeJG9PZY+4DGywrZiTTN/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408903; c=relaxed/simple;
	bh=OLOZwUl6RH4OmkxuM+Ler0k2wtMUEu+h/L5lwnAAfbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxGSZnlQ9j5po8IQbB6ODQMrtnDFfe/bAJUa/iJkpICezk4YpOs/yjPMDMvSdSO5mcEKzE6zTNC+e4uVs9zoGWf3b0D4Bdq/N484NlwYZGvZqrD7XOaWUEQHv5j1GDHD0LcFflMmb5s1jlmV8lNPNv6ujChlOpZpNFRQgv0AnHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CAR+xWHR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CAR+xWHR"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34b75fba315so4461401a91.3
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408902; x=1767013702; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swb/fWVKIa6s7pXnfz0NuUC/cpCMSK9KRmfqsMJyLx0=;
        b=CAR+xWHRg1y9L6NoHr91f3IlEyW5ZjFMvcwvweie3kR+n11QFf3aVjTRYYcoxgBUBv
         Yryhe1O2NmCSf5MlTwPWlmNT6Pu4a5/JFslHF8tc2p2++4bC4bfH/fYlt+M1aFCkUp+c
         66OmOStpROXP0SzFqUIXy5UTLJUyMWrD4Ihg3flt6UcX70u37Pvu+sTVlqa8rvSoDHuk
         oQbLeSkN74NqtHiwVIADtUy+FM/TuabcqiwzyRzvUJwTIhENeJWWzilkzKBQgnd2JtUw
         IlfdIyeTr6A6t2+9fzqVeKUp92qTjCLT7VGfAZKW7G4eEOybYLJ7o/QxRbz9N9svWqhl
         jhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408902; x=1767013702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swb/fWVKIa6s7pXnfz0NuUC/cpCMSK9KRmfqsMJyLx0=;
        b=IK2vxS/02SEJp36dQ1o/jGMXpB7CJQ7VBXx0qXik7ZFkZxfYrBxYtlbQAonZKLcw+K
         SlUOcTGrl15n4KuWqbom4FckXCpoC6qddt8qiq6OjKgk94ve7yxpJQzOuk2PIOy1y/VG
         i03qerWl46fujXIQW+CUiFxr8ukI6dq9D3ucaMraOlPWESCgCmkVuNd3A8ssCH64Q7rL
         6NY2W9/urBT7Nntj0X4SC/MQp9cXLYtbKEqmKTcLJGylnV9ro2HXXOD/AM1WgWPt8HJi
         8XjZ05ZelBDMhL4Vux6EHzlQdz8JqVvOpbZppw4v0YW01pGdBdawXezspYLHZ0QwBx99
         BI/A==
X-Forwarded-Encrypted: i=1; AJvYcCXLtixSeIOiMiQraIuQiZuvJalJqsevemOkyFJziyI/r7o1UWIAX4RWeKKej9YWhyLRX/e090UgWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsvXPqhtSmXd4JgLLV5DHScJfW9IiG4cMiUO3ZYdkWedPi6cCb
	oBOG/2FvJam9Mb3V4RaNGGn4vYpTijAVq5i5PIyHP4KcOz/L0VKKtn+SAXdSRfu/iCU=
X-Gm-Gg: AY/fxX6IsGhnaxp8LYxjt+XkgbMGfO7yMUKzzBPC9n3wtkgX0tTIKdk9+tmJ8w+Wd4i
	SYDWLM8gN8hvehPE9Mv6dW/ktuXguvjOIvNJIET52wRRPy9lPH0ZFrknZFUO+mvP0qWHrRDKe1M
	Wvi98vIU0NSOHi903R+97c+ics8izlqnDnGcN7b5Slb8UA4aD8RPe6CPrapWU3Vn5hLB4svH7eO
	/tOy0Q2Rg6GXbGlhDCbDG30CGXAhKojiz1IRfeJGaOTJK0DF3dTaVUy8yHObbZL/ziEqm4cunkG
	Rfyh5KarBlqo1wS+Rc5VLdd2mJjr1tEDNDAn8Tb89Wz/xo5p7/6HxrH5Ww8uT4/BNw9mAg3lkZr
	qw3XbW58xWTdfAf/3LgvFCZ++ebBbpMUdmkI+CYzv6FWJoicXqtcZ29D+Kqsu0z9fE0/ZhWZ9jX
	oOHFHIF09XLQ4kqOkip+3L5zBospQyo+w=
X-Google-Smtp-Source: AGHT+IHPPRy520yxXn5W0jP09IBKvbx9Ua51s8et6DIA6qmS0TPddDUVvXFSM5IqYjM5F1HB2SrU4Q==
X-Received: by 2002:a17:90b:564e:b0:349:3fe8:170d with SMTP id 98e67ed59e1d1-34e9212a48amr7542919a91.3.1766408901569;
        Mon, 22 Dec 2025 05:08:21 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:21 +0800
Subject: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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

Add description for the Supm extension. Supm indicates support for pointer
masking in user mode. Supm is mandatory for RVA23S64.

The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
state") of riscv-j-extension.

Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
this dependency.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 1066b7e65dab89704dbac449db4aa5605c95b9d3..4997f533b2c0defad88fd59413a6885b5b9e109a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -267,6 +267,12 @@ properties:
             ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
             ("Updated to ratified state.")
 
+        - const: supm
+          description: |
+            The standard Supm extension for pointer masking support in user
+            mode as ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
         - const: svade
           description: |
             The standard Svade supervisor-level extension for SW-managed PTE A/D
@@ -892,6 +898,16 @@ properties:
                 const: shvstvecd
             - contains:
                 const: ssstateen
+      # Supm depends on either Smnpm or Ssnpm
+      - if:
+          contains:
+            const: supm
+        then:
+          anyOf:
+            - contains:
+                const: smnpm
+            - contains:
+                const: ssnpm
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0

