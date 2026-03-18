Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B52C3260;
	Wed, 18 Mar 2026 20:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773865148; cv=none; b=G//xW2NRVcl4kWwOJ7Tj7BDsGAdZ4AG1QvKDt0P5CbgFh0IX3YR/6/783Hw9K9dzj6H8QaS1Mg172GGN8n3kCVrrB032h7vBY0R8Ulcgaxq6qxuHijGTYUrb9RzWEjhgUimK+8iAHeqCFCAFeEWJU1qVs5yNS+5o9MShylr071g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773865148; c=relaxed/simple;
	bh=EO3wSRBu5SqnfI6b5Vu5ucbO5N4qU/ypzS1wIJ1cvwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOpMHLiezXLkl6wfZu8LewhoT/aqokNxF9JhgvGczGTavBZJTTGTvzDVhpXHcducRS7k2d7VtHVJ4ul8qladFtuWhgfw5aLPKiDYlqrisR9IvCyDUZnXsL7k1lPohBgQK3m5x1lwjDgUme8oANegvoI49/GRivKzfZTWlQE/RUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=vEHWcxnc; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="vEHWcxnc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=LdG7Sm2ptAX6UD2HdakCYLcb1OHihIX1Cvex0rU/AzQ=; b=vEHWcxncGlGcDZ2E2SyOFxqoah
	2WmJFbz3N8WKv/AokAOdGDTSiTQabVDPNE8RT1b+jLassaXtmMF/TU+zMr0DDbsIa28VikweVyfDy
	3puPxOdf93Lo0fTxixjeKGbyMQIxouBO9nwJCjGP07EdShAyA06FV0hSQKU0DdGThsyNKQ38tDNlf
	k6nCQGcjvfMF0WNNGn9kPZyMUoHiGytt6/QelGiA3/y8dLQ21BYZZPq7KBIO/QduaZ+PihHuxjODT
	oSYHQbEmn8wgXQD8DMKaEIyu6f0HwDDX82IeSONEOmIS2A+wCp/mqzIE7L0/RTOzltGE9PSqtRlOw
	l7PvXFQQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w2xLy-00000005fER-1Kds;
	Wed, 18 Mar 2026 21:18:54 +0100
Date: Wed, 18 Mar 2026 21:18:53 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
Message-ID: <absIrdV8Ef2YjqR7@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
References: <20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Troy,

On 2026-03-17 16:48, Troy Mitchell wrote:
> Currently, the RISC-V implementation of machine_restart(), machine_halt(),
> and machine_power_off() invokes the kernel teardown chains (e.g.,
> do_kernel_restart()) with local interrupts enabled and other CPUs still
> running.
> 
> This implementation fails to provide a deterministic execution environment
> for registered handlers in the restart or power-off notifier chains. These
> chains are intended to be executed in a strict atomic and single-threaded
> context.
> 
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentification
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.
> 
> Additionally, stopping other CPUs ensures the primary CPU has exclusive
> access to the hardware state during the final teardown phase, preventing
> unpredictable interference from other active cores.
> 
> Align RISC-V with other major architectures by disabling local interrupts
> and stopping other CPUs at the beginning of the shutdown sequences. This
> guarantees the architectural expectations of the kernel's restart and
> power-off handlers are met.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
> Changes in v2:
> - expand the fix to cover machine_halt() and machine_power_off() for
>   architectural consistency.
> - update commit message
> - Link to v1: https://lore.kernel.org/r/20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev
> ---
>  arch/riscv/kernel/reset.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 912288572226..8c48466c50e9 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
>  
>  static void default_power_off(void)
>  {
> @@ -17,18 +18,27 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	local_irq_disable();
> +	smp_send_stop();
> +
>  	do_kernel_restart(cmd);
>  	while (1);
>  }
>  
>  void machine_halt(void)
>  {
> +	local_irq_disable();
> +	smp_send_stop();
> +
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	local_irq_disable();
> +	smp_send_stop();
> +
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> 
> ---
> base-commit: 31489a8c1e95cfa2039b7ec4abf124d1fdda31a6
> change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.dev>

Thanks for this new version. I confirm it works fine.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
