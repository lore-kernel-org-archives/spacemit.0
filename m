Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.77.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC41199949
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 02:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.77.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773715637; cv=none; b=Kf6bJkfR0D+f3kfgRyha4yMXFd78JAYWcsb5z+XQetgppG9fbSVeLm1SQtqKGVPb9vcTRhjNg8xEfoF24iTAmeBt9KSNoRD7IkdwOQoDIt8yM/RSbt0tVq+d5PajILT40Vu48b26gJXm7cxdqMBGIpAmnlLNfSYfFii3IYX2r7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773715637; c=relaxed/simple;
	bh=+RbazFKI7RM4TVObBqvswd6Yl1ghsMv0NGI1R4PnyaU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=U1sGCXLS4+qnxdnAbxM8RuAkz0n23YcGJTo9Ucl5O/i3j2ft9TPfF6KTX4aVa/FhezKd19Ra5VqXaVAUBzBUG5AbefrH95Cs8EXxqOWCtft4sWYraHM7UBGDBwSOTaUKJ5z9XQUQPCkyIW/TqsYx2luaLdo9ERa3FXmNSMgUKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=none smtp.mailfrom=linux.spacemit.com; arc=none smtp.client-ip=114.132.77.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
X-QQ-mid: zesmtpsz9t1773715523t4ae20d3d
X-QQ-Originating-IP: 2h42IC1ek+5dvQXwfLBVyYcnusnH3Nyf0LxkdkbHyV0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Mar 2026 10:45:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4810139380364614713
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Sender: troy.mitchell@linux.spacemit.com
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 10:45:21 +0800
Message-Id: <DH4PODM2MN9W.V6082HZA6E18@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Samuel Holland" <samuel.holland@sifive.com>, "Troy Mitchell"
 <troy.mitchell@linux.dev>, "Vivian Wang" <wangruikang@iscas.ac.cn>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev> <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn> <DH40Z14EHV40.1I443BTRU720F@linux.dev> <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
In-Reply-To: <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: No6BRNJhcpN0UX6OEnuJKhkIKXUwxWIZH4DTyp12UVRBbxWlqB7rjqU2
	G8FUARRYwrpwNuudNoWAluIz+Vs3l64HXkIN0t7E2L5hhmB2jVbn0zuMqt8SSNzGByAdAZY
	WlR123dCpvQ5Xbzxj/u8e3IzzDOtQI6nULXEsYj6Jn1JPbL6VbTBVkje4l44d3JZSP12i2h
	sgO7QJOgnH+lzBBFLSGho/h83qv3IbLxiohOoTzJbQGHG1x8XSFkb+IRAouujecQL5vbS1K
	V5hM+DwMxNmhAXfx2iZej2kPmJqvDBoWqeMJzfi2ubr7fMfSaBQr+Zo6I0NRtiX0cFXPq9y
	d4EGwh8IqIaLF4ER/CZSLIqD5ItSdU5V0FYT7weWFe1eliK9YHPf1jLiglal3m4C/IdaWW+
	HYLsLKHEVxxG+Q/oze3DVRtUdMSvuQ5g2oxYu0tNndVSSGNd3gpANdQ+uxQQ4OAfp7srszA
	uLDqj4YL3+kIX0vl/O9P5URyWlAzJaUF8DDJewbunDrlnB8NzIn55wxpHz8XZ1xVBE+imCm
	SEFI5mcHoulghMxQPkioG62TeqCE5DtIAcdU+IAQq6jN6nD3qz8aI2UGuHw9UEOdnnp2KF+
	nRej0aJbO5uxpZRvT9ZcWD/MLliYZho72Ztc5CPo8wAJFgwTr0FR0vUHRyjjaqRfmazNiTw
	qnovwrxUiKJIhnf+LctDUQnrShiHM5PbxncXcbaTSKXabbDwCc0ve0sSpF+mFjD68W5nioR
	/kClzt7LsaPZNuvi/5GCA1rEIwMS1HFrp6nWn8FpFSV70vgYJfGTYNlLxsl/CeXGoELS5WP
	GYdLPM5qaMDn8/YMWIICHN+Pkb0yLMctvuZTOpHdhoob0sP0JrddPUIcFQDQD/QojOYxDj9
	jO/lvjU7xlwVLQv/fd7J0Vi9h5mTy5BKlsj9tKB4ceFmwJoi0J9ybkRa35WnwJdgNl14b7J
	1DzBJnzGonqzQTxGhogqBEXAIgeCzpHuKry6gItspV8GLq6NA/oXhR7aLG8XnSgv7cN/D6J
	UWeYJ+2g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On Mon Mar 16, 2026 at 9:19 PM CST, Samuel Holland wrote:
