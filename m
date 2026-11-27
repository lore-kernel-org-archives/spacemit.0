Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795796548;
	b=dDXNTSIfVIqdqqcI84MK6zHRFYu+ghQedL5WJwcL4CTCA75T3Glc5lNuAb/p+B5RmH6w
	 +xX2eLt928Rb2ocmKYV6c/g4oY49rRoAQ3Ci9CosqkMTkrg7x6KMX44XoE+qaXF40rOl1
	 0dDmyZKv1qOK+7svvmzmQEvy4UXEGB73OSFrzVKDS6uQWBpyshR2Ec6UYjEFQU0OSSCnS
	 zgluh5pkP2FdlkDhrvNDe19ni0amtvQ4F3KFXZn+c0QHRyUoDVwURzvKnQOtwZuKEG1ca
	 k0PqgaCLqM4QKwfh1zh01qdBVBaRkCXo6+w6nf+4QgqkKeqPpvMUxcjEgtD9MbjqGaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
	b=nqU1ok9VVYEbvzA8ud92o1mNxPjyTS0TRkQcuWZSoVJWPRGDrasb+Appq+vY96kByNVh
	 VUwU+Y+n9C4nEWGgztzikJEMuwZ01OVP6Q8Eb432mLwzSI+BrY4tjdbeNf2+sJElb70rh
	 bDOLzGUOAtCgTgmpIWWU1p5DqpKL3MhWUS/ghROcLBJsefLvQGFruotIvcZxn3lyazkgD
	 9zv9I5XUNDu0MZBw+mdQDLWxjs5etr1gLqxE9UnqvthGZwP2tXWnpTb5rh0amr2B6WsBT
	 ruMAXjzxHNNg2m71NrAenYzqJ727rWLWbe2WDdLKysnE1io8zNgqxPHvy2FMH9e/XjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCWVnePC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A78606A31C
	for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 16:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCWVnePC
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so2453982a12.3
        for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 08:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795796546; cv=none;
        d=google.com; s=arc-20260327;
        b=IujVCbbFhH+49sf0s0GXcoTe4A8+5KSxGn1jsu0Q8i8oBMmc0wQKoHXpCc5kgk0/Wj
         /m/FiI0p4BFR6Od7lTeCn2aUrMn719gcaotWp8J0wrufzn3NvaHYs6rruAa2l/tYjLFR
         8TGcdF4xWXaQjBZ9wUJ6tmVfwa04mzMVITK4fTW4d55+/O7AjD9CiFZdBOMNrdYPYx+w
         Tf5/sEs/Ud0TxRHU+Y7J/LIHlmx/x9CJyVkj7T0MWPQw/ETuncMv2HKQod1IoY9+D1v0
         MmePkxfv/Vvs8Fq8Vf2nlWqBEIUCKte2fWPZObyAxdV9Uv2peq71hgtDGBUVDwvII/sk
         3zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        fh=r3/QG5Inw7BOWfshcq+KvcFOyIGLZAA+ETtytdeVc4A=;
        b=OyJaQrK0dHyCecnxD4W5JRi+F6aDd4HKiGcEnOWFqD5/PfSjy+VMkOGXITCn/9NuHm
         c0FEkCWQJcjCfvT3rqObLW+TYY3U8ykRokpvGETZyXJgiPh/IVFosBpcE9b8P6GGtz6q
         AFyoQavPBwVFCTDzm1b3CYyJ5rXL8wbNa2Zld59BDenGqSRaU9jD1b0W99jdxMyvtdwG
         RX5FU3xznEaoSdNY8XwRqI1oxgKnmpUtzN/dJ1mWeatW2xnnk/vVMdd6W5PKX9d5Or6m
         6ZPPlN99Z/qy73E1UBHK8Rr1Y/MW2lzUs3kxXRquOGlLSSBtHfP7TfyGR7x9iUKtzeKU
         v6VQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795796546; x=1796401346; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=yCWVnePCblhdhLy3aOc/SL4+OLUvd3wrd8b3rd5fdkvdUvhagazJD3ntydcDEV8JyM
         S33UHoe9gjgpCRS8J00m61lJRs/SDFxo2mnWlaSLiFtWccywpOaPDW3QPC9o3ZwlwanM
         ekjWTXsyYfonvS5aq6brqaHpIJSHHqpLDpRtQj992hYd5BYZYUOqdrYw0zFfRHbRO03w
         MNRv3xw7KfmJhegCJbaqD/T7H25r7vFM1Dl5cRo3RH0dByjh/VCcVswgw1TEJG0M/ZDN
         5ObZz2UIFeCm9mf1Bz3Jxrc9ECDvXPhd+VYjsjjLI/wp8zSkmN5yDaaCtvy8vJC0WkOS
         /zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796546; x=1796401346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=IKIRyikQHAyJG0Sg2Sy3a4zgKtdlXy/dGJFMOegZIRig6XklotyX3wXKAVnBieoePP
         6URiMMHbybYtWuHxpCeaGE0iCY0niAurC1GOxfd0FhB+06q6UrH+0+d+wtcVbOdchVUL
         JH7gJhuIIJBkBigItsTyRL6BZaL/YKHVdvArJIttVx2wN6LjCLWeVKCfaiqMkw8MGruW
         V/f9IEEMTYZXIqx2CLotPf3swG0zMWbHvudX9y2B50BPq5cRUIKPMGRu8WkQAbMJYNlm
         oycP5y3EMcG7pO8YUiKxCHJ/Oz45h2r7mCYkEoc8/TKPNUQlxcJ962Ij/jnyLudJjB1f
         9EBw==
