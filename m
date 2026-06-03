Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F84B394E91
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 23:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442112; cv=none; b=QGgm5EI3M6E/nc/wJzbAXpOtWwyTWfVKSKuxSbUgC81rjR2gUh6/mtA4wFXG6p76LdkGfctb3CZy585fOEVHYQ2xEJhtLJcGtybiZ3WzuhCECcYsNYBiBsGroZFcMn9C2UP9+Gz2ZmbtfMsT+UF4aDG95Gs5jtcj9vrBwiYkO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442112; c=relaxed/simple;
	bh=tZ/CiPcUsZvtBR97R58s9oCTI1Bte0oaCzSODfd3jpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1XCd4nxUVSS3ndYh5hrkykuDA3VOeEHpSh+07su6mXPHExUTWmYo0s97yYZHCG2nVy8mHEpZZwLjhM1GcysqLCZXUBKqYa0ia2U+yvS5ljJg3HxNZYyTGxSd6dqex6wYih/+Q+qoioMEE5FpyYBGxPbLp9/sTus/8uhKEskjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hczD6hUR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hczD6hUR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso3049590a91.3
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 16:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442110; x=1781046910; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UKSxPZqE0keejMk0VWDVENbRB8BR+XN3og3EZcymsU=;
        b=hczD6hURvSq4ujTiGEYdXz6CFGTXqgOH4ttheQg8um2J5+jDLQT8kMbc4dxwtxy+BE
         RhcReaPkJ+MIGVU6GYMOd4/9DG2qLTudya9/RiVxa/Mz2W75sJ8yijg/RP4aH/Gcocb6
         RVbVxrPaFTI+e2kgEQ+ZVkc6f2pH23/Kqa2bzmVy9nwWeihIQ35CaUCOyHN6TpwXEBdQ
         sSzIzjbNmLa09tqRwulyWiwk1v1lkEwMuQPktVglnkAKGFEm81nU2P9jruZAApsXqATb
         i8Bw2LFF3qmJ2tSgcO0Eod65bPBbZM3ko/I4cgxYv8kpogJnSGmhE+uTpw70RFruoZ25
         0aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442110; x=1781046910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4UKSxPZqE0keejMk0VWDVENbRB8BR+XN3og3EZcymsU=;
        b=SFtGkGk/7OlT8FfyJFUVXcvgMVrX8Pqt19OctcSAEnOAfFDAr7p2ZVpbmzt5ND1T0C
         tU+pXO5yO75iSnqGiVqIDTSpB1qYZVwBsygyFQmCPp0nau2XuVTBNeIOB/VI1PKy0wAH
         paZs4mLMyrynhDp9zlJSJCsu0Ihn8aFm8oZOCshcWPOmcnPbRZx19M2sMlTYC8La6N+S
         evZoBZQHjsSZRjRHAtrHpAOT1M9qH3YKrwlPXHo6hHv/x7NJX+Azm6l3VH9x8QmL1s62
         frqhxLujYr4oG4qI/9a1v8OBrrOQTf4U0GTD6dlKqfN59QK7Gannpa9cc9Y4krkl7cbE
         HurA==
X-Forwarded-Encrypted: i=1; AFNElJ8JIvQAtqUANwE7EoMmjvur7+meAqFsW9XgZL3rsWmdczH3i/79f8b0UOvB1kjXo1u4EWK5Y2fZew==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzSuebdRn1qv3quaxIVBUCq0poinK4RPSTUQxKYYTj3sJfmInn
	PHEZ09dPbTrOXjsPyr5+khrWwcAlyU+qo/59IEzIvRbNfwqM1mzu/yWs
X-Gm-Gg: Acq92OFgpo95/VKxG4gBC6qKaT0W3KyMUptDurbBwUXOfvA6Yeb2o2UvPOuJinqknXV
	Ep3rYgx4FSTrUNaFzrHBez0WNLIzu55FEiMf5yIl18qMhpbeli9nUMcXuVi/EKeyi99aes8cEOj
	Ubh4Lp9lp0sC6nFi/2lcqodgxW9cHB66x6uG4fXyzeWdpUfHFLipzNfWWsczAXOCKyz9ztHa06x
	gtOE8WSEdyYgW/H0d/wr+aqd+PZFkpASm5oSYyDOoeN6iWZNESl0CJB/ICWW0tM1zVIJB2O7VOk
	2Fvb4Vz45f63hc/q9Hv64Z4Moa9Aqcpv2QdBXLYolpBDzTEv+EiaNp520FQ1xW9BZz8mr+VoAbF
	2bp71beWwOUSGoFd6VHmyC5T6EWP/mAdC7l4OZO8ieLsuCcnwB41OFtIVnqOpDGWeO5x3wCiE6P
	2lPhmMltJJpQ==
X-Received: by 2002:a17:902:c946:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c163fac80cmr7638215ad.19.1780442110481;
        Tue, 02 Jun 2026 16:15:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:15:10 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:08 -0400
Subject: [PATCH v3 13/15] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-13-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5841; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=tZ/CiPcUsZvtBR97R58s9oCTI1Bte0oaCzSODfd3jpM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHraPLXPmpXIEPhB+/Gib1PlNR0K6Hk7843AzqHBdx
 NRb0v3MHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRw1kM/z11PpzaICMkPeVW
 ddw6Sz4ObisRY++ezaLPfa82eRh9OsHwP81i0/VjrCEFZ/P4+Vl/xR9gD5Hc+Uq/gn1TxhPHN9v
 1+QA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as a subsys_initcall so it executes
after core_initcall(tagged_addr_init), which probes senvcfg.PMM and
populates have_user_pmlen_*.  Without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing. System-wide consistency are ensured.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h | 14 ++++++
 arch/riscv/kernel/cpufeature.c      | 90 +++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..facc31b2960c6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,10 +25,24 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
+extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
+
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 extern const struct seq_operations cpuinfo_op;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 79ff431768139..15b708da98a1c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -1321,3 +1324,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as subsys_initcall so it runs after
+ * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
+ */
+subsys_initcall(riscv_init_isa_bases);

-- 
2.43.0

