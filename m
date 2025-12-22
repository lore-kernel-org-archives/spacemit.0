Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411E2D8DA8
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408882; cv=none; b=bSGL/8Vp8oqlWG2xH8fi6q37rZnUrlGrdsk7fXHwfE31lYQxU3FV+Q4BvNI4Aa0g08rMb+WBIgCSTcng9bRc4XiQtsl9pNsloGHxeLFuEXbHUka9pQSAfaLvSG7oZk90kaJfxnG4rX4DF74QsV9xa4FP5uXUJYQt1Zn+lEhEtZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408882; c=relaxed/simple;
	bh=K89WJDNQZlTb3RIHeGjyXPAyA1oKMNnY/ZPdlLDcRPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2tbzxm2OgSaJG4Ph5/2JaP7IfeWCnhPfwXTdrPiKM2yKCyQ1W/5kFSJC82Ag4dBzBWA8fvSfzEkObxbtQp5Q7IA8hPAm3gRwsB4HO2HT9Z8/zDTbYF9MO+uQj+HkrNiZTPomCpd/vU3A9cBceQAaZMVa7QP2q0UNW60eSBUfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=US+cdrIH; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="US+cdrIH"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso4040051b3a.1
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408880; x=1767013680; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkOHhVohKsGIoIuLcaXjm92Us2r7m97EVQ3rEIH1/FI=;
        b=US+cdrIHn56CsJ+H/+0cVqWTp9UCcn9kQesIe6uYiXCa7PAsFQAPN7THYVTAXWJGfM
         D5eeaHUJnToceoVV723bPgWQyLzjnNSRHefRifrA3ocWbdPOV7lCuxPTozbdp/lxhcQ2
         7I9n4v1T17/No/PadSPmkWAnRY0CvPyosIqvKIbPow76vKG3AZlKQyve8pVtPoP84lO6
         yomQga2kn32KCQWea8xpecBMrZ32ckVZn8zyzecfYENlseqrnuRt5sbbT1jK/OHA6R90
         Kp78AoyQ75dYRx2l2DNELC6evk6+jgrsLsxovi/faBLXy5Zkeg7UUucVRHC7PAksYcuj
         JU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408880; x=1767013680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkOHhVohKsGIoIuLcaXjm92Us2r7m97EVQ3rEIH1/FI=;
        b=vUcOMJ8h/FtLD2jUHTM0nzpsCnhP1dEuZUCxmdwX+z2yrPgK7EcTitsYCBeNMlq5wx
         NmtV9fQVF9OSNx8ajq0W62iLMpJmPVOYHA/hCyBNZF4gRfLmXY8ckgFFQMTvP6NJ9qBq
         xO9+2p9yaC7X9MMhxK2GqmPNDbhAM6wsuwBHwB7AQzrE+eKnSTyCdwNVArsX72y/jS8p
         By5fgAqdobP/5cOoBzl7YhhYw7sbfdxwI9XEBpbZbCpFCfze5ZIAQCQblnnC9p3ETfB9
         I0ANcobbRk0zxcJWXmnHEkpASlg3uUOJzxZcMSw64JWbv2JDkrAz0FoYUbSK03+DJdM/
         d0AA==
X-Forwarded-Encrypted: i=1; AJvYcCXcqB5r8Y/muEmZN2o8JBHAPL3TTZGh2vtT+ywVmvFUlduQN+nRllcSMGJob9daLy7KCcKuZvHR4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUGz7f7P4sf+QW17ATdaUvzmzLEck+YUCO1utQB+W20KLpykwG
	vaG733AglhmTnJp9vQmmYkKeSJILo3Qs5jIlIb0n2BOizvrtP09IpBlEdZpgOxQG4Zs=
X-Gm-Gg: AY/fxX5tBgsLFmJXR+7SSxgWqH2Ut7tVQ1pBLxWg0+rPhoAhmyedaiZDU1uftdh9zpZ
	6h6sBEho9Chwk6/I4fS1E/WpwF2F7nMj8ccoipBzqTuWVw8em5xxDZeGya9OP3GLahSaKy+e5Ll
	hYE63z22ydTF4e8VIwGIaiRpyaimXpvwaBkf3W61CeC4tuUkH8xY7ZHRnXBhayMkFsmvVQ+jhmb
	ApCxXw4sjxnX29jtl25NXUI4RJW6iRLTxqwlxJgdUtc+wsZDRyk6n89MmhYdpzPqAu+ttJb198H
	frvB6g504Yi/137C+omH5b696yziiZaqLqn8hUsNPFtyrE44EvVbn5OEubp/FPSLigaF/faaQvo
	FHsi/nudS3zrx0wtK+OE+HF/+LNPefa0NWo0sI00gT9l0AWGU3gyeqNL3+briore8mFyabOKzBj
	BkiB/JC894q+r66hzBhYc7UefSwAd4vZs=
X-Google-Smtp-Source: AGHT+IEVVJo9wYrbvjovvz34oXELviGUYat3B+h9KiQImiYaXL0x/LFxPhkuEtVr9NEz35uNWiLhaQ==
X-Received: by 2002:a05:6a20:9189:b0:366:14ac:e1d9 with SMTP id adf61e73a8af0-376aaff470amr10935543637.63.1766408880374;
        Mon, 22 Dec 2025 05:08:00 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:00 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:19 +0800
Subject: [PATCH v2 09/13] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com>
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
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a6b9d7e3edf86ecfb117ba72e295ef097bdc9831..ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c 100644
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

