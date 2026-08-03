Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302661FFC48
	for <spacemit@lists.linux.dev>; Mon,  3 Aug 2026 01:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785720154; cv=none; b=IP5Tra+omC+3914+nv1H7tpFoWc0u09DDSZ/6UTfRWqX70vUM6gDDNmMJU3h3NvHAlbBw7H9BWFr2BiKX6Ox3Sj2hyBiHAbqO4HJsoERPt0FZEk9iSsVycCutF6z6QsHc/wBCWG9+fJJrnuEvpruq5OfoVHJO4BlA9uUMLf0i9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785720154; c=relaxed/simple;
	bh=IGIOiqUPBvXhRjSU/l2LErCmIBv4zjk2X496JkYviSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uUZnW3QyeumwFyXfBW8+MYfa8014eEjVJcBd+AU8I6G/ciX1YcD2qatTvUW2cy0O0JM256QBBr0NOFD+WB6/9UzymkB2N8zJEAzTC6QTz99oj829znUBVcAA1ePiy8D6ftF+/6FObhmNwtDCDSbXsPLXEAzgPQJod0pSdwpsfwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FFe8RCT6; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FFe8RCT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785720061;
	bh=E/59ULRX3fcCiGaKpCuRRXWmoaL5FaPHckfKK8MWx3I=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=FFe8RCT62tPoC5H7XAOS4Nb3a6f/9e8Q4Z10AD9u+an1/hffTv83mlkyZyrFf0Abs
	 9oFmRGfJTf3VWLPcdIkMnDonavvZJ2Bo07M5NQXArolx6RQx6LDj948YNgC2lqfRi5
	 VibV9WAjyTPBf7KWX+WSdoN8qfQecI4FZG3U9Oj8=
X-QQ-mid: zesmtpgz4t1785720059t895a68f2
X-QQ-Originating-IP: 25z/h3E5qMZ+0hCnj4opg5fruy6r28swwuWlwxx6GhA=
Received: from [127.0.1.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 09:20:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8004584693986170675
EX-QQ-RecipientCnt: 17
From: Peixin Xie <peixin.xie@linux.spacemit.com>
Date: Mon, 03 Aug 2026 09:20:38 +0800
Subject: [PATCH v3] riscv: acpi: Handle LPI architectural context loss
 flags
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-riscv-acpi-lpi-timer-v3-1-520fa13732f5@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Nyw6CMBBFf8V0bUkfSsGV/2FclHGQMbzSQoMh/
 LsF446Fi1mc5M45M/PoCD27HGbmMJCnro2gjwcGlW2fyOkRmSmhUmGU4Y48BG6hJ17HG6hBx9N
 SGp3bFDItWXztHZY0bdrb/ct+LF4Iw+paFxX5oXPvrRvkuvslsv1EkFxyMEoVgELiKbvW1I5T4
 nsL2NCQQNewtRXUPzYVbWerBQqhJEK+a1uW5QMET+MQIQEAAA==
X-Change-ID: 20260727-riscv-acpi-lpi-timer-6f1739a6c831
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Oza Pawandeep <quic_poza@quicinc.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 stable@vger.kernel.org, Sunil V L <sunilvl@oss.qualcomm.com>, 
 Huisong Li <lihuisong@huawei.com>, 
 Peixin Xie <peixin.xie@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785720058; l=2769;
 i=peixin.xie@linux.spacemit.com; s=20260727; h=from:subject:message-id;
 bh=IGIOiqUPBvXhRjSU/l2LErCmIBv4zjk2X496JkYviSo=;
 b=7emY4Fm+omxuUdtUfXXDuy1oWJBhRA+5HYU363aIF47ZCim7OKi8x77q7dXFpyADtPbwgrgci
 gwvKzMf/GSeA3j2FINxIoXzgrhnKcrcyiveEvbS+MXAzDLnwz4a0wvh
X-Developer-Key: i=peixin.xie@linux.spacemit.com; a=ed25519;
 pk=jczO0FmEQZBoClfXslkwCsHKDmSRchQ1hQr8W7yiiXg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OWtbkH21mRLJuclXtaOSdKVduhSRA1Ck0M3fGQayjtbEHumXmysX9Y0K
	61KgyB7mugK7GxXUC+0f1XzGftdy195o14tC8cODzNVjJwlb69TUtBmRkRJLADE/Ig4rQ1w
	Z4M3Ffpeq3emEMKwe0kCYONS0hv+7a/ndHUyqU75vgBEzWQv1Jl/m2zDov2tmHdnkobtXPq
	G8eDt72H2P9cKQ6fdKImkzb5rkUODhP4QLaf1EewkbAwinYvsDB+g9EYD4M0vidGF6t84sT
	pLQo8+8+Q0VUPaSX2akD4KRZr3zkWdO7gXtCQptqlIU8XtmF60vhfMQ7gYxpuzn2z0Q+ngK
	/bMi27+G/Zt+PUeMLmjo6dbp07jVpnYQ//gy+EBJkHD4rkFQ11tWrZ4dlqVggrQkmWxXPog
	GfMj0ZOprB2FOCg+K5ZkRkhMkr7gZ9fMps0eIcSZ7fSBcATHemLudalQEKGVPkFXJP/0DYj
	HQEIYPAd9RQlDuzsltiwYi1AvnIzI+307hsghpYE/EBj2VWkcRzyB7wTPb6wVpLBsdKMSeK
	dJJlTjmhoTW9zVOzcfsgXhIdBYPeaBEMLWoTIB/Zkfwkc+QJwGNsd/TTbqQepcFBG8udDEp
	pBbxJj5D3PToEx6pj5afKG4S2OTaj8wR76q/L1De2JFHxAxuBMTwGGdb73IVwNSexs5IJ0S
	bA1p2KHz/Zw2xa5KYIx30b7suOuCabuk66wKGw17jyDE2iKBYFG0sExAL6gi8LTXMxYNqLx
	+HwGjLa7hXLcnHvbDhwwHxWzwxDpNGUYGeUEMHeQzVCCFUQcQ41X5y+T7L6EG8PguVcL8kN
	3m3QqrdkGrUi30YQLW0PbyWdOeq8+s9a6skNBS6XbCCGtpCBrGVrki2LsBK1r3qRjuV4xf+
	TtcwnQ3/hgz47V4Bu0Xd5Vxus2Q0ZA1BNLeicXvilBjMsWTJ7HZahLjxAReVDJFu/oMHY/3
	mCjQTMghKv9i/Rd/T+dJBPLDf7bu2IJ92QA/ixKra05tOiQtUfNwOc6QnHYbpmqnMrwavzA
	N9OhwLXR2s92aya++2uajbPBureDWG+J5nvrxasp45l3x8tAyVLGqm5dJKa60FDvdgoMbcA
	MJSnzqbN63IifxblGp4sf/3aD24HN2XWFXH3LIw9fVp
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
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
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Reviewed-by: Huisong Li <lihuisong@huawei.com>
Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
---
Changes in v3:
- Use the PDF specification numbering, Chapter 3.1.2 and Table 4,
  following Sunil's clarification.
- Link to v2: https://patch.msgid.link/20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com

Changes in v2:
- Correct the FFH specification reference to Chapter 2.1.1.2,
  Table 3, as suggested by Yixun.
- Link to v1: https://patch.msgid.link/20260728-riscv-acpi-lpi-timer-v1-1-c722bce01e48@linux.spacemit.com
---
 arch/riscv/include/asm/acpi.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 26ab37c171bc..f4db04f5bbe7 100644
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
+ * Chapter 3.1.2, Table 4: Arch. Context Lost Flags
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

