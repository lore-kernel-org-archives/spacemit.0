Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604FA49552F
	for <spacemit@lists.linux.dev>; Wed,  1 Jul 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910528; cv=none; b=iT4BHOHM+ClMnyiYWgm5weAYCtQ4IDMPPzlhOqxkZq5EMMhNrkqr+ygyLI5tyxN8cctHFTT7MUNd75qV7nTSk20cYfO2u9ebIfwY/DtUUJWqjxoW4G2tnjKgjXrGI6NASR5zzKQ1zbKbxJ40GgEq4tp9rtok2pOUYzjALACOJGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910528; c=relaxed/simple;
	bh=JS2yG9pDjGwh3KA79+kpc5rS+oVEF7mlXGQkOFvbxFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBUGiTAjgsQm+yvRIr1THJeLofEEtk2SutumChFBHjVCqqAKeVi41NQHNxHnKnRfMvx3G/KnREDgZHlgXjBFoYUrWuE3716ZFK0kSYegVcVMQ/gMrs6AwkdK9CkfU/SoQl9u7ZGcND3oYD6/6SqB2UCO475f/CMUYe5uBAeE5aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M90kAVDf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M90kAVDf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8454160043aso419062b3a.3
        for <spacemit@lists.linux.dev>; Wed, 01 Jul 2026 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910527; x=1783515327; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UYpoyK5fl+7ujxdLva1zphzrbPXeYkLwxH26RQow7w=;
        b=M90kAVDfKFtEcsKUIM/Sq8mj4qtoAiBrbgMMFlVgRX+bPGieIszRBtuA5q8MBvR4Xg
         fmS7vEY4/YniJGOqy8oMoB7r0YmgE/lbLjqLjCcvr0UxNG7/uJ8qWD+7Pfg1njE+WvSe
         LZ58xuazAW1AuO5u7LATMN+CKn6GaeQEW/NnTbgMlfOX2FptVFdqx9rEyrCDt2zI2XMb
         Vu0mFPjYR5lzYJXGKoAEhORlyasX45Nbtkp067o9j6K4ftuB9aWEoCGT5rvvGW7OoHRE
         BJrZppMrymasLh2vPoyfD0Ml97MR5SRVtoYXPyGnj6vlF5B9GllcNuYliBiuuvRctSTa
         ON5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910527; x=1783515327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UYpoyK5fl+7ujxdLva1zphzrbPXeYkLwxH26RQow7w=;
        b=YKL/mfoMbr9Gx7+Ok7MHXJII6XHcta5pRKSWxM3vzDF7mi+9mDoO+1Os68Szgetp12
         KG+sQ5X4ujktwVgr/WO6PdjOk0NZzCMDZsDVyLIsXP29FpZy+lQ8r8m5tieBKtY7JxR9
         uPbFmo6BoDiZe1GiYjWLJ+txU3G1PfPeydojGgF+9smVXG09/L8JT5RMEI80FtVDotOP
         +csfTpcGCg6tYF3jDvnq1CBhyq6HVrtvpbKzluSELC8sApy1W41Alfm4o31pseKD2l66
         I0NcuMMHc7DD588uDchty8Fz3qRloQG7cL2aDepXyzaCazPpo1Z4XMqLNOalvuaxJybx
         4lbw==
X-Forwarded-Encrypted: i=1; AHgh+RoswOUyio48eFedXLvwYkBHkHBHQ6Wup7P6XfX2GPPaW5ZBvTqbrK7Ewh+6sXuXNKMkaspDRkZf2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdnx+vvlvR1ohgCWMWVK/dI2blLVfDhHOWoAlNAy2KluY1b/YY
	loEsrpXsuGFxunLpHz6kP41lhpi8suolmFCUph2kd4XyqtwvIS0EIxdK
X-Gm-Gg: AfdE7cnku8dUaxzjopMKsNIOfjPPFIxhyQOhBTs48o7GEQGu0KaWYTRsJRWiuc2QovL
	WRVD96B6zPJuOXhyAqyCAjHrQkOb12R5iBVELzyHGujkj8dlKOn4W8PbkNtChoPQZ9EvRNKqFep
	LVjckjHHUT154mddI986u4tOLDu4KxEdygnVe4NKrl6DWzK0zItHTMDyDODkHPqlP9Ra7tdY0/w
	TGJ/uHmpNB9JTtDWUUBY78Z6AVdNU7oiGkxoZ6koTCe4fuesfQkL6Hp8bDG1M/9m7GAMHNVG72d
	4KSDfoTpmlSulSqGXQ0ScuHseIFMzPpYJOm6oGy12akcSEG9AWCXKV5BYVEji4NR/8jXZcyd/Rf
	jdgVURM3vOzv3JLX50+ciUOaw2APfWdaoGLQDe1Hk/zL7GVpFIE+NHbOYoLZSOQvwEWuTgmu3d+
	8ZWk3RsSIz8/rmAMKlUM6t
X-Received: by 2002:a05:6a00:8d0:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-847c0797314mr1543138b3a.17.1782910526573;
        Wed, 01 Jul 2026 05:55:26 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:26 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:30 -0400
Subject: [PATCH v5 17/17] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-17-2c61f94a695a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4859; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=JS2yG9pDjGwh3KA79+kpc5rS+oVEF7mlXGQkOFvbxFc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3vaDBvML16z7O4dpxQF11qYlJadmHrDpqhEv/rXBV
 9tr7sX4jlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiI4i6G//W2Nn4L07wviPnP
 LdUK7wr5wKn66Jh0oNmqaTU/WmetLGNkuBHhnqF5wDSfY9vegt8vfd7POrRq0kY2Y3mJhecqlh3
 h4gEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9de..dc70470093b1b 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 36ec8ab470423..50733d3db7633 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,7 +21,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3e80e5551ae0d..3f66f2e99d41a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -226,6 +226,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -308,14 +319,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

