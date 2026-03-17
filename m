Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF087347506
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733442; cv=none; b=RrqUUth6GrrS6ZPjBr4kpaVYayLkTUniQ68yNqdF/hIg42/r3NIQzuTMP4JB5OSx0bW/N5IHVOycZeJSAOgZ1icnrdech5GPwpUR7dkg4NUAETRTNHNsjvlWAQ8OF4nCKomViGT6k0BVJRZZhUpmF0OKiWUvkIDUn8SOdHYCQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733442; c=relaxed/simple;
	bh=5uCqIMEyGyMpvHdgGlibrzvD9xtN6n1a4luEJsDNOZg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=LgWFjoTgSC2KQVR56HSOWHpjNhN+GvlQl4/7m0xiPMw/Yww/7WDBNKzuZ8CAughjxNdj+Do4b4GhjH+9uCMxbyD5G9f6+WzhK0U6Q+JTLHqzmwFetXBVjzAI8cxfD4MB/N2Z1vNb5xAKizVrDxZmnfn9tlMnXEiwPaWdLxSX/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=none smtp.mailfrom=linux.spacemit.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
X-QQ-mid: esmtpsz10t1773733353t02284f6f
X-QQ-Originating-IP: 0p7OrIEXIc6/5mK53s8Mf6pDqVlYJYCnKyf1eSqth6M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Mar 2026 15:42:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8631632203164296220
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
Date: Tue, 17 Mar 2026 15:42:31 +0800
Message-Id: <DH4VZWOSTSIH.10276GPTK1HD1@linux.dev>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Samuel Holland" <samuel.holland@sifive.com>, "Troy Mitchell"
 <troy.mitchell@linux.dev>, "Vivian Wang" <wangruikang@iscas.ac.cn>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev> <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn> <DH40Z14EHV40.1I443BTRU720F@linux.dev> <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com> <DH4PODM2MN9W.V6082HZA6E18@linux.dev> <7e80356c-c937-4812-b237-184676a466c0@sifive.com>
In-Reply-To: <7e80356c-c937-4812-b237-184676a466c0@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M4lPCacZ9YlemkVGxZgsQDX0ZYmsyQ3xrlx5oQ78mVpvEeQBAgc3I0Kr
	RbmZsBRpNhw4qVG6kFS3BGsJ3KJVq1zIt8BDMUCusT1ZGds5lTLHSWReK2IDWSXbkfHRTUK
	QWa4MsNDKvxfBuA5y3NPmVlKo2kdQlGvzpnaLAx7H4OByCZg8/O6pZ/LKIOnaL6Yl7yZFdK
	lUobBJ1GDjkPQadN2Icq1+5KCJq04hPz7BqhJ2d41wLr0BxdKJB421GdDmz5lYJGYuBpxvX
	sux1GUJTKMWT+RU0+On19XkHM10njOkW5St74BPEYc0QrplJusSCwQ+o5R7CHCyIBbRRo/G
	BMdA0jf2p5+LIvZDzIRKJ7TA5k/HIUZ6cXorktC0/vGhqpIzsLDNYx2fLyV87FHOt1pLO5p
	rgKmODRgNlusE/cxxqB3xmIRvLNkTQBVzJTjEoIfEIOgx1wkaD3uD/J1EtaMq41gSMDFQpp
	qN4kddFHnIBjYmxhBepzWVQAGGDA+gQCCAGvIXdfcJF6MIdkgnJniEnDw+8OIZvXd2tCpGL
	mD9fuoV3NJaJ4AzMsC7uh1uArmFPzLFjiSs7QQx0jHtsV35X/cfw202l2Ky/KsJV/DS2WVs
	dNbpy8mtSnuAb8eH6snmbO3ujNXqlFus528HjUJus0DmShuc909Fv1x9tZOicK9l2hAsVl8
	PuddnAB/JVKj2Oq5v7pLM0gkaE+lhuJ4TIHdryY5Nf2scajSd+KkrqVvOFPBcE+FidPJwVg
	oh7rUYVl+0u9y2VcaMzb64kWAqWAIStFRutfIc4tR0q3XN2nyH5TmjGLfVTkuFmTLayV0oi
	MJsmqkk4DV8zYR936RN7HvXsVCpFD0KXNm+rY2ynDXar3Qggc4S0KNxJn2pvHk38WJGQuNu
	T/o4CfCvqW/j9nRROIKkYRICAvMuNGlIMA5egkusjrxRuuAmh5BvGsBJUILCqd4zuIQRjAt
	Gdl7bs1ERQgyD1/+de77EUtLlT+5nqCAD0wsWf+Kn73vxPB9Tkg/LQAwJwzCNx98syI9/h2
	ngWmh0eLVuyCOrxJ5l8BcH8veh8bWVnqeM8CBpCA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Hi Samuel,

