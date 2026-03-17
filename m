Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF135AC12
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 04:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773720449; cv=none; b=GQbUYMhhrCwcUIz4duZk1scNuq/gUuLhCSBiscoeJQkzSjrsLT2JJC/oNKR9j0pBb8nP7X+oKFNESK5TjFNzs7Swu/m8ZVEAmomZDJFMw6s+JBc++3UULL/Uf2BCjZIOz3S5+uGTkqsg8d3kv9v+8UNINxZPuw+mv/QukvvUHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773720449; c=relaxed/simple;
	bh=KyavI40P/48eU6ukjleNfTVlV56WVZAQ5SlnRIaJGTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjzqBAkQOxIZsbGJ7oGplfL40InA7Lf5xfG1hmGsby/Lcw1UFeb0sVw576/A26Z2P/wh5UlkpM2UdH37B9fUegkc/O2ZY8AA9NfoU6OBknkMCRf3ruEAUN7mP1UDrwvRS7GvC275s8LYCuUiXY2vsxTI1J4kjgxmVZy3c2QXK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=D8CcFgnp; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="D8CcFgnp"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a51edef1fso5552457b3.1
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 21:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773720442; x=1774325242; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2lbkkOnh5kD4/iRbY3xB5zIUuMihZJpMrLdKKWvnVCg=;
        b=D8CcFgnpg4V4PIwVbdcgfh7Fk4J9fsbtwHs2qUW7C0hyAmBL5WzwtrbzKB2yP+5c9l
         2qRo6FxhTetTQT51jawF+vQ0OKe5DHBxSSMdJA7ZvYPzKrTpLixnrwAnX3ehouZSsP5G
         XS81QHa7pQLLrMTXjHbjkmA8E5mcLTeFrs4VPQFY/I88b9LRJoribUc8WiBFOB0XTNnx
         80USIuaR56KJ6NTnQAY0n+jaON82Juhrv3qjyqqvWHJt58n1/xFZT98wgIVJNxAX0nVt
         LRUmqGWvw27VaA060VichEkuTIL0VpO1ISTUkw4up07d7AQfqCuYUwK+60jXSSWSloeU
         PxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773720442; x=1774325242;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lbkkOnh5kD4/iRbY3xB5zIUuMihZJpMrLdKKWvnVCg=;
        b=CxqYVuXzVRKtFcj1sCu+nXqtTNf3er7ABNVKOvxMB+vIrxTCHhxWLEn3jK2lNJsW6I
         quoUz8p/ioJXKgAxiABiMfRgUL5Cb+kHyrVHIFIPygUdw/IA1ankF1cpdOhS3BiEqIBR
         cVxx3VSCG98hc940IO0Vc5ZXRRxa/Dd8RTHpOWV9oeFijkcfN/BTOs/4j1A2wFnMVB/K
         dPoWl0TwmELudKy3qotz4w8bTgPnAfQk9g22IHzvvW9PqzSPMpxHoPdnvJzMej2Fjv35
         OiN+eGLBq1okrbbte+5xK0k3sBi25unTsh1vsPNzeI2GlE4Yl5pNFBEpYq8JHwT+j2By
         yuIA==
X-Forwarded-Encrypted: i=1; AJvYcCUjoIdpDlGz+Hhd4cBQY550okbd3XtWISjjDlROo9Mrp0z95fkrNdVW5U9fv77BUsjdEXYQ8f7WAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+uIoSRz3pOTQYW/7/RAWvnT94i2j//VlRnoayWDmSq9RY/Yqy
	RJynWNDvlZMaqwwDy/RAfD0vKNgTh6BoSmXBu3wyYLP29R4ie4NOtq/v8dIcc786+jU=
