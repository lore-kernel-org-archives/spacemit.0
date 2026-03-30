Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C2C274B46
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864866; cv=none; b=B2nnKrkNY7gFPYdBM/SUx7QjxhJVtb39NxOE3U8kXTJdCe4XuKlkZ0hyE6557VpbwM4u3Bs6rtM4mluHwwmzyEFieRhQ7ZCXyxJ06VTSP1kZAGFFDgQC/2Jp3ArTKJkv/xUisOQqodwu6+5gGz9bSWzq3K4tnM40260FWpE26Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864866; c=relaxed/simple;
	bh=EUJQsnm486l+H6b0Z6VRAeD5tbOrL+rvpqyJzW0XFus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W+2nHwsOKc2ZyKOvdURbyQ/fM+M7heuNPRY602GVP/o+IGrhV7onmuhyMMuEqb1lT5H4M27WkmE++OKCD5PT1wZR65oaUCZ9wbpaWeofp9ypNBj6SUz1O8Cspz6Wnup6/bec1KVCSnfGA7/XnK95y2i+MZXA1VjXfxqaAExRTiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=BNkT2/58; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="BNkT2/58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774864748;
	bh=xj4JN/9EQzjiCXrEokRfqA2hGHPDxG/GX0nXcofrD5I=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=BNkT2/58daOeB+rjzYolq35IW/lF2gr+X9JdN6wALabywurfODKElATskSxO4ytSP
	 tkDO2hFFrPfVRTHL9oFJ3YbqGXlU0wJmvvUK7YnbJ2mTG1JbbMSCBJI8Zq/UqccRPe
	 nbrfRYF0Mzb+PJWIUlAJ2cceYDC8wVy24b3OeCFk=
X-QQ-mid: zesmtpgz8t1774864740t33e6c603
X-QQ-Originating-IP: BCda8jq6DPAm3ZfzAbSnMcHwGxjKRjGZGjnJwoDRAYk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 17:58:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11463941060989676982
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 30 Mar 2026 17:58:53 +0800
Subject: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNywrCMBCF4VeRrB3JtVVXvoe4SNKJHZAWJjEop
 e9ucNWlrg7/5juLyMiEWZx3i2CslGmeWpj9TsTRT3cEGloLLXUnjVJQe5DAUQFXGCgDTQUCppk
 RGHPxXMAFg057G6w6iQaNlMvM7+9HVW2uf3FVgYIQbRescSr6eHnQ9HwdBqzi1viqt2T/E6kbK
 THGo0sh9CltyXVdP33VWQMXAQAA
