Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795726287;
	b=gqtsZdhcERaoMbCoGwzPmPc1yXKYFwAlbojsloiZbikd5rhXiKDBl82p0uRJKtS+o+0x
	 EyjfZqA9WJqZcrclIiR4Tc6heM1eO0suSaiPU3G3UF2kPLzRb7ipdbQZAvfh2yvzwgpKe
	 dlT7CasQuNIRc4Jmvyal9vdyCOl9spTM2sC11Izh0oZ4ekyQFSIdOLRsUyMWJi743Jj31
	 VYaoviNfnkUHhUi97xDvSfXtSbgaaGwewh2Xasg4FU9aB0uroueaLPMgPGorLi1BJQtIt
	 z29c7elKlHTMU0/wxCYSaLkMcitUhH2VAMdbkNcggzJAWPE3t3UNPGFPrU6WXHDhOJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
	b=V3we4/mN1fDHlLNQN4x0DCEplbROAfDhs+Hacppdo1tvFmK+faUOMOZ36OVrG3PvViZH
	 715RKVSZHolXZyhwreikciKs9NFJUMcPJegGJBC5VsiDc6WqEfyVsHKw98/amPyQaJOmy
	 7MXrlBq9rtaNAQ/g836AR4xxPymj/sonYIIp7uCXBDnvokplBipVuvwjACExdXJyrB+kK
	 Mt+uXFo/VlahQpDiNEa1Wa/AGbv2yj5UjSNnpKDfrBLYdCmrQxsrE2yl5yGhC8Ty3CjeE
	 U9ZLhWUsCxWmM13CM7e6PzBLh6aib3TVbtpcRYdf+k0pmt/7woiMaQkQy2lS9DSqd9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zivFwnKS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5318606A68C
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 20:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5318606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zivFwnKS
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04244c3d0so58690555ad.3
        for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 12:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795726286; cv=none;
        d=google.com; s=arc-20260327;
        b=r1LmqxavVPF1FLn75Lk2Og+174KBh3pSwhwcWnwor3RGs67NXBUCZdLaUPKMyp79Z7
         jPfWfUHGygZXOuDNKEHu30sKSj8qdlLx09D5YWIkCgSqNuiNTFF2gydBjx6k9hHQNWX9
         JKnCE4VEMq1k4mB9Lqyjspndkln16yCYP/2EauxJ8Ug4y77lWcX0twaOE9l1PpR5jGKa
         5HYWL312EQNR++NL+Dos9fU2VtpoYY5nm4Qvluk1x1AZyG6HalYLjhXL3wiTTWPrnuiY
         9+fa1ZtmbqYHrf8Ysw5LpZ5Uhhrx7AcVKl5QtW+xW58foSOEa8vTshJaQlWnRvJ0qs48
         BEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        fh=wpTRAewAh0oQVEu6tFXXKiydDuqD5fERSh76lbJRtcA=;
        b=nmlu+ChxWqDtvKgX48qU3zq0Tt9GGLQbj7/vf3WD4X2Hr4jcxQ6ENP348oJXrRhxI3
         gxbw5nZYN1gTfr4oSl+65PRJ2S18T6ce85Otk/4oHm5+wxZNLCO8PxPpE7wla5VvTR1E
         AWqcWIXbKmMNl2QbRlz3f7sDWL0ZbBSsSSRwdKRf9TMPMFS4vcqUprdSsVxMl1daCeoi
         tvQvzXgnRHglY4Ox9nLkMqEHPCYt39XcMDelb+mS2bUeS7dLVphD37UnXFnKicPHDILX
         k1IyxytolNgRv8w1YnUcxODFFX3JfCuPVzEnLQew6OY/Y4FQiS/hd8mZahpmwS4gEjaK
         P2uQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726286; x=1796331086; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=zivFwnKSFKTw19elgYnvmnd4GZxP3x7FYQkBTpQlXj7fz6fHFYa2oijxpIdzUnajAA
         l7BXEOXWgA5HADz1YyzgFnrS0YVUV9cRlguVimJNPxXpzfu4eoIe/+gTQzZag1Vs5pFa
         N9Fp4q9OVvYfBPp89wngzWjNc9lrx8+pw2WYStGs/GeABjhlVIApCPnwpIL/GkkFbabI
         pPXJjBC9jkGuKBBueJu4NuQA0IULaW4Wtu0FY+XnGg98o5ag0Gz+83fq6aVGfxouU1Eo
         BKZxen+S4e8XMltJZ5/Y5Qw8I/cQ4aeSpQiGq7UkZqLNVeRvOQJQ2HTGzXmdJOhCVdIR
         dLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726286; x=1796331086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=jMG6s2j6oNW8zf9dC5tmHJnHFW2fOJs3796LUnJxUF1aOXe7y/k0+quMcVx7e5as/G
         pGcLBIWUhJ4QnCWsaoBqfAsS37Z7T/xwiQXc+sbNoPFQHSohpjFq48E/tB9dTOv8DwvQ
         s0gMElsGKFDmaUo4D392yTrAlVVdB6wIDKEKSz3+oxuNiv0ZBxh01kZE+QZVBZll5hbb
         80VnGxGyY7Mexb/GLd6bWkAj0k2B/ZWKaSUZsvC1xnXpzIK1NYZ8Uk9SdqtJTtMPhRss
         H6jeUD5c7WaBn0Zqx9uLNnccekeUG89h89Ka3bKfZJKRNgcFpaHzDkAqqy9ekb89wgQi
         iDbQ==