X-Gm-Gg: ATEYQzwM5MNSOiPiXAvvAe8XjUXHugvOXaZmdp4vZK1Flru3XBrYhN7Kw8V5L4nyEs9
	UempPsF9Oj8Tqywy3vBmeQqeu31mX/44HcC9dWE1P4JliTIwCImnoOsVVvzXG8JIh5k9qgPlxxb
	fUa7sHwigU7gdKqURJ6S/xxd8VNFQvTVX47YcgAK17LCNU2QAC1fscl6oUYSEGMGQvry0RTH9+P
	NvJBzVZmJJcEN9SOWxeih7jALbesmHsfhR+NoqwZfpd0/2tRoPNFFdYVgYWZr4EJlC+WMzhPAax
	e0FGW449E/7wh2fXNf85H4i3+ynjsEPeDrelCU4Udg7shyi2S4KuV4aP/uiwUSTSyn8ugTpZF8g
	DnFj3tJmr3gp219DY0tAr3CUzGRzrgo7JzrPTDCEuje0mNjpS2Ru5/SKxsTiM2RzYqFLSycSokm
	tAxkmrxo6QK5ZwklR3pQV895/K9KfY6pi/OCnWQ2AIF908k/A8EG8=
X-Received: by 2002:a05:690c:e34b:b0:79a:55d3:657f with SMTP id 00721157ae682-79a618870b9mr17106927b3.16.1773720441621;
        Mon, 16 Mar 2026 21:07:21 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f0a0ebsm96045627b3.37.2026.03.16.21.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 21:07:21 -0700 (PDT)
Message-ID: <7e80356c-c937-4812-b237-184676a466c0@sifive.com>
Date: Mon, 16 Mar 2026 23:07:20 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
To: Troy Mitchell <troy.mitchell@linux.dev>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
 <DH40Z14EHV40.1I443BTRU720F@linux.dev>
 <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
 <DH4PODM2MN9W.V6082HZA6E18@linux.dev>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <DH4PODM2MN9W.V6082HZA6E18@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Troy,

On 2026-03-16 9:45 PM, Troy Mitchell wrote:
> On Mon Mar 16, 2026 at 9:19 PM CST, Samuel Holland wrote:
>> On 2026-03-16 2:23 AM, Troy Mitchell wrote:
>>> On Thu Mar 12, 2026 at 11:05 AM CST, Vivian Wang wrote:
>>>> On 3/11/26 10:51, Troy Mitchell wrote:
>>>>> Currently, the RISC-V implementation of machine_restart() directly calls
>>>>> do_kernel_restart() without disabling local interrupts or stopping other
>>>>> CPUs. This missing architectural setup causes fatal issues for systems
>>>>> that rely on external peripherals (e.g., I2C PMICs) to execute the system
>>>>> restart when CONFIG_PREEMPT_RCU is enabled.
>>>>>
>>>>> When a restart handler relies on the I2C subsystem, the I2C core checks
>>>>> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
>>>>> or the polling atomic_xfer. This check evaluates to true if
>>>>> (!preemptible() || irqs_disabled()).
>>>>>
>>>>> During do_kernel_restart(), the restart handlers are invoked via
>>>>> atomic_notifier_call_chain(), which holds an RCU read lock.
>>>>> The behavior diverges based on the preemption model:
>>>>> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_lock()
>>>>>    implicitly disables preemption. preemptible() evaluates to false, and
>>>>>    the I2C core correctly routes to the atomic, polling transfer path.
>>>>> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemption.
>>>>>    Since machine_restart() left local interrupts enabled, irqs_disabled()
>>>>>    is false, and preempt_count is 0. Consequently, preemptible() evaluates
>>>>>    to true.
>>>>>
>>>>> As a result, the I2C core falsely assumes a sleepable context and routes
>>>>> the transfer to the standard master_xfer path. This inevitably triggers a
>>>>> schedule() call while holding the RCU read lock, resulting in a fatal splat:
>>>>> "Voluntary context switch within RCU read-side critical section!" and
>>>>> a system hang.
>>>>>
>>>>> Align RISC-V with other major architectures (e.g., ARM64) by adding
>>>>> local_irq_disable() and smp_send_stop() to machine_restart().
>>>>> - local_irq_disable() guarantees a strict atomic context, forcing sub-
>>>>>   systems like I2C to always fall back to polling mode.
>>>>> - smp_send_stop() ensures exclusive hardware access by quiescing other
>>>>>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>>>>>   during the final restart phase.
>>>>
>>>> Maybe while we're at it, we can fix the other functions in this file as
>>>> well?
>>> Nice catch. I'll fix other functions in the next version.
>>>>
>>>> I think the reason we ended up with the "unsafe" implementations of the
>>>> reboot/shutdown functions is that on the backend it is usually SBI SRST
>>>> calls, which can protect itself from other CPUs and interrupts. Since on
>>>> K1 we're going to be poking I2C directly, we run into the problem
>>>> described above. So all of these should disable interrupts and stop
>>>> other CPUs before calling the handlers, and can't assume the handlers
>>>> are all SBI SRST.
>>> Yes, we cannot assume that all platforms rely on this.
>>
>> Why isn't K1 using the SBI SRST extension? Resetting the platform from S-mode
>> directly causes problems if you ever want to run another supervisor domain (for
>> example a TEE or EFI runtime services), which may need to clean up before a
>> system reset.
>>
>> As you mention, other platforms use the standard SBI SRST interface, event if
>> they need to poke a PMIC to perform a system reset. Is there something
>> preventing K1 from following this path?
> 
> Ideally, yes, resetting the platform should be handled by the firmware (SBI SRST) to
> properly tear down M-mode/TEE states before pulling the plug.
> 
> However, for the K1 platform, while the SoC itself can be reset via SBI SRST, this warm
> reset does not propagate to the external PMIC. For instance, if the kernel switches the
> SD card to 1.8V signaling for high-speed mode during runtime, an SoC-only reset leaves
> the PMIC still supplying 1.8V. Upon reboot, the bootrom/early kernel expects the SD card
> to be in the default 3.3V state for initialization, which inevitably leads to a boot hang.

