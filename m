Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254D2EC0B0
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654872; cv=none; b=bMb1DwJmsIAxmqbnq9V0dEqSdm5lxFEW4fyT7b1xTRXr0KGADxh3+jdsuL+IX0rFYQk8XvnvTuLZWgmDR1W1ZW5kKz0B7Vgztc37VP+aWzOgoyBQSgwMLvNQYOmraL5wetul93ldBMAYK/mUgHRZv5sl/cEF9Nwtqx3iim38T2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654872; c=relaxed/simple;
	bh=7SM2EAHGjgqjWU1VxeEbGe7dDDU/BMYHHcP2YMSEPDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzjZvX1gbTlQkHtTvh3kfPwBOe9WzjagNudG9I1WyWUICv59KpkLXToM0LV1bpTziNyvCOo0KxK2OOAtG9QoaRl2/JcKBw1frrD0rr1KB9gi7JgclFH/0s94gV6O8IdKaV/LnT7ej6PvtIbJfX3J+K091z+eHyKxOVm0l0BOz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [10.213.8.175] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHEkCQObtqt2QaCQ--.2375S2;
	Tue, 29 Sep 2026 12:07:44 +0800 (CST)
Message-ID: <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
Date: Tue, 29 Sep 2026 12:07:44 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
To: Aurelien Jarno <aurelien@aurel32.net>,
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <apSYF5x1Tu7PlyL1@aurel32.net> <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net> <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net> <arS-yYLK8Df5knSE@gmail.com>
 <arX7PwOnlz0N9rUc@aurel32.net> <arnt6EEacEm3YRIC@aurel32.net>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <arnt6EEacEm3YRIC@aurel32.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:rQCowAAHEkCQObtqt2QaCQ--.2375S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF43KrWDAF17KrWxXrW5Jrb_yoWxCF1xpa
	98CF4kGrWUGa1xWF9Fqw48Zrn5Jws5W345CrykGa4rWF13KrWfArn5Z34DCF4UXFyv9FyU
	CasYgrs5Aw43Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jFhFcUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 9/28/26 12:32, Aurelien Jarno wrote:
> Hi,
>
> On 2026-09-25 06:40, Aurelien Jarno wrote:
>
> [...]
>
> That said Han Gao pointed me to this patch:
> https://lore.kernel.org/linux-riscv/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com/
>
> I have been testing it, and so far it seems to fix my issue with both 
> CONFIG_RISCV_ISA_V_PREEMPTIVE enable and disabled. Or maybe it just 
> hides the issue by changing the timing, as at this point, I haven't 
> fully understood how the bug fixed by this patch can completely explain 
> my observations.

I don't know how that would cause what you have observed either, but it
does superficially appears to fix a real bug.

> Unfortunately, I have been able to reproduce the issue, even with this 
> patch applied. It just significantly reduces the frequency of the issue.
>
But this, I suppose, is still useful information that we just *might* be
on the right track.

Can you perhaps try this hacked together patch below and see if it does
anything? I just put guard(preempt)() or something around a bunch of
places I could find that access regs->status. It should apply to 7.1 and
7.2 as is. (The coding style is deliberately horrible to minimize diff
lines and discourage others from shipping it)

(This adds some more widely-scoped guards, and AFAICT /replaces/ the
above linked patch from Guobin Zhang.)

vvv DO NOT USE EXCEPT FOR TESTING vvv

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 04f10a949066..6486f9fe0ac5 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_SWITCH_TO_H
 #define _ASM_RISCV_SWITCH_TO_H
 
+#include <linux/cleanup.h>
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
 #include <linux/mm_types.h>
@@ -28,12 +29,14 @@ static inline void __fstate_clean(struct pt_regs *regs)
 static inline void fstate_off(struct task_struct *task,
 			      struct pt_regs *regs)
 {
+	guard(preempt)();
 	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
 }
 
 static inline void fstate_save(struct task_struct *task,
 			       struct pt_regs *regs)
 {
+	guard(preempt)();
 	if ((regs->status & SR_FS) == SR_FS_DIRTY) {
 		__fstate_save(task);
 		__fstate_clean(regs);
@@ -43,6 +46,7 @@ static inline void fstate_save(struct task_struct *task,
 static inline void fstate_restore(struct task_struct *task,
 				  struct pt_regs *regs)
 {
+	guard(preempt)();
 	if ((regs->status & SR_FS) != SR_FS_OFF) {
 		__fstate_restore(task);
 		__fstate_clean(regs);
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a77208..30fc51713542 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -97,11 +97,13 @@ static inline void __riscv_v_vstate_dirty(struct pt_regs *regs)
 
 static inline void riscv_v_vstate_off(struct pt_regs *regs)
 {
+	guard(preempt)();
 	regs->status = __riscv_v_vstate_or(regs->status, OFF);
 }
 
 static inline void riscv_v_vstate_on(struct pt_regs *regs)
 {
+	guard(preempt)();
 	regs->status = __riscv_v_vstate_or(regs->status, INITIAL);
 }
 
@@ -302,6 +304,7 @@ static inline void __riscv_v_vstate_discard(void)
 
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
+	guard(preempt)();
 	if (riscv_v_vstate_query(regs)) {
 		__riscv_v_vstate_discard();
 		__riscv_v_vstate_dirty(regs);
@@ -311,6 +314,7 @@ static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
+	guard(preempt)();
 	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
 		__riscv_v_vstate_save(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
@@ -320,6 +324,7 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
+	guard(preempt)();
 	if (riscv_v_vstate_query(regs)) {
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
@@ -329,6 +334,7 @@ static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 					      struct pt_regs *regs)
 {
+	guard(preempt)();
 	if (riscv_v_vstate_query(regs)) {
 		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
 		riscv_v_vstate_on(regs);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..45963c7baebe 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -144,6 +144,7 @@ early_initcall(compat_mode_detect);
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
+	guard(preempt)();
 	regs->status = SR_PIE;
 	if (has_fpu()) {
 		regs->status |= SR_FS_INITIAL;
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..623cc35d567c 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/cleanup.h>
 #include <linux/compat.h>
 #include <linux/signal.h>
 #include <linux/uaccess.h>
@@ -76,6 +77,7 @@ static long save_v_state(struct pt_regs *regs, void __user *sc_vec)
 	void __user *datap;
 	long err;
 
+	scoped_guard(preempt)
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_V) ||
 	    !((has_vector() || has_xtheadvector()) &&
 	    riscv_v_vstate_query(regs)))
@@ -287,6 +289,7 @@ static size_t get_rt_frame_size(bool cal_all)
 	frame_size = sizeof(*frame);
 
 	if (has_vector() || has_xtheadvector()) {
+		scoped_guard(preempt)
 		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
 			total_context_size += riscv_v_sc_size;
 	}
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9..27078b70b65b 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 SiFive
  * Author: Andy Chiu <andy.chiu@sifive.com>
  */
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/sched/signal.h>
 #include <linux/types.h>
@@ -194,6 +195,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	if (!riscv_v_vstate_ctrl_user_allowed())
 		return false;
 
+	scoped_guard(preempt)
 	/* If V has been enabled then it is not the first-use trap */
 	if (riscv_v_vstate_query(regs))
 		return false;

^^^ DO NOT USE EXCEPT FOR TESTING ^^^

