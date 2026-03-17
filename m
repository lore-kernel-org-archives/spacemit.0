Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F039C65E
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737374; cv=none; b=DDKbOkF1ZHjeGmDaOe2tSjhpOr1EHxrc/jLYlY1G1bLlk2Z1Wesmz1cRrGE3yRSE5pY5XbPKJszdM5WixnbONUik9JPXrvgaWy46fUpSTxLXU6XEo2+bML+PY5t1f5zWl+MefPum92qYM3P0ImEAYT0onh4iWbOIdHqVdER8Iu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737374; c=relaxed/simple;
	bh=9UuB2mxrWb99JhNS2nCV7XUSiYTNEQ1fUoH09J11oiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N8de2ZTgUAifYJwgSPyOO3A558rZ7chj/W0klVC7p8OFpVYweLOuG5NM+2Isp/xqc2bq1WdNx+FSxqgQClrURO1x6MrnJr+aNV8P6MVS0D/B43czTUEbOxB7eYjHhySvOaqjuAT43SOnwXef5NtID9B+irfP8mJ9EbeWb1ZC/S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=none smtp.mailfrom=linux.spacemit.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
X-QQ-mid: esmtpgz10t1773737295ta347157a
X-QQ-Originating-IP: BCSFo/f2lL2ttwAP9G71tVRnNucTKFyKwqyTYjZFQiY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Mar 2026 16:48:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14524113417459469981
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Sender: troy.mitchell@linux.spacemit.com
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 17 Mar 2026 16:48:06 +0800
Subject: [PATCH v2] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNQQrCMBAAv1L27Eo3SSt66j/EQ5KudkFS2MSgl
 P7d4A88DXOZ2SCzCme4dBsoV8mypibm0EFcfHowytwcTG/G3hJhPWGPGgm14iwZJRUMfF+VUTk
 XrwWHYHkw3gVHZ2ihRXJZ9fN7VGq4/pWrhIQhujE4O1D0cXpKer2PM1e47fv+BX3v6QzEAAAA
X-Change-ID: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773737293; l=2726;
 i=troy.mitchell@linux.dev; s=20250710; h=from:subject:message-id;
 bh=9UuB2mxrWb99JhNS2nCV7XUSiYTNEQ1fUoH09J11oiM=;
 b=x/UqHlFAH4JrKqYp5htSeYsgZLml4FYOynp8/UzI8w4Q3pulvLLTKwOoJrFpTt6+1etYEW9xt
 pi+bwUVQ5KuC4sjTnL0dsOqp8F8jTxAl1Ck6zI12v0Brzbu/JRdWopv
X-Developer-Key: i=troy.mitchell@linux.dev; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NVS2jg7zJdeMPqjrOR8Sl9OQwer/4dyjJWWxk0NS59YMhyXNrXgqnlNh
	c1PzKM8rcu0VkO4u2lkl+2WtJgTy9ckaSDUDAAYXVh3hfnWg2riZ9ffLl84Is6119OGQh1e
	LEm9E/zRxqK3PiLBTXFkwz5xK8OYc+b15q1GSbyE2ukRInnOKJXOjWIbARAvfO4Tss9QGVa
	6TeNuPwkggBgpP1Ysz/llsIqNt5NQOkBVZ+LbJXutLhJMvynZpjgWNVYM7V4UqF20OCCpsk
	7ni6zK/sn6dZmaARu+nK41pLszfTG4FD/zgCZqBHQpTco25gINJ3xTlQrf6c2Gj+W8/LT2i
	MLBqYi2OKDmE+4/y9evP9HaNZKgmgnY0YtzHX5lb515S8ragKLuFfHUdzupj5dPuIE/bUV1
	qaYDchxij3Mmx4j00hDegIzs9IFaNxhaWHegM/s+QY0lMyQnPKOQUJf5NSLRSAh31dgXsmP
	O7TIbbxgouqmxKOGOCEtpv/PQGhmQeju9ax/S+HzQr/F/irtiaEPkhleE8AvAHfkWAX5rjp
	Ik9scCwN/BgSrCy4PoncqqMSPmSpDf03B4g/BRjPo8dP4rjQikeO32GfAC8mANV/CTwN7OC
	6kuf5NjRml+ioRZh3EaTHTVcJsjTqireINq3fkhy8XyuUo7fMgKpesXRLZadfUalU5YLnnw
	dGg0lkJoLPIzPcvcJfNi7unzFEDgsw+DvAIzGQFKwcLMoyUWRUpo0ErT43I1ek8EhJkA1Q6
	rjltSbbs//qoGDPx/JcQBIsfYw/9IeFhTIRsCzixVbC3Dq3DdruC79tZ9jXJeTteDPzmM8X
	/Z9mfhKVBidX4ksjzIGdo5h7u1Let5J/G14rqOgMFXGJcVP4OTxvLEvJkJfSwLQXj0RdPwM
	iY/JJXPKTvSdRRjN2oHSzd7tEFb7+DTDzdCJYLVeCrPQI8QTcCIFU90roLHeq91fe+hvsbm
	u/tXW8lGmVv+xiCwyoAbWTWbatKIDNsEGlJKfyPEjBGyN4sh3+rrb9NhT9v5WNbkSgJjtu/
	SkFJxOzuGB7BeDQOF0GKZ8n4czcJ5SdF3OBqbkFWSWh3ywSKr6saAUgfqW/xIr/LNOKjyVh
	I/g8GaWwpJKWsMhVsA1pgRVP+hhC/UMR+uqXLk8VzIsXgsKpKMIrFH01kvIGEb68bJ0Y/Xv
	8RoO
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

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
---
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
Troy Mitchell <troy.mitchell@linux.dev>

