Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363842CAE8
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239346; cv=none; b=YXqzEqK7ZmpwR8tGFesn+cb69dNqUCooriaDj+mJHo9KzWO56rFvHSEdr74CaRPZ6lZv0RJ2SdcP5wUcvS5lAh9LpEqLXyT6Fu+ym8NW0W58dvGLZj5AjJMgjol1jfhh+7TR3at2AIQMfwL56bH5Ury8ffa+Vbj+h4IfpXZdeVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239346; c=relaxed/simple;
	bh=4eAhlF/vcJJ67Apvr65nDQvIvuTHbBtggrluYAkbJbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b7yYTaiH/HNQegW546pODS/XlIRM/QXHFOQVB9fUomQeHL1Ldgt5s5dwnKzy03UBjzfXL30X9dzwiy2i5rAqBSIaFYkBiJw6oH06cCkCCTJDMQubpJbQU+ocE5UtsRz62p/TWUvpOVV+3PrfLdX75NnHB+/uzozYxpni6mEiPAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PsWeapRE; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PsWeapRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785239271;
	bh=XTxYzJiHZJ+w1vtq68qopBU8Vsm2s8Oe/VKJ+Ec0Fss=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=PsWeapREzpxFpwMhfILSSwAFQnmCi2SSrguq06sjpqGl+vv5bVAnOas/0mwu194eO
	 q3ZuPNdalYQRs+4Mmz/J53cL3GowQPl/paEnjbnLP4QdKklaiYfbCZ6c26MAbAfRNh
	 Q/TwIwVKCeWSPGHxj/XRUrx9A86sAfOBDIcV5uIA=