X-Change-ID: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.dev>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774864736; l=2941;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=X4sDXSviogdNNvGG5ErzZa5dJDLfstRYX6nniJzWXak=;
 b=uC6StRG89pkJqwItrW3uM/AV18FzGXVLpE3hQgVfqLZZYcRbix8vggs3eIl32DWUjiopZj92H
 7dsSFNTKoCQDz3f9ln4CttJmc3Bo5xfWE+tmr5c0Q/gRtm24FYcyEg/
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhQ9hXNievYaeuzkVpCWdHu6+BAd7bXHUDhnBmsgeZuBLD4ovlA8O6XI
	4jHsFWyFLTR8QrtCkALXz8dSYTV9Et/AeGsdUEiSMd6q9TKVfiA1REZExOuos13Opc2/aFZ
	+2CtxEn3U+gATWk1NBoKjIrSrXzsXJviRPJOPI9g1qwjAdHMjCevzFhvBZgowfpKqSdxn7y
	djD3r9N6gZ+MKbn1wLwU3TYyjRE9v7hvmvKPpCOVKzWxJ62nEVC0TGO2L+vmwgBGhYFtVOV
	oKJUNimzg01pG0mUOFIDAR+kSUld1NOW2rqnFQSrhVvR66D+/ylb6vXe5Lm4pF9vHA9ERP9
	7lsjHmH/L2X0Vs57Z9o9PpwXvXmOiC/JiiEKTc45OWvrrkPteYaLShDS9so9XorjIh86qx8
	BF+U3Dg0hNfcnXQmd/idsYMoW7b2Hev2gMb4Ko2XC56tFQ/NC72MQNku9J7tDgZ16T4m9L3
	NfFAb6PDRQzrpZuNrq0p6M0JUp/2d6l0cV/Le2ztulXCyolo3pI0dir1Tdr/Y/BFkSduDlj
	j4ak1S2V15MNifM58pPoKDK0ttek8jg2zSjP2bQu/Hmf7KfaGvmVtVr3Dr9u9nbfJOm05yU
	e8/ZtdDs4lf3OVni8Orx9giVsnFgM1T+pRhbJ6ifcgcFPCabKOdqJctbTorce7hWBBSUtpb
	Hi8ZzOGZbytke1gAtPbb7Q6hBQVfFBe6j6QUHuJxe4M8hIa6YhVAXb/2r4qcV1DUxWd7GAU
	cehn7lKRN7kpQNo3kzk+/rf+vSIppEFKMqCbDiyULddQE9uLyNTlBEAusMtjZCdrbzS8RuA
	ssOdVE2ZSWZxECMacEpv3zRcVImECsWC5CrxL5PqE1rGLLXQX9suaaX5CL5QofK83o1ogdc
	xL8Xi9tdujkRjblWTRjXnneLNjfTsFFVc85EEfDFdYaAKKxKdaaYacrzU6DgOL1ZMnHi3+E
	4tGrwNEV8BkeskuEp9/sIBggosiqhDrnmB/s1Xl9zNT1fghufcjayTn2V18dJZGc0XD45No
	ucxgChDO2WFc2ALmAaFS38L1SGoP/MZNcuqq2ZveASOo1dGA5TaRLv/vklbZmNZmDYJTaBP
	m5qijmklBm4LdkNFdJUGNiFE1QXEN5FQg0H++DoIAahsJjO/kdoi9GUTBNJ1BbEhw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Troy Mitchell <troy.mitchell@linux.dev>

Currently, the RISC-V implementation of machine_restart(), machine_halt(),
and machine_power_off() invokes the kernel teardown chains (e.g.,
do_kernel_restart()) with local interrupts enabled and other CPUs still
running.

This implementation fails to provide a deterministic execution environment
for registered handlers in the restart or power-off notifier chains. These
chains are intended to be executed in a strict atomic and single-threaded
context.

Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
the preempt_count. If local interrupts remain enabled, the environment
is not guaranteed to be atomic. This can lead to a context misidentification
within generic kernel teardown code, causing it to incorrectly enter
non-atomic paths (such as attempting to acquire sleeping locks), which
results in fatal "scheduling while atomic" splats or system hangs.

Additionally, stopping other CPUs ensures the primary CPU has exclusive
access to the hardware state during the final teardown phase, preventing
unpredictable interference from other active cores.

Align RISC-V with other major architectures by disabling local interrupts
and stopping other CPUs at the beginning of the shutdown sequences. This
guarantees the architectural expectations of the kernel's restart and
power-off handlers are met.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
---
Changes in v3:
- add Aurelien's tag
- Link to v2: https://lore.kernel.org/all/20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev/

Changes in v2:
- expand the fix to cover machine_halt() and machine_power_off() for
  architectural consistency.
- update commit message
- Link to v1: https://lore.kernel.org/r/20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev
---
 arch/riscv/kernel/reset.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 912288572226..8c48466c50e9 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -5,6 +5,7 @@
 
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
 
 static void default_power_off(void)
 {
@@ -17,18 +18,27 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_restart(cmd);
 	while (1);
 }
 
 void machine_halt(void)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_power_off();
 	default_power_off();
 }
 
 void machine_power_off(void)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_power_off();
 	default_power_off();
 }

---
base-commit: 31489a8c1e95cfa2039b7ec4abf124d1fdda31a6
change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

