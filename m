Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6DE48AE04
	for <spacemit@lists.linux.dev>; Wed,  1 Jul 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910450; cv=none; b=h9XJZ7uZyU4kSCwcFtPPA1IaXq00cBUKe5H9BuXsm+O7VbWzFZ807X4HtT1vW7TlTEkrxjR3XqwfjInLOR0MMS65oTrWKUA63kizxGoaZRdI4VS9pp8nCKu07Uo7YJrDDMYPh3DEnypF/grYNCdk9IhMusCYKz3vVjI6MKC1Fro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910450; c=relaxed/simple;
	bh=zzv4RpzLQz9N5QJYuvZNdW9u/BeWJDgXt1lzr+Z9BYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rokzb3IBNmsumLMc3GPwHiQyqOvMQVDmKN/OapORlB77+temM+NXhkbKXFXncyoEOWgnsKpgKFp4ImUoXMS+x4DX9Vy6AA4HXTA3Saqp/QkUDm1Uu6igFtjZwVr3ReJGTCjVCv/ZmNmkF51OdHhynIG7bEvcbYcvUA/8gt+Bhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QI1SmCEd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QI1SmCEd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845ea8924fdso276946b3a.0
        for <spacemit@lists.linux.dev>; Wed, 01 Jul 2026 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910448; x=1783515248; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=;
        b=QI1SmCEd8bi6siLYgbU6z75DKRa936VWf4hwAxkvq2a7AKOYz44Lro/k2jrDGCzW/m
         y427qWYFQ3YKjjujhsqSYCDCGL2XwsSLl0ZLIVZgeKita1g6apG47Umo0pYnThSAsoKS
         crHEMbtj5NjJ5M555a+EjbpPBmjZrISNOEKVAI5whos+6XIE70xitG0o6GtL9xgmc7cA
         magOHbfyQ7c2IT58NWmvBKH0ELVsFhhWrKyc3qgOJeuod9qrjlkg7MYSdhFydmf27oo8
         Tx0dhJSZTfsjynKAzzEWcFgUM4dhau8jSRK0PopIA5BXat6YOsoZOpLSsrnAdhAFLygZ
         Bi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910448; x=1783515248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=;
        b=SIuOPV6aryeJpk9Kl5ndyQSNLZ/ljyLw51xB//srrzqdicL3eW+RaDp8DcuvQucWnr
         4pfsHOs0MFNuJYOsvylttPCqsQ9cy4S2B/t2GbMM+aq6hIIRWcTf1UeRUHA03/3W7XSo
         fkxAzQETGc3DhfI3PW9ghXEbvJON66R7Dd4mVLWdR7g0DH1khJyKHPssRwkwXEL74PJR
         Upn25LuDyz6NELOpQdSbECtzEBqhqcBEvNuwgWIwIR3r298Zi6WNC3o7NVbI0FD3Q/9y
         RFuml9OWNOK7LomE8g/gaVWbiBwSWTc6Cl50PPF9HYSBx9kv2X5B74S69DATBDH/Gp8T
         RKvA==
X-Forwarded-Encrypted: i=1; AHgh+RoTS4oL5U54HSc3TRsHhM/bHI8wIWai/qD/eo2qFTDJ8zhruf001OjPrmbiJ+/kZS3hJYP6gqQ2wA==@lists.linux.dev
X-Gm-Message-State: AOJu0YytEIOo7nJ6qKHLLWRjD0QO9w3EwLTzmcM9185CfrITgsrWQyH/
	nEVXt/U7PTYP7vTuYiRMGJgKDdBNfP37RIG3Qaq5UWGZm+7zLunZ/A6P
X-Gm-Gg: AfdE7ckI9Y6ZKnSOgIi9OwmNz9mlDDhwfFRguIRsS6brLpfKwljtAol6kotPdFAQGDR
	bQD+mAXPJacXBFwCoBVAGBFeJbSaNtqL4SQtr7Y0wOPALZ9FDgPCRuNtlSdAotErwZshIVwm4nP
	CV4OTzCzCNoydDlUlYlzb1QcfuxVRLWyxRaLdvT5bESs0/DWRWrrI6kKsEwReUWPKeLDQWhrbFK
	LX/SJ00mmRBRFTLNQS/em7gVFgOR8z6r/0biMPElkZapSSmyNq7TvZr1NhDhdmcQ6LEeAZgCP01
	0j0P06s9TwNhVlpauRdq9/kyu1hF5/r/nkgA4e1xDgoOnR4kLs93khnFNVfB/0L0tp6UvdA63v8
	3UEb1raJ26ATT17ckf2laZFRFDh6J3wcahhQy3V6J4S5/vRJQuEkVFHN5YO61DwU0/UzL1kFvj3
	eoocORlI3xeEn0g6QfiAlW
X-Received: by 2002:a05:6a00:301a:b0:847:834d:b6a6 with SMTP id d2e1a72fcca58-847c09c8450mr1321318b3a.62.1782910447535;
        Wed, 01 Jul 2026 05:54:07 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:07 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:22 -0400
Subject: [PATCH v5 09/17] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-9-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=zzv4RpzLQz9N5QJYuvZNdW9u/BeWJDgXt1lzr+Z9BYs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tae54HSDm517WVHE/akZ2wyUs87/XY2r8u9ktmSc
 c0q7xk7SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCJ9qgz/fVW33XNV3v83JiV9
 fpLN0UdfY56kyUUnPP1+YnbxZCv+GYwMhy18OQtd2E9FfmEK/997+L1R7knfy7uueIlOfbDpEO8
 GXgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f4dd34d446c02..bbd442cfbd904 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -494,6 +494,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
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
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

