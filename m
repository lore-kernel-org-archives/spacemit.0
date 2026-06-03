Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7C3CF69F
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442058; cv=none; b=IYau00Yi7QZtv/Lv5jTEozGHCYbZsZUE9G/tonQv6LliKa+sEwmqe9zBO61riLbABcvvtJLKi/gx5x1wfPomoGfwWiAd68/TpCBtabFcdrYuTY5LFgn7tYGKCD0q5WmgOrgZsIrKLzZS2j4dk6PCuXVqE4+AQpaelpsRbElnE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442058; c=relaxed/simple;
	bh=ic3wkraCrvoYZ6pSRcfok46YiwVD8eKVuqso6BkVzl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRAkxJSRUprgWHU63kIb0mKmvGiMhblqywMzdZv9n+V8xM0IQ01ztHzzRyuc4l8XBa3INXvUvdfaoKOstTzTDKDSvXG85fh7XO5X95V8/g8YhZaNtfkbfQcBFLTWi1dqVAnA4jfGEijUzrR+hGbb8ZF9r+ysSWzytHc2wEczU+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFrM07XO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFrM07XO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso21640385ad.0
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442056; x=1781046856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnLxbwZwMbkVvB2Zwz0yZiGVjbTNpgk1H8ZchRPW3Lw=;
        b=VFrM07XOVPNVxXZwx/CD3snC3voLHu71YjA7jAF8x7XK03OqDWqaPfKWuTHJ6OMAJp
         0AN8yEdDBWVF249GOzgTHX41Ej3ZrH7Xh4GMVzSLMBdMhvhQRYx4QlOcd8J/aK+8CKIO
         5ksVBdJSlgyJ/X40wHm4LA7UMUKZkWwsPinVI/AznZ2YX1ebcacTPCtQ5HnPIBapuOdl
         q9inh2U4VWkrmG7blCmACm8J1f+kUE1OyrphZG4xUSoeT1tX2kTBMpdIzaU+Qe+pBpI1
         xl9NzLsFRv0SVLdgY7HkbJr3KEOxu5a2pv6hM9BLG50pqGcprQ6Cz37LRbhNjsK4VCAk
         swRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442056; x=1781046856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tnLxbwZwMbkVvB2Zwz0yZiGVjbTNpgk1H8ZchRPW3Lw=;
        b=UYsgL0jjWriFKLMEFpDn96F+jC51J0LyEIYlZfS8Bc0UA+ReI5r1p2ALnz5BOsEMoc
         wK6+XuTZLb3omBbd4u5HLk91fjhlIp7ELnpZbAWprWEnAjZ4ZyW3MZZipHZkxnyhnZOI
         SvV2KRmd5UlUExX3IZflvD0a00Z7jB4nuE4yudxhQkBlYh+I3VpWxxnphkrrRMui81jS
         VbqJhx+cT8+F+ImyqZjttFPAHbRwvZWZgWbrYE0KYR6jydllSgObcGoxzDVaxwl36Ye1
         UXDHWdTNp5xW4rdbFSXaL4fzoqf7gfrNmVn4IlH1RUWp8sBsNxYAWP159hSunYEK5gvs
         y0YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lLvcoH2oMN8yNgKATVgghRZh7kPRaLZXfD3KgTyylIscryLNEivCMpkSOnNLccaA9wVnZT/asHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzILY3nrM2/OcSUIBpCYVQIB9KzoFKM2l8Xn7hz+kTLRYZ1/4mk
	q20XCwdNlCwEStlacCHioL7NTV/nxYxqpdx7aNS/bE0Al17iVr0MXnwC
X-Gm-Gg: Acq92OHvGnvE/sgsJZBBAKGzYzbynR/qP8vxg5RKcCPFT03pqY9nx6eN6LLEAap1aHZ
	8Vcf1K7yUf64427DxNCAuakaL7UkfKdNKzcVaSgrfg5RxxzIsMRMVwHSYhWQWmcBOIjMFRjkbl4
	JI4XO4sh/Iab96FnxKlr3X71YBGuAhdFGkhQpf02mY74giEXac21+jpYFSA9NK9suzofFt2tgIX
	cFZBuFd8EVVDPwghtO6qtctCX0cM5saCZBomrc1ygfOh1gvUB1uRVnR0xM27s97aamHLpiBZ3+B
	ZlLuJhgO61WFKLW1ML2oplbfO58iZtMKvDYZj9XDsw96cBisLN80KwY0QmkoKckcuXvuy5AXtD5
	MQivuZSX0gm6sIRu1MJctSkehqEP1uxyGDV6ltnDigja67KkpS1Gel6C5TJQxLETMACrdcfDsuH
	q9qa/NhMwL0A==
X-Received: by 2002:a17:903:1786:b0:2bf:3309:ecce with SMTP id d9443c01a7336-2c163db0b76mr7281915ad.28.1780442056055;
        Tue, 02 Jun 2026 16:14:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:15 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:03 -0400
Subject: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4586; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ic3wkraCrvoYZ6pSRcfok46YiwVD8eKVuqso6BkVzl4=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHtaYUAuj5udcaV9+3F8kksMfOan5kXhKXtr2cjvVp
 2nby8Q6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCKllYwME25NXvdBIXV1yPlz
 065MVtg/J8fnxBrLiaLmBjOj9Bc+XM7w3y9bwWLOX9bcybISXpP0V75SEN4vu8JlYdnOpjRnttA
 uBgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires cbom/cbop/cboz cache block sizes of 64
bytes, and export it through hwprobe.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  3 +++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 18 ++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 24 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 002d5046ab689..601e81f561421 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,6 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 58523b3a1998a..36572c1ff438a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -117,6 +117,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		107
 #define RISCV_ISA_EXT_ZICCIF		108
 #define RISCV_ISA_EXT_ZA64RS		109
+#define RISCV_ISA_EXT_ZIC64B		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 430dc49a82863..36ec8ab470423 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 #define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	(1ULL << 7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e0197160af6dd..79ff431768139 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size device-tree properties to avoid inconsistency.
+	 */
+	if (riscv_cbom_block_size != 64 ||
+	    riscv_cbop_block_size != 64 ||
+	    riscv_cboz_block_size != 64) {
+		pr_err("Zic64b detected in ISA string, disabling as the cache block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -524,6 +541,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index dcc102bf8f183..3e80e5551ae0d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -211,6 +211,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

