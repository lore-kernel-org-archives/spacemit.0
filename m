Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585EA1D5CD1
	for <spacemit@lists.linux.dev>; Mon,  8 Jun 2026 01:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881684; cv=none; b=gmXKN2yyafTzD+a7Gn++w+do48Gy8EIHS3DslN+t/yZ8muf26NYlk0g5xl5fBAa8G99UsuhTiqIdkkCf+JnHwjrn0QH/+zE0jLol3qbvEbgB3rXMpdkJSQaY5ehXRZTpCmnfa3ZbSTGKHfXYzwO7PGx/TP2ewdVtLVic851xXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881684; c=relaxed/simple;
	bh=195QwlmraNwRwXBAofrP5QnBTZsirmlXkk9AtKSVyrE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nbu4ZezCbVIgwarAGu6JeY0GVcQA6xm2Uwb6RkL++ETdINjTpsV4OSyBaAJ8ovl+KPGkMy9PkEMVuRNXUD7llCqxGBihURADkYnhWi31Qp5XNqHU2yybqZOEgzqD3/79jkSbA/lb9g5x7Wx0enEiIFoMk7WNqR3i6GFpIFJbUSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cG082HsA; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cG082HsA"
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780881680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxEvUfH9QoMBWe5UKI9XOfbgGKkqlVzL0+nWkvvLnp0=;
	b=cG082HsAL/LltPk8sH5lS49pkSdIyH/gCKie6DiDgLYw5M+G1NAIviv4LSBHrFS+4WYdBK
	GThT9HEjxG9irElzwkn/MnlxqyDKA2QzyH05mAzPGYmifYY6+2CabcDCj+NvV5ODOCPJL8
	JPbdKe/Z6FcDKpqB3nyb8Ovjxg2CrhU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:21:01 +0800
Message-Id: <DJ39V0ZUPDG5.3UJO3VMV0J502@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Aurelien Jarno" <aurelien@aurel32.net>
Subject: Re: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
References: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com> <DI5M2DY419FY.7DUCXZDHR22V@linux.dev>
In-Reply-To: <DI5M2DY419FY.7DUCXZDHR22V@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 29, 2026 at 7:44 PM CST, Troy Mitchell wrote:
> Hi all,
>
> On Mon Mar 30, 2026 at 5:58 PM CST, Troy Mitchell wrote:
>> From: Troy Mitchell <troy.mitchell@linux.dev>
>>
>> Currently, the RISC-V implementation of machine_restart(), machine_halt(=
),
>> and machine_power_off() invokes the kernel teardown chains (e.g.,
>> do_kernel_restart()) with local interrupts enabled and other CPUs still
>> running.
>>
>> This implementation fails to provide a deterministic execution environme=
nt
>> for registered handlers in the restart or power-off notifier chains. The=
se
>> chains are intended to be executed in a strict atomic and single-threade=
d
>> context.
>>
>> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increme=
nt
>> the preempt_count. If local interrupts remain enabled, the environment
>> is not guaranteed to be atomic. This can lead to a context misidentifica=
tion
>> within generic kernel teardown code, causing it to incorrectly enter
>> non-atomic paths (such as attempting to acquire sleeping locks), which
>> results in fatal "scheduling while atomic" splats or system hangs.
>>
>> Additionally, stopping other CPUs ensures the primary CPU has exclusive
>> access to the hardware state during the final teardown phase, preventing
>> unpredictable interference from other active cores.
>>
>> Align RISC-V with other major architectures by disabling local interrupt=
s
>> and stopping other CPUs at the beginning of the shutdown sequences. This
>> guarantees the architectural expectations of the kernel's restart and
>> power-off handlers are met.
>>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Gentle ping on this patch. Is there anything I should change or any
> concerns with the approach?
Just a gentle ping on this series.=20

Please let me know if anyone has any feedback or if there is anything=20
I should update.

                                  - Troy
