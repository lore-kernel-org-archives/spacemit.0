Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4100A3CF665
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442047; cv=none; b=Y6KfA1ErKBK+MrMvcSbdi3C/qjJSppJ1zugDAxDQ01f5aPowlDrDl4f4uC68OLzsnsvaSnP5peKZjxcXZGAJv3jJKAuM4Zg0rSh1sHjb6+QPj+u7hjScs2OBYx1SqH4yD7DVmAdJCjjRfCkS4xj+MWhhD4Dk/CWEyXIApfW2T8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442047; c=relaxed/simple;
	bh=iGkU1xGI6N0CG6KK3Wa2Gjx9gV+MFto48jC9Pj8TI+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdwLByCInDs8QtNkvfSru9UTcDDaxuEUqkzypQY/pAssGIfYkSHUUGdymuyTUj6KQ7pznbDBf7+bJhQwp6G71gHJ81aeVN7vfShzyZhd3+4TCRxqk8MCYmCUK3d9ZQTze2svijpPtxhOav7TdxY87ITjtUBg5E8JuevRkLYK3Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl9OWRre; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl9OWRre"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8532ba6c95so3558446a12.0
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 16:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442045; x=1781046845; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LXe5fflvRfl48si4k2cnzpQ6FQhY8QPALZuyX6O/nI=;
        b=Nl9OWRreyuEFtmBIQXuaTLoN2Ee2e5A19usAw8OnBQBs15QhlKO0vmTg7pCxrRNene
         K6Ij7Y5BbMN/hKSaDD5eNHGPiX2SL08ksqNpJnSUipNcMV8MlalK5F5FkFDOxh2an9hK
         BlunLMqQGrqrC7akwOO5ebaBBaJq2Zkibj5ppzyAfA9ZaTKuHYFdIR6t5Sfu1zay3mu5
         YSxr8jJuUCUhsWY9F2Pn0kJAQv8Qxrk0t6RAm9q6dONrOSugkIrAv9KF2URHYhlNotJD
         ociAaCRhjsqE59ULwqj3MZPPz5kkuN0iH/Sde90HoVCtxS81vw/ShLqUK6I+O/BKyi+l
         9RSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442045; x=1781046845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LXe5fflvRfl48si4k2cnzpQ6FQhY8QPALZuyX6O/nI=;
        b=sEBEZMvafEILQkl1U0zZ9M3FadnM6UmTP02AYfu2gs4+rpeUx9uzDo6QqXhIzM+rrO
         bOhdgyFNeX+pT9UoPvVDplOc+xNITfjltdmw78ib6CwgwQrz5B3+fMx5oBxu/RqxTQCe
         JWsbrSMz06QCjkt8y0svgebJ6gYRwclcgYf1RN7ViB97IckUsd7ocNKMdxllktR0tMmc
         znuPjy4C8jPIkRTGkXZf/oAX5vPFQ3lwLM//WCkpy4K9938zgck1m6b5ul2CyKsuUELp
         gEst5PAcxcBo8CtCSQjKlZrhKFPMV7wUSFO8sGDflujJUgZL5XMZGpLytxHQU77Eabaj
         TrkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uBF9EoWbI3RuR7D02iv/JLhJ/sNjlN6MpIUnuqp0A5RiNRQDPrFZ4y6lv82pBJImKMEbzbsu9eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGU9Lmv62+QnBSv1qW5cILzvg22azgyrCW3ZPJ+OtqsrBJsVah
	lUWUGqJcLLME1dObmoU1ziHPZiIZoATGNIrKOeECNZeowPSFExpeOqJv
X-Gm-Gg: Acq92OHmcaHmSXy6WvspmsmO7W1yc/vJhxl3wv2TaL38rGg61sC0qsRMYuwktAutDRl
	zm5SjuK3c1tz7CAUg6jhW1J9LUwElzwKElB9yRFfZb0lahh7R4MKlyoASF7L50E0D0xENOnV64Q
	s8dCGNV1OaBf4OYqQacJfPH82Z4uQV4ZH8EPUmx+Fw7BhWyIythqcvBmouvYyoXzQrEm1cAH6IA
	J5B1EE3Up0ysbVDh0mh5rQ1WKGD3z5rIWjW/UeF1M3BoOHCeY55i/0ImznIHKxmMqYjE2MjkEtz
	eZ5y5ZxWtFf7f8NGdyoQYbubJ5ce3U5+Xm5qByxm9X64qxpcw7QdzDG/7nu1WDDhrDJIU3BbTqN
	jwGkewe0M0ulaV84N6D6J8PtJnVJY67QgQFYqTYNgZ7/pFuDp6wa5ENbykDRCRuLdFpgVVlUqLe
	E+67XK1zWzYA==
X-Received: by 2002:a17:902:d4c6:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2c1644dc902mr7074735ad.40.1780442045431;
        Tue, 02 Jun 2026 16:14:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:05 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:02 -0400
Subject: [PATCH v3 07/15] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-7-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=iGkU1xGI6N0CG6KK3Wa2Gjx9gV+MFto48jC9Pj8TI+0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHhZX60yng3sfSKyeLnNFOnCOeau1WPd/DvXlT9Msl
 vy5zSPbUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABP5eoLhf7ZSe7qiblJtxs30
 XtUralUK+yu+KhZlh9p7rtwxO1qzgeGfHcvSFV6qKy/IL1czmcDivZPrbkamCJ/8EevA1Zzcfdz
 sAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space.  It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions.  As
Zic64b is the architectural guarantee that the cache block size is 64
bytes, also require a hart that advertises it to report cbom/cbop/cboz
block sizes of 64, so dtbs_check rejects an inconsistent description.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..ec1c9473d4256 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -590,6 +590,12 @@ properties:
             in version 1.0 of RISC-V Cryptography Extensions Volume I
             specification.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1142,6 +1148,20 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
 
 additionalProperties: true
 ...

-- 
2.43.0

