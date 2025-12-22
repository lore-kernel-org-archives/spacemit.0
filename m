Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57B2DF6F8
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408871; cv=none; b=r64DPZlIsgFOUgMbCHgqnXDZ9bGT29SemcwjleJ73aIbRucf+GRDgdiW+IP3Zc55ukjI4pqmnhn5PVY7+5ofA9QCaRpT1Ok0ggpuTaBaCLCWnOotb8DrhhI6arlde0RFPo9UVT5W9QSFwaHwt+mZJfIp//m14r/xqtZvxeVakWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408871; c=relaxed/simple;
	bh=3kZeCfvxx+z0noG5RA6qsXjYWD8OFyn8YsNIengvbaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJ4mp/VGAEtj1Ki0lwZJZSClwzgQwo0Iwvz9fHmtV4Qs7GLA54sJBoJhCEgqFl4O5NnIEABcyzZmIH+sQbVMSL2dBJrkovPXdi7PzOkKzcTGh4GjBag7RHZbPEfV2dio9Hn+eX9WAjq+QJJccmo1OdielfKbzRxqb4ZND3sL2Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tcwJX3MG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tcwJX3MG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so3006940a91.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408869; x=1767013669; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wWeVzMiq0I3GTkEz87TKkT2Lapp7vD4pzF07D1070c=;
        b=tcwJX3MGZJZ3gz9r60XYsC6psNpcKDix3SPGIqQEaWK9SnpqadhKlZUm2qAOAXyjo9
         /FUKqBYdbwgJOWHMiFzY93kyvpuWY7Y4eLE+2QvsiWKKNg37hcMMS4WoBMiEQXcxXb6a
         kYVEycz5de2NxxfKDrAG6i8v2U8IwfSmSjXVjY7WuPmmOGapgKq48DyYvdhUhVgQ/MX6
         4hx9nJ5oDbN9DjVUkn3Uv5yPsvntBVNbGy/TiR+se7n39bU8uhODCJTNm36BwLtSMYp4
         jNeS5MG1XDDcMi+436AOY16QH9eulL6qgmsp9xFFV15MAQ7pjaIOfpPboTWIkB+Cg6Ai
         n45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408869; x=1767013669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6wWeVzMiq0I3GTkEz87TKkT2Lapp7vD4pzF07D1070c=;
        b=hwgvABPG8M1WGtE+qtKVMRE/bd73Rf9b0qWtzeKrok0OlwxffsF7Ir3MJ4FVKEzAD/
         8l0YcTAHTXnvTRsP97or8dyvu7j+fiKsXuHqTyJJX7RTm/GQpJtlt90Rcv1nu0R7ISon
         1noPQFCpWACzosMdLkh/OUZw1NQ2AT4yP0o+y/UeGOHYa54f5ok5DmpbopzkJrUqV8ps
         3MyFHYKFvlLvxbDDk3H3T7uv+xZBzpu6mhBEBQr/MqxtbClRXxzNl5bwDRnjn0BE82O/
         xYyPzrRIMCMlOBESaTaBunIZKxuU5dD2ieiM/qJ7831WnGLNguiO4NRgovceD9Mh8aJU
         AyOA==
X-Forwarded-Encrypted: i=1; AJvYcCVPS/M96x/gBJSYw8mHjWnIZKZf7bv9FCFDbS2eKr66fnMcD9TGIai7hKm5ORrALUIZ5zrxZ5R9cA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6w0WqUzknRf2ArfppfopDRycAVl9Ygh9UYBnCsOCDqryoFh8z
	vipGJo4/9Q2TFE/Bpyf+xIPht0VhXULSje/8gqhN/a/B1P72/JmuYKl0xYFH5PV15AI=
X-Gm-Gg: AY/fxX5C6GNc71XfBYFW7fA7CrfVfjOgU1ILxFu/jN6cbjMhLcQYByuR35K+LeUpBd1
	PprdrEZBEnHRk/1gM/s2sR3+PNUiYOwgu/X6vAfyWUqx9NbEs1Zjqi/wqvAR4WLr+udhEFL/qr8
	hnqnZkrfeb83p7Um3QeM7ondV7IK2bliIu51wZ7dKBhKXQlA0dynBjFFdfKdk9QsFBgXssrDRpx
	18Cl66ROqOYrtFwU8MBUpEqJlhGKw0e4Ul6d9Te05ylZcP6xC9VFl9/1nD3Ut5Ocs07PKkFQC5A
	p3EB1a5tdAqyz2sk81Dnsr6zTgUoab3sVq8yAeSKf6H9YqJehzmv1Qkm3i9I1t7i0Kh8HCaZ3TH
	pbvpjdWH0LIr4UA5hV5f1ANE3WodXlM2J4q7wNXB9/oX0bwoolDEmqQZegE/dU5alfCt8rA/7jz
	Z53L4u1Dacv4cjQicTScQKnKyqzA7erZA=
X-Google-Smtp-Source: AGHT+IG3hZvK8C+cMGF+uVk4b+aXVA6BFJTfsNS862Moo2rzS8I7cz4aEtK6kM2lPIpp2ooN+swdlQ==
X-Received: by 2002:a17:90b:56d0:b0:34a:8c77:d37b with SMTP id 98e67ed59e1d1-34e92144e4emr9296355a91.16.1766408869428;
        Mon, 22 Dec 2025 05:07:49 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:49 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:18 +0800
Subject: [PATCH v2 08/13] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com>
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

Since Ziccamoa depends on the 'A' extension, add a schema check to
enforce this dependency.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 385e1deb23996d294e7662693f1257f910a6e129..a6b9d7e3edf86ecfb117ba72e295ef097bdc9831 100644
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
@@ -795,6 +822,13 @@ properties:
         then:
           contains:
             const: f
+      # Ziccamoa depends on A
+      - if:
+          contains:
+            const: ziccamoa
+        then:
+          contains:
+            const: a
       # Zvfbfmin depends on V or Zve32f
       - if:
           contains:

-- 
2.43.0