X-Forwarded-Encrypted: i=1; AL+hErF5cJxUqeYpHK/Irup7GSAVT89kA5q7USex9op878shQ+acR6/LRnYNfbHRFRTXchZpPh2FTxyjqQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9V8nNqJbAoqqBKy+5HFCv83pF6nb8oTWohwUT2QmDYD0/VMjft
	uBpo+5Jw/nmU5AjI+apbYDL+K8ORfjjRfqUH+55Ep8+NkEK+SaA8VgxuGeuJLmfTEXm8N558NOr
	N2kqCf+gEEHxvb4eH3W1T01gReCUmJQw=
X-Gm-Gg: AZFdTZd0MnJ2i4Jhr9ZUEUOaXwQCBO2cR0+MrXYwTKmo62vtUlS/3fNqunVGc3grFG6
	AaNXEQZEYvka7pOgirAO7Pb2QecFBkAcfVKFj9uSCVaTvEicn3xcUBru/5euhDG0PFY9k/5nITw
	D7bSbriD/iRNpapIP58esRboFwqHpH43pZCcTkR1t4bRNme7Z/Fu1oupHh48TKhQVxY4QIS1Ju6
	BpFETOUgTvSOWDIKdHtHg/Sw4J7nAYvyowjersEyi5Y4ndIgfaAUpKG2cDcuVXTk2HUjCAnNAOB
	BWd/M7n7A7xIi8pTS0TfIRgPdknAZ99JjcuQxtioLuZP5RF5Xh4NPS+rwFvWxW9UZUIy/rY3w8X
	gDwSPE1hxo4tMFJHZsd3rsO/E5fzII/tLx8k=
X-Received: by 2002:a05:6402:a307:b0:6b8:7f14:dded with SMTP id
 4fb4d7f45d1cf-6ba37ea7705mr14055793a12.34.1795796546329; Fri, 27 Nov 2026
 08:22:26 -0800 (PST)
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
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 27 Nov 2026 21:52:10 +0530
X-Gm-Features: Aa3M54qbxpABrphlzhxg9I2Mo9h5VFuq3p0P6kC8_azVaeYz0HCPXkRvM1DueFo
Message-ID: <CANAwSgTFJDGT5pR=Pv0v4RSWqTZ9q6YeP14TANRUrBrg6Be_oA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

On Wed, 25 Nov 2026 at 07:54, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
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
Tested on a Banana Pi BPI-F3.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