Right, so you would need a driver in M-mode that performs a PMIC-level reset
instead of a SoC-level reset when the SBI SRST function is called. Several
platforms already do this.

> Setting the K1-specific hardware design aside, I believe this patch is fundamentally necessary
> to fix a latent bug in the RISC-V Linux kernel itself, regardless of whether the final
> reset is backed by SBI or not.
> 
> The core issue here is the context in which do_kernel_restart() invokes the restart_handler_list.
> It does so via an atomic_notifier_call_chain. If RISC-V enters this phase without disabling local IRQs,
> we are leaving a trap for any generic driver or kernel subsystem invoked during this teardown phase.
> 
> Under CONFIG_PREEMPT_RCU, the RCU read lock does not bump the preempt count.
> Without local_irq_disable(), the preemptible() check will unexpectedly evaluate to true.
> 
> A quick grep shows that preemptible() is widely relied upon by generic subsystems to
> determine safe execution paths (~16 occurrences in kernel/ and ~11 in drivers/).
> This means generic code implicitly trusts the architecture to set up the correct
> atomic context during a system restart.

I agree with the conceptual issue, that do_kernel_restart() should be called
from an atomic context, but may not be. But there seems to be no practical
problem if the first/only entry in restart_handler_list is sbi_srst_reboot(),
which is why we haven't seen problems on other platforms.

> The I2C PMIC crash we encountered is just one symptom of this missing context. If we don't
> fix this at the architecture level, it leaves the door open for other undiscovered panics.
> Any driver (watchdog, display, network, etc.) that registers a restart handler and internally
> relies on preemptible() to choose between a sleepable or polling path will inevitably trigger
> a schedule(), attempt to acquire a sleeping lock (e.g., a mutex), or call other blocking functions
> while holding the RCU read lock, resulting in a fatal splat.

Are you possibly confusing restart_handler_list and reboot_notifier_list here? A
display or network driver would not register a restart handler. And similarly to
the PMIC case, I would expect a platform that resets by watchdog to have a
M-mode driver for it and still use the SBI SRST extension.

> *Aligning machine_restart() with other architectures* by adding local_irq_disable() and smp_send_stop()
> ensures a deterministic, single-threaded atomic context.
> This protects the Linux teardown sequence from SMP deadlocks and context misidentification,
> well before the control is ever handed over to the firmware or hardware.
> 
> Does this perspective make sense?

Yes, I'm not opposed to making this change, because it is conceptually the right
thing to do. I'm only questioning why you are in a position to notice this issue
in the first place: you only see this because Linux is driving the PMIC directly
instead of going through firmware.

Regards,
Samuel