X-Forwarded-Encrypted: i=1; AL+hErHyB+p/HFF6A1i924ynCmgfSH6DYkjetepubw9PzughS8/O0MeawCOjN/5FbE8mx5RlRprdygp1Gg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MHUuIY18/GCXDZd1aVfjzm1Y2SfTrA9l+GtvYMXZoB3iTHBDS
	mtNeuxrbXJtlRPY7hsBSV70XVHhi/Zl9Fa+1yJCK5h13Wxm/j7Z6au5oZV3Dy//WPGGfOKm30WX
	fwgqln3MIrO70uV1Nubd49Exjs+22JAc=
X-Gm-Gg: AZFdTZcwMM/KR4KGAfpH72F9rhr8+T+m2litrPAmik7sL5SuF3edVMQqHhLlvUQfWs/
	f0KXFYXITltuxiimlMRWj1RclNMkPwGZayTBz8XY/d4mKt7Xxo5+dm75GhYJi78VhfNo4GiqwPg
	caAD0Y0vaqrkPSnsCX05TdSFVoDeM3YTDzFk8pIqX+wTF8efWLkty+MbJ/J/nwP269pVz28/zCH
	fBxe6J6sSZhaAKZZ81Wxs4QnscagiKos5pCcQXhYBnQZox0DFt97/QczR+NZfq6bty7l/w3p2/I
	rw3Acc/IPt9gOStu6exDr/aE+1EE2ZV6PBmCIhLSM0/ffa2vcMrwRzvBs26gBguXBTxe9sE7Cf3
	QmbSS9bjH8kKpTMWYlsWlXNKEHtV2BDjBLn1y
X-Received: by 2002:a17:903:4b0c:b0:2ed:352d:c619 with SMTP id
 d9443c01a7336-2f03f16ca83mr215219965ad.46.1795726286102; Thu, 26 Nov 2026
 12:51:26 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 26 Nov 2026 21:50:00 +0100
X-Gm-Features: Aa3M54oEPweJV68Vjz8cVs_U2wRf_Iqv5S5UWB4zm__2yBgEw8WUCZAIeYKD9Xg
Message-ID: <CABdCQ=OHaicMvAC=S+To2pQgFXupoUEY72TF+NUNF7ywM1kj0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series looks good. All previous concerns addressed.

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mi=C3=A9, 25 nov 2026 a las 2:39, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>
> The SpacemiT K1 and K3 SoCs have APB timers that run independently of
> the CPU cores. Each timer block has three 32-bit up counters, and each
> counter has three match comparators and its own interrupt. A counter
> can be clocked from the functional clock or from the 32.768 kHz clock,
> and can run in free-running or periodic mode.
>
> This series uses counter 0 as a oneshot clockevent. It is registered
> for tick broadcast, so it can wake up CPUs whose local RISC-V timer
> stops in idle.
>
> K3 uses the same register interface as K1 and falls back to the K1
> compatible. Both SoCs run the timer from a 1 MHz functional clock.
>
> ---
> Changes in v3:
> - Drop the unnecessary RESET_CONTROLLER dependency (Philipp)
> - Link to v2: https://patch.msgid.link/20261117-spacemit-soc-timer-v2-0-9=
264d0ea7755@linux.spacemit.com
>
> Changes in v2:
> - Use named constants with comments for the counter sync latency and
>   the minimum clock rate (Iker)
> - Link to v1: https://patch.msgid.link/20261103-spacemit-soc-timer-v1-0-3=
6722421db6e@linux.spacemit.com
>
> To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Yixun Lan <dlan@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
>
> ---
> Troy Mitchell (5):
>       dt-bindings: timer: Add SpacemiT K1 timer
>       clocksource/drivers/spacemit: Add K1 timer support
>       riscv: dts: spacemit: Add the K1 APB timer
>       riscv: dts: spacemit: Add the K3 APB timer
>       MAINTAINERS: Add entry for SpacemiT timer
>
>  .../bindings/timer/spacemit,k1-timer.yaml          |  71 +++++
>  MAINTAINERS                                        |   6 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  12 +
>  drivers/clocksource/Kconfig                        |  11 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-spacemit.c               | 317 +++++++++++++++=
++++++
>  7 files changed, 430 insertions(+)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261019-spacemit-soc-timer-cadf3088d286
>
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
>