On Tue Mar 17, 2026 at 12:07 PM CST, Samuel Holland wrote:
> On 2026-03-16 9:45 PM, Troy Mitchell wrote:
>> On Mon Mar 16, 2026 at 9:19 PM CST, Samuel Holland wrote:
>>> On 2026-03-16 2:23 AM, Troy Mitchell wrote:
>>>> On Thu Mar 12, 2026 at 11:05 AM CST, Vivian Wang wrote:
>>>>> On 3/11/26 10:51, Troy Mitchell wrote:
>>>>>> Currently, the RISC-V implementation of machine_restart() directly c=
alls
>>>>>> do_kernel_restart() without disabling local interrupts or stopping o=
ther
>>>>>> CPUs. This missing architectural setup causes fatal issues for syste=
ms
>>>>>> that rely on external peripherals (e.g., I2C PMICs) to execute the s=
ystem
>>>>>> restart when CONFIG_PREEMPT_RCU is enabled.
>>>>>>
>>>>>> When a restart handler relies on the I2C subsystem, the I2C core che=
cks
>>>>>> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfe=
r
>>>>>> or the polling atomic_xfer. This check evaluates to true if
>>>>>> (!preemptible() || irqs_disabled()).
>>>>>>
>>>>>> During do_kernel_restart(), the restart handlers are invoked via
>>>>>> atomic_notifier_call_chain(), which holds an RCU read lock.
>>>>>> The behavior diverges based on the preemption model:
>>>>>> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_l=
ock()
>>>>>>    implicitly disables preemption. preemptible() evaluates to false,=
 and
>>>>>>    the I2C core correctly routes to the atomic, polling transfer pat=
h.
>>>>>> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemp=
tion.
>>>>>>    Since machine_restart() left local interrupts enabled, irqs_disab=
led()
>>>>>>    is false, and preempt_count is 0. Consequently, preemptible() eva=
luates
>>>>>>    to true.
>>>>>>
>>>>>> As a result, the I2C core falsely assumes a sleepable context and ro=
utes
>>>>>> the transfer to the standard master_xfer path. This inevitably trigg=
ers a
>>>>>> schedule() call while holding the RCU read lock, resulting in a fata=
l splat:
>>>>>> "Voluntary context switch within RCU read-side critical section!" an=
d
>>>>>> a system hang.
>>>>>>
>>>>>> Align RISC-V with other major architectures (e.g., ARM64) by adding
>>>>>> local_irq_disable() and smp_send_stop() to machine_restart().
>>>>>> - local_irq_disable() guarantees a strict atomic context, forcing su=
b-
>>>>>>   systems like I2C to always fall back to polling mode.
>>>>>> - smp_send_stop() ensures exclusive hardware access by quiescing oth=
er
>>>>>>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>>>>>>   during the final restart phase.
>>>>>
>>>>> Maybe while we're at it, we can fix the other functions in this file =
as
>>>>> well?
>>>> Nice catch. I'll fix other functions in the next version.
>>>>>
>>>>> I think the reason we ended up with the "unsafe" implementations of t=
he
>>>>> reboot/shutdown functions is that on the backend it is usually SBI SR=
ST
>>>>> calls, which can protect itself from other CPUs and interrupts. Since=
 on