X-QQ-mid: zesmtpsz8t1785239268t2fd64329
X-QQ-Originating-IP: wevMZa64M1RZeaKFucH785qTL7TZBgqrPBnxAY6CORQ=
Received: from [127.0.1.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 19:47:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6419932955144323985
EX-QQ-RecipientCnt: 15
From: Peixin Xie <peixin.xie@linux.spacemit.com>
Date: Tue, 28 Jul 2026 19:47:40 +0800
Subject: [PATCH v2] riscv: acpi: Handle LPI architectural context loss
 flags
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NzQ6CMBCEX4Xs2RJaDEVPvofhUNZF1vCXtjQYw
 rtbMN48zOFLZuZbwZFlcnBNVrAU2PE4RFCnBLA1w5MEPyKDylSRaaWFZYdBGJxYdDGee7KiaKT
 OL6bAMpcQp5Olhpfj9l592c31i9DvX3ujZedH+z68Qe69n6L8rwhSSIFaqRopk3Qubx0P85K6y
 SD17FMce6i2bfsAA1QpN9MAAAA=
X-Change-ID: 20260727-riscv-acpi-lpi-timer-6f1739a6c831
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Oza Pawandeep <quic_poza@quicinc.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 stable@vger.kernel.org, Peixin Xie <peixin.xie@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785239267; l=2444;
 i=peixin.xie@linux.spacemit.com; s=20260727; h=from:subject:message-id;
 bh=4eAhlF/vcJJ67Apvr65nDQvIvuTHbBtggrluYAkbJbQ=;
 b=hQ4Ms9Ubi2J7Qg0iW1ZRu5bK85h1KAiKnhdRozg29SalTisN4lE0j2xAtC8zHWXeCN+qO1Xb+
 ViUR0tPIHFFBLNCFBGDUObRjsZVSgASHyHXv929MUm+DBApb33anq2P
X-Developer-Key: i=peixin.xie@linux.spacemit.com; a=ed25519;
 pk=jczO0FmEQZBoClfXslkwCsHKDmSRchQ1hQr8W7yiiXg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ML0YOxEYw9yWrkayi0DlaMOmQCBcAs9GcFergbHT8xlAWJb5X54jKQjD
	2uW4gkk1rO1O1zCWKRVSkf2hHbFzkQSzCC+qtBF4I0PIruXJDkwhLM96UWELhQVxvQMCX0b
	Byj/C7dqnnM9W0tcplG7HfOhknKMneU1Mg2++f953vZ16gpCRapxdD0xGjte+L3+m7dm0cg
	KYdOI/mi3MxGCP82aOnQpXjhuDel8rHVUq8NMorOk5rJuY0Hh7tBENH9AQ3OsdKr9nwiaar
	gi6oGMrf2AlTmP2sr5yRWyhtZ/nH+4gzzYBeir2Hy1rTOxFRQ3pGxOhEaPOvtdRQ3swpeff
	exlyGLpBPKk8UppGNMm+fwNq6FSwzfqphxszA65LcXk2i6wvgsagYEKPSQwCv9T1XTwBW3+
	GyZHNwzQZiV5/KVEpoHk2sHupG0u68AqHEQsV4HDTkFpfFZg1HeCV5RA2gxWHcj+aD6ud65
	B7/33OgEMr3HMrmVwVMl2mFF6kllFo7CIyGy+9qz1VYF9OwHSLXeHFgO4jT8NRQHOTyblP2
	HtxG7Up9GUL47T3eh6tboFbcOv3KdDmYR1QXp5Z47VSF8EcDswwCvNasxOiAZzHRvQu80SP
	As96Hb6WxdgJ7vNIVDBcwHTuU9MmjBQ/gr4Z70nQn5uuK3V/BBODVjy/+D6RqVhUMT8JCl/
	7gkM098OKteeQT8FPObFgB3w0/GEl9/r7/lfYNQi8XdfNPMs8f7UxsPihHAz+VFfB2QCwzC
	u6j2DnU+q7sPNYJ6pZOmo/J+e9jlAWc/8FgTxVxp/JYFrzgAg+VQM4v+e0GlsoDUnWUF+S7
	EtFbUa2YtR2zq6Rf8zJJifjnh2exyKGzVoYBABHGcGfwNZDkID6IzOAWGu/cnqjN7JPqdzL
	nSO9vDyUgrkHegPznAzmeTVHNWEXyxI4qKebS5Oz6307EHUUP7Iu9p1bLPWIdgqIUZEXQE1
	FevgJFdvjZOaEZ2c/gY7XcBk1HaPi8fOkmOr+3aN3iQgEAtoUE+iPe14h6XV9Ga5Gv7YEQ9
	ZJYJ9hhEcFvhdKQn+86bQZKtZKd5J0D97PITis3ElQc3J0+4BQprnf8trtg1B3POYamzXjp
	0z4tFUv6o5kBspnvLSXt8H+wmlS+FaMVSAtIljjfjixuT/XozDkUt0zCtjxQE5CA/u0dJHl
	ILn9ZwfX8TbPWNfcoQS8jiZtYQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Commit 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for
broadcast timer") replaced the generic nonzero check for LPI
architectural context loss flags with arch_get_idle_state_flags().
RISC-V does not implement the helper, so it falls back to the stub
that returns 0. Consequently, CPUIDLE_FLAG_TIMER_STOP is not set when
an LPI state loses the hart timer context, preventing cpuidle from
using a broadcast timer for that state.

Implement the RISC-V helper and map the hart timer context loss flag
to CPUIDLE_FLAG_TIMER_STOP.

Fixes: 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for broadcast timer")
Cc: stable@vger.kernel.org
Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
---
Changes in v2:
- Correct the FFH specification reference to Chapter 2.1.1.2,
  Table 3, as suggested by Yixun.
- Link to v1: https://patch.msgid.link/20260728-riscv-acpi-lpi-timer-v1-1-c722bce01e48@linux.spacemit.com
---
 arch/riscv/include/asm/acpi.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 26ab37c171bc..2643e28fc08c 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -12,6 +12,8 @@
 #ifndef _ASM_ACPI_H
 #define _ASM_ACPI_H
 
+#include <linux/cpuidle.h>
+
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
 
@@ -67,6 +69,23 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 
 void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 			     u32 *cboz_size, u32 *cbop_size);
+
+/*
+ * RISC-V Functional Fixed Hardware Specification Version v1.0.1,
+ * Chapter 2.1.1.2. Arch. Context Lost Flags, Table 3
+ */
+#define RISCV_LPI_HART_TIMER_CTXT_LOST		BIT(0)
+
+static inline unsigned int arch_get_idle_state_flags(u32 arch_flags)
+{
+	if (arch_flags & RISCV_LPI_HART_TIMER_CTXT_LOST)
+		return CPUIDLE_FLAG_TIMER_STOP;
+
+	return 0;
+}
+
+#define arch_get_idle_state_flags arch_get_idle_state_flags
+
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)

---
base-commit: 1d6f0a217c662693d2307ee06851cb4bfcbf9529
change-id: 20260727-riscv-acpi-lpi-timer-6f1739a6c831

Best regards,
--  
Peixin Xie <peixin.xie@linux.spacemit.com>

