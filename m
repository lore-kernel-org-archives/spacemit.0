Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794909150;
	b=CleeM+rccuAKhnLbJoj31Vi4TO/K/3MsrqR7hGorZaIj5soHOIMYWr8wnJM9/THKGdZe
	 RPGm9i2zuE5Kn/58MskReeelYnUxAAOeRtpgjgiXqrnHybH8x/S9yMlJjUTZyT03InWAc
	 YDALQnxMKM9OeY6VoSSqKqH7AtgtfCGt4xKmQIpgRYA+8m7co3BjZdioaYwyvQoT3Mhv/
	 b+NoBdTFdPzt9AF+Hwy4Gb1VGhoeoFppSBHtHHdR9QB7EiYnNkF5RosQF5H4A7sx9zQgt
	 qXbXcq7h2Ku/Kk/AHWBnDkR15TzJ/wYtTDrgQgpFphyCFDl1dmBe1h04ofTvYPqL/zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909150;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=nGMgElWMT578FGTCfSaI1ntcWAiIbBCX9YyXIkpq27d7P5baCtT6d8dNklkilHayun13
	 OoGAGmy13n/isMDL+sneQxPq8sNlltIefK4IFqpTAeItPKBbLKJ05EI3ayg53hOUEhlHj
	 uokRnEfqTqj1x/cTZoqDaVmVQ6tz1Ukmx6z83amSQrFxH2fBrxfrZza0fDB6NF/laJ8OS
	 9oYMkNmTVNkpCZvSMVHcAz9cRt3Vn+vC4BS4byPWvsNitSrgAyPFLrMQa0NcpHNHvWFVG
	 bCg5agbKr54Z1uQnLhP2RzPt8yRPGj1K0idjkmPUGT3xxaK/IBLp1ibNhZCJWCZPGIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JceQ8P1Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D326E606A31C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 09:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D326E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JceQ8P1Y
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 28C8B2010F9;
	Tue, 17 Nov 2026 10:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794909147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=JceQ8P1YvvcAgYJe7ihzL79J+o4hSD5fBVrWZec7zdzGh1s8i2AJYtx2p/QzoWU6WjWaGL
	CwMgoajk/LFSC7yH8AzOb0z/1a9httn+J/kidbA0a1kD6ZW6hDpv6poXE2c0dMcPy4tbOe
	jaqfCFUWF8ydzcI+P3vpTb7ykPVuMEaw9OPraptgxdevsX4LE1U2qok29FkfiJB63DJyeD
	fiUAQPST64VUtQIqWMVlMx+93pwz7yPMc/LqXTn2BbzQmRnxCAQcuqShzS604eS+fKd6S4
	+BJuFZ+guxMflFI4PQOro7TUcQvJHm13dsWP2bAitTG+E0EU92y6Smx3ayJqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794909147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=XZQvq75YBL1+uEU3EaDlT52RCB43Byu8CLLP6R90nJivPase/iN90zEHO40pYvO/andz+j
	Jf7SMB2C1GqahaNNM4X7WkMcTCQZX2nJND0IAR1YkiSdJFIInKOvl+sdATPT64reO0s0Vl
	pH1xSG31jRUFcj9npZV3Hz6ZgILKQ3dgZIymtTFgRNSSWw2Dt12QHKQ74YrXA7zPzIq/+4
	0/NGs2rr8+Pto1MaF1qF7BEfTZY4eHu30ww+pCsw6wnhhRqYLMhOGb8I3epoGLtHFMnD/b
	AKVsAAPbpw+5P3FDLavMqxnZL3KjCs2HKe0bg2bNctrlSLFkNyuvKv24XeaRFQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794909147; a=rsa-sha256;
	cv=none;
	b=VV9LGLlnv/oGiiBz0WfRrETpok+uxCmmgd+unQ0oAcBTjK4dailFv0RYDYI6hSYmbec1MR
	B7zP79noqz793nU12SNN+qYk4Tiy6OCdDlYcSG42TDQLGZCDhIuULZJGnKN0qVQBrkYbVv
	4+Ag2GICR7TlFXAcbtMWl1/KC0fJJNaRDM2TOy0hRby5QvRcWwWmcuADQVMw91BjQr1ZAt
	LN62xLqZxRpaFtidn6LVi9+FFBXKpL5t+ht+jFRmbsOmpNCNqzOXvwtKqabt/2MBtZpYpN
	uWgRydYQNROvPA/trSv+oidm5VlCrGeLSUBi8rbbPVbD/9rjEYrNdi9G/c05eA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/5] clocksource/drivers/spacemit: Add K1 timer
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Daniel Lezcano	
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Tue, 17 Nov 2026 10:52:27 +0100
In-Reply-To: <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com>
References: 
	<20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
	 <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-17 at 09:45 +0000, Troy Mitchell wrote:
> SpacemiT K1 and K3 have APB timers that can provide a shared clockevent
> alongside the per-CPU RISC-V timer. Use counter 0 and its first match
> comparator as a oneshot device available to the tick broadcast framework.
>=20
> Counter enable changes cross clock domains. Wait for the synchronized
> counter value to stop changing before reprogramming the match register,
> and check interrupt acknowledgment through the status register rather
> than reading the write-only clear register. Bound all synchronization
> waits and propagate programming failures to the clockevent core.
>=20
> Obtain the counter rate from the functional clock and protect it against
> rate changes. Keep the clocks enabled for the clockevent lifetime and
> restore counter configuration through the tick resume callback without
> sleeping clock operations. Use a platform driver so clock and reset
> providers can probe before the timer is registered.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clocksource/Kconfig          |  11 ++
>  drivers/clocksource/Makefile         |   1 +
>  drivers/clocksource/timer-spacemit.c | 317 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 329 insertions(+)
>=20
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index da83483296d5..3e7dd5d628cd 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -163,6 +163,17 @@ config RZN1_TIMER
>  	    - 2 32-bit timers
>  	  Two timers blocks are available in RZ/N1 SoCs.
> =20
> +config SPACEMIT_TIMER
> +	bool "SpacemiT K1/K3 timer"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF && COMMON_CLK && RESET_CONTROLLER && HAS_IOMEM

Drop the unnecessary RESET_CONTROLLER dependency,=C2=A0the reset controller
API has stubs for consumers.

regards
Philipp