>>>>> K1 we're going to be poking I2C directly, we run into the problem
>>>>> described above. So all of these should disable interrupts and stop
>>>>> other CPUs before calling the handlers, and can't assume the handlers
>>>>> are all SBI SRST.
>>>> Yes, we cannot assume that all platforms rely on this.
>>>
>>> Why isn't K1 using the SBI SRST extension? Resetting the platform from =
S-mode
>>> directly causes problems if you ever want to run another supervisor dom=
ain (for
>>> example a TEE or EFI runtime services), which may need to clean up befo=
re a
>>> system reset.
>>>
>>> As you mention, other platforms use the standard SBI SRST interface, ev=
ent if
>>> they need to poke a PMIC to perform a system reset. Is there something
>>> preventing K1 from following this path?
>>=20
>> Ideally, yes, resetting the platform should be handled by the firmware (=
SBI SRST) to
>> properly tear down M-mode/TEE states before pulling the plug.
>>=20
>> However, for the K1 platform, while the SoC itself can be reset via SBI =
SRST, this warm
>> reset does not propagate to the external PMIC. For instance, if the kern=
el switches the
>> SD card to 1.8V signaling for high-speed mode during runtime, an SoC-onl=
y reset leaves
>> the PMIC still supplying 1.8V. Upon reboot, the bootrom/early kernel exp=
ects the SD card
>> to be in the default 3.3V state for initialization, which inevitably lea=
ds to a boot hang.
>
> Right, so you would need a driver in M-mode that performs a PMIC-level re=
set
> instead of a SoC-level reset when the SBI SRST function is called. Severa=
l
> platforms already do this.
Agreed. Porting the PMIC/I2C driver to M-mode (OpenSBI) is indeed the prope=
r
long-term solution for the K1 platform.
>
>> Setting the K1-specific hardware design aside, I believe this patch is f=
undamentally necessary
>> to fix a latent bug in the RISC-V Linux kernel itself, regardless of whe=
ther the final
>> reset is backed by SBI or not.
>>=20
>> The core issue here is the context in which do_kernel_restart() invokes =
the restart_handler_list.
>> It does so via an atomic_notifier_call_chain. If RISC-V enters this phas=
e without disabling local IRQs,
>> we are leaving a trap for any generic driver or kernel subsystem invoked=
 during this teardown phase.
>>=20
>> Under CONFIG_PREEMPT_RCU, the RCU read lock does not bump the preempt co=
unt.
>> Without local_irq_disable(), the preemptible() check will unexpectedly e=
valuate to true.
>>=20
>> A quick grep shows that preemptible() is widely relied upon by generic s=
ubsystems to
>> determine safe execution paths (~16 occurrences in kernel/ and ~11 in dr=
ivers/).
>> This means generic code implicitly trusts the architecture to set up the=
 correct
>> atomic context during a system restart.
>
> I agree with the conceptual issue, that do_kernel_restart() should be cal=
led
> from an atomic context, but may not be. But there seems to be no practica=
l
> problem if the first/only entry in restart_handler_list is sbi_srst_reboo=
t(),
> which is why we haven't seen problems on other platforms.
Yes, that perfectly explains why this missing atomic context has remained
hidden on most other platforms.

>
>> The I2C PMIC crash we encountered is just one symptom of this missing co=
ntext. If we don't
>> fix this at the architecture level, it leaves the door open for other un=
discovered panics.
>> Any driver (watchdog, display, network, etc.) that registers a restart h=
andler and internally
>> relies on preemptible() to choose between a sleepable or polling path wi=
ll inevitably trigger
>> a schedule(), attempt to acquire a sleeping lock (e.g., a mutex), or cal=
l other blocking functions
>> while holding the RCU read lock, resulting in a fatal splat.
>
> Are you possibly confusing restart_handler_list and reboot_notifier_list =
here? A
> display or network driver would not register a restart handler. And simil=
arly to
> the PMIC case, I would expect a platform that resets by watchdog to have =
a
> M-mode driver for it and still use the SBI SRST extension.
You are completely right, I mixed up `restart_handler_list` and
`reboot_notifier_list`. My apologies for the poor examples. Display and net=
work
drivers definitely use the notifiers. The actual restart handlers are mostl=
y
limited to watchdogs, PMICs, or specific reset controllers.

Thank you for pointing this out.
>
>> *Aligning machine_restart() with other architectures* by adding local_ir=
q_disable() and smp_send_stop()
>> ensures a deterministic, single-threaded atomic context.
>> This protects the Linux teardown sequence from SMP deadlocks and context=
 misidentification,
>> well before the control is ever handed over to the firmware or hardware.
>>=20
>> Does this perspective make sense?
>
> Yes, I'm not opposed to making this change, because it is conceptually th=
e right
> thing to do. I'm only questioning why you are in a position to notice thi=
s issue
> in the first place: you only see this because Linux is driving the PMIC d=
irectly
> instead of going through firmware.
Thanks for the ACK and the insightful review.

I will prepare and send out a v2 shortly.
Looking forward to your further review.

                    - Troy
