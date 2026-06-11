Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4983A0E93
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208921; cv=none; b=TIHfBTVmJbrV5FNd118f9egEwOGkiVxbG8gcY4PdX0MqiJujqedilD6LXaoJC6KyFIkbp4ytku1fQC35u5J98CyYkmlwCGfx5nUEnuZqUtOZdU+RYNyQdDHouaMxfnrMbX9MVAb+9S79HtaMkIbQyAbBH0es/0gaQ/XdhvaaXok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208921; c=relaxed/simple;
	bh=ztCzluR5K1LOfYvJO2M/7Jb0AjscEHQ8dyRN17VY1U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2alsCzF64+99Qvv8kiFUiTT540uVeaa7PDdTheB5hRDarl5Gi3hmlMwiYgLp3k6D4UFEHLSIIRBGwqmH7KLCXzKwRE8WRhfydS3MRxEoXhnIEFdMWyY2cWIeGxsQ+QK8cfxz9iz1BM6DZYJL/i2rblB46Z87NQzgX89VqML0C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkSpMV9R; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkSpMV9R"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0b944f6edso2468875ad.2
        for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208919; x=1781813719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXkT6PmbtXC0d/wtet81Vb0IYNXQoXYAymVUyoGXQ78=;
        b=BkSpMV9RLBV2QxTBqY1i3JGHrVktuRW23b6pSJ+zAL0yNv85Yo/rVInhE4ZdW+8rWx
         P9svuRGiG/uzcdPWxD3uUGKrn1olqBS504FG8YckS8hRNhX355S1vS9agKWDUYhs20QN
         +2c4UycQnDN/cnIopj+B9xSzWREPkVWk8pXKYGZ6lbGxYwGUfC0aQq+cMEoMROFVu1zR
         vmncHLAADUsPjZcS4luFq6aKPTVqWRmYvKaCnAUJb7xJcXnHO1a3Epands/5KovwcnCa
         pk9uyFocTSYSNMV2pgNLm5pOf9Bx6qs1PRm1jIrQ+W3o9FpwKw19b9XGi3s8jmLxw2zn
         1KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208919; x=1781813719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SXkT6PmbtXC0d/wtet81Vb0IYNXQoXYAymVUyoGXQ78=;
        b=n8BtcKhUJjEBRW9ypBErzos3UWYAZylB+EUPk0KgmvEOXDAxV6Cg2vvnwezhOdWPcn
         QnuzIlRaoB07uW0+/q0lYVO6eppiWHeSplakCYQbRCP8zt1ARgTLCyCDiKzKGoaXiVZj
         PClIVmfZoC5kvzyQIz9I3MRu/QeoNQKGmvo5l+QC6qnWM8La2lyUHWYQE4gfS9vYBFxS
         Mo3DN8Wg0FxPpOSoUtd6olE7XTEWe4nBeVcVqHAYfvsOotizkwavCsYO6+y3uoj8ILtq
         dGuFlbzIgUZm+ftOhU58K21NNREqRo0acQ5d8PKaCH4uB+dddtNBZnpzoaZ/A+sRXYFB
         r67g==
X-Forwarded-Encrypted: i=1; AFNElJ+HTfJLAcWWU2fDFB/NF/uQL8KRUPMsv34kMkTomtNzsTLiB5GlxqWw1i5RfQQGwvLS0bpaCHC37A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIucvwR349FGYNSZx2tqtOTiXrCRXj9mRKPOHH2K3DHIdWFMjL
	zdlSKkVyKRSj3b8oO6pBlzGHHQFJCovOuGujCBEGALpJCXJybbnET8uyGMC+SIWDsCL7FQ==
X-Gm-Gg: Acq92OEZ3K9Pt11WfxL4qtVtmUQLdm/mTzZBmxxA+lcSIHX0BFVs69y4aFzswORZarX
	tHISUkz5WB2vprU+zJSnaA97y5TnQ2IMrzQ6Y+c+ydc0rw/Xx08PH7ITAHnTl/UMPTOwaO+Pkko
	I1Ed5IMDWDChXYtXREp2QeJ6pMcmrzFLk0Il7XNOp4mA1yZ8euJtErnU8yCtvrZ3MTWNOh9w7yy
	mFAaClufNOkWh2K1W5oM0B39SmEy0kC/YcQeeC05mj/uRBGLg6elClxffCa3aMEaa2VzBDKzkqj
	hB6vMrZZWCgOCTvzphVkw/PdzGmV2959tnKTpwvD8tDzqzjDvJne9ktnuEqNAvf7oB0E/FCARKL
	bev6UTt0xPlosyWyD8cpa8mcZekwpmbNX30gVVUVto0QMFkkTiBnnRTQMsqjerKGiRcfs9WRLUg
	==
X-Received: by 2002:a17:903:41cf:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2c2f4fd8bbemr50216465ad.35.1781208919538;
        Thu, 11 Jun 2026 13:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:15:19 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:53 -0400
Subject: [PATCH v4 16/16] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-16-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4843; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ztCzluR5K1LOfYvJO2M/7Jb0AjscEHQ8dyRN17VY1U0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsSM//PujPG/o5C1988NFUFrlz3OZHb+sFHZukhbJ4
 gmQWDGzo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZyvoWR4Yvq2kdr86/OeP4u
 qMp8S+LZV3N353cxPzBS0t6YmX07+h0jw50MkaNquufeZAvdUuY5IyOsvCP6GE9UwXfZPrNulv3
 drAA=
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