Hi Samuel,
> Hi Troy,
>
> On 2026-03-16 2:23 AM, Troy Mitchell wrote:
>> On Thu Mar 12, 2026 at 11:05 AM CST, Vivian Wang wrote:
>>> On 3/11/26 10:51, Troy Mitchell wrote:
>>>> Currently, the RISC-V implementation of machine_restart() directly cal=
ls
>>>> do_kernel_restart() without disabling local interrupts or stopping oth=
er
>>>> CPUs. This missing architectural setup causes fatal issues for systems
>>>> that rely on external peripherals (e.g., I2C PMICs) to execute the sys=
tem
>>>> restart when CONFIG_PREEMPT_RCU is enabled.
>>>>
>>>> When a restart handler relies on the I2C subsystem, the I2C core check=
s
>>>> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
>>>> or the polling atomic_xfer. This check evaluates to true if
>>>> (!preemptible() || irqs_disabled()).
>>>>
>>>> During do_kernel_restart(), the restart handlers are invoked via
>>>> atomic_notifier_call_chain(), which holds an RCU read lock.
>>>> The behavior diverges based on the preemption model:
>>>> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_loc=
k()
>>>>    implicitly disables preemption. preemptible() evaluates to false, a=
nd
>>>>    the I2C core correctly routes to the atomic, polling transfer path.
>>>> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preempti=
on.
>>>>    Since machine_restart() left local interrupts enabled, irqs_disable=
d()
>>>>    is false, and preempt_count is 0. Consequently, preemptible() evalu=
ates
>>>>    to true.
>>>>
>>>> As a result, the I2C core falsely assumes a sleepable context and rout=
es
>>>> the transfer to the standard master_xfer path. This inevitably trigger=
s a
>>>> schedule() call while holding the RCU read lock, resulting in a fatal =
splat:
>>>> "Voluntary context switch within RCU read-side critical section!" and
>>>> a system hang.
>>>>
>>>> Align RISC-V with other major architectures (e.g., ARM64) by adding
>>>> local_irq_disable() and smp_send_stop() to machine_restart().
>>>> - local_irq_disable() guarantees a strict atomic context, forcing sub-
>>>>   systems like I2C to always fall back to polling mode.
>>>> - smp_send_stop() ensures exclusive hardware access by quiescing other
>>>>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>>>>   during the final restart phase.
>>>
>>> Maybe while we're at it, we can fix the other functions in this file as
>>> well?
>> Nice catch. I'll fix other functions in the next version.
>>>
>>> I think the reason we ended up with the "unsafe" implementations of the
>>> reboot/shutdown functions is that on the backend it is usually SBI SRST
>>> calls, which can protect itself from other CPUs and interrupts. Since o=
n
>>> K1 we're going to be poking I2C directly, we run into the problem
>>> described above. So all of these should disable interrupts and stop
>>> other CPUs before calling the handlers, and can't assume the handlers
>>> are all SBI SRST.
>> Yes, we cannot assume that all platforms rely on this.
>
> Why isn't K1 using the SBI SRST extension? Resetting the platform from S-=
mode
> directly causes problems if you ever want to run another supervisor domai=
n (for
> example a TEE or EFI runtime services), which may need to clean up before=
 a
> system reset.
>
> As you mention, other platforms use the standard SBI SRST interface, even=
t if
> they need to poke a PMIC to perform a system reset. Is there something
> preventing K1 from following this path?

Ideally, yes, resetting the platform should be handled by the firmware (SBI=
 SRST) to
properly tear down M-mode/TEE states before pulling the plug.

However, for the K1 platform, while the SoC itself can be reset via SBI SRS=
T, this warm
reset does not propagate to the external PMIC. For instance, if the kernel =
switches the
SD card to 1.8V signaling for high-speed mode during runtime, an SoC-only r=
eset leaves
the PMIC still supplying 1.8V. Upon reboot, the bootrom/early kernel expect=
s the SD card
to be in the default 3.3V state for initialization, which inevitably leads =
to a boot hang.

Setting the K1-specific hardware design aside, I believe this patch is fund=
amentally necessary
to fix a latent bug in the RISC-V Linux kernel itself, regardless of whethe=
r the final
reset is backed by SBI or not.

The core issue here is the context in which do_kernel_restart() invokes the=
 restart_handler_list.
It does so via an atomic_notifier_call_chain. If RISC-V enters this phase w=
ithout disabling local IRQs,
we are leaving a trap for any generic driver or kernel subsystem invoked du=
ring this teardown phase.

Under CONFIG_PREEMPT_RCU, the RCU read lock does not bump the preempt count=
.
Without local_irq_disable(), the preemptible() check will unexpectedly eval=
uate to true.

A quick grep shows that preemptible() is widely relied upon by generic subs=
ystems to
determine safe execution paths (~16 occurrences in kernel/ and ~11 in drive=
rs/).
This means generic code implicitly trusts the architecture to set up the co=
rrect
atomic context during a system restart.

The I2C PMIC crash we encountered is just one symptom of this missing conte=
xt. If we don't
fix this at the architecture level, it leaves the door open for other undis=
covered panics.
Any driver (watchdog, display, network, etc.) that registers a restart hand=
ler and internally
relies on preemptible() to choose between a sleepable or polling path will =
inevitably trigger
a schedule(), attempt to acquire a sleeping lock (e.g., a mutex), or call o=
ther blocking functions
while holding the RCU read lock, resulting in a fatal splat.

*Aligning machine_restart() with other architectures* by adding local_irq_d=
isable() and smp_send_stop()
ensures a deterministic, single-threaded atomic context.
This protects the Linux teardown sequence from SMP deadlocks and context mi=
sidentification,
well before the control is ever handed over to the firmware or hardware.

Does this perspective make sense?

                      - Troy
>
> Regards,
> Samuel

