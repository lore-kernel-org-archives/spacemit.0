Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F4C47668A
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465728; cv=pass; b=e2O6TZiZco1gHPYLod1N4zwM0EAg5ns9xqJmok/+x1JjQYG6Q1Cd5qXMm+8zAaY7i8zJJ5CZCUuY8wGZQsvS26O0uRC+C6tV8J2TII56s8534UnoTsAfYy0qEDF3SbzXIbrKqcgeotzGn8mTNLqsSeHG70cnbWktNAE8ckjxA0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465728; c=relaxed/simple;
	bh=kqN7v6OkOyHJgxbwrpC5Eacfx8YjrcZBxxUXMIP2YC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EID8/mK2pXaWpauN1n5FMeO+y9RT2U4iRKSgKqWYTas8bqHE/A2jNB+aDuyL8KVN4ElJbTLLZ6VJuEiSGLmIWQfF+QAiBY04DB3xhwwMvVw5VMxHDvodwIJgc9Vi+9lfNt6Ua9M85YARh4lsQag0bWg1EGd0s6kkPM+p2tFjdzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcXxF37/; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcXxF37/"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-8659af7454eso29371207b3.1
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 02:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465725; cv=none;
        d=google.com; s=arc-20260327;
        b=Mna7pahyxfnrX60JQujA1Fmlv1Q5PwYTTHLz3yHBJ/D5U0ajNG8muiLs1II4ZmAD5M
         cC2IzuV10m7TQBicJyyxZCxImhe5nByhZXBVbfCEVR970Gs6zdi4vh2o/pO0YW6izYLZ
         5oWVQImTF7MHeNyoPxTj1/jMwOyL6uc3vXWUlOU/E5HEE3PkgLRsFvar+3ehbnGGDjUi
         xw3BnSvVrzXyXqofGUdHG22hNfFyC2q/zbyJzaqbAbiUxFD5usfooQJQngoSK6JmbqZR
         7rhkzOXDkhGK1Fd62CmNyX3vPCizb5HfKaxdgU1nR5kmeuHncv146j1bs75e9xAa58U9
         fnYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        fh=lK3fxfm5LxO3SMw6+P+2U7Qyc/CivuxcAC+RR3Qe8Bg=;
        b=Ln0wlLAjOqOLhuyxRwQ60x7sOJEIKrzvsyc2sjKuynjLChcqTNByMs9tFCXCwJjwmn
         c98Er+bK5qhiEbZ1Jk4kq6O5zQuZF+rjapJpxDJY7qkhBe4FKySgeVyH78AWaT8+OGqq
         WK3f01aSOHFhe22GvsFjw66msMyMzOJP+5c1mhaemGP92UTLIudT7sJQjlzctejmJsKJ
         ScURTl2IH/RUTHyeX+CmmK/KWwUpOCGxmo291v90chvgo+UbpNRaEc7eos9Xy8uEu3xO
         2NayokVaDsqVmcRkESyvM3P7hObmybTaSqaZ2Xqwm1V1fH23Sqrrs5Tj7kKV80EuGX0j
         9EmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465725; x=1790070525; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        b=jcXxF37/EYRkpN6LJqe4TxOp3F6yGORopGFIMsnieLTiQEH0sOQqBCak8eri/wzwME
         w9TUXtJcPnEFgQpdOMVAk1HtO4cdrLvHs2zIORqZv6OWHAIaklNjItBh2Jb7GZNe9NFv
         1xilu+UsIG9QMtyBSGXpS8DmpsL2++OscyYUBuenoEpFkw6HaJQpV/SQY7Kxm2OE7hNU
         W2q5Gel8QUH8dhLPB6vOR2UtVscVx7kwkmJe9UQLcREPRqK50ti2gerQQLkHy3o62h+w
         bLb3xkE37qif7JjgPvIoeEEqQ4wfxjHWClPHDMrc2zBs1QNe2dmrbE197RlEUom1nr9D
         zznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465725; x=1790070525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        b=YWqiB/H2Igk2OJ9RcRbjMGF9MxWUR+alKh9fx2LWbv+y/sb1aur+NvIdr0JC4PIis3
         LCfEuLyMgEYdlAlVYnNQC7cu1n8AnF0UgeZh7ayFntY+ps4sj1pYVxWTzYp7aXasl/a6
         at0BEgE0OiWrcLPQM0DNgEKEm/NgqeCBCXe1ADEOXU8B/LUR2op0ushTF/02VSGgXapf
         ONcCedBInuSAFW04blHFKE+qbOtGnPLD3kvq+xi2FhbVYJ3+9XbwD3OohIaiphi9u4tY
         N8OO9zCqVsQYXYSJ2ecNOGO5ornTKPugXu5a1DYTfuzdJaV5qRYD8Ve4NrJYwq1bWmwJ
         vzEQ==
X-Forwarded-Encrypted: i=1; AKwUvByJAMyy8HCfITTmJBoH038/O+clVbYxELp55K9C5ih1UqALDBk4VcX1c8R9iDrgf2fNIKeA9Abt3A==@lists.linux.dev
X-Gm-Message-State: AFuF++kegkaHE3T+14rsClG6erwi1+XRtLPot3jRwDpwVnHbALv5RmqO
	FsMsH4dWTT1mOSj4RAu+vSwZZPNqP0p3ye8CEZUwWmQJCXXexmrKuO/XBXh1O0/QZHhQccBbGxW
	X8E7/EyqzNGOnzjs0CPu1C2tpcfXJors=
X-Gm-Gg: AYBFou2Wu40o93zo8xLckmT1r7qVxjp9Kcef4s+LFtEU43kTu/elVaelLhU0p0MBrIX
	5P8s1KUjGjP6E9kN/w8kDFgN6E31YWY8wUpoE1YOldDHg56kL9r488nH44KnFnDfKuSViiy2Lq0
	Vpsvu4zOYeWDq+Sm6MOp3VMHCYkoXHRnVR+h+5KcOm3YxC4SuVdT0C9YASY3UE13vxV7X2DI5n/
	N6jQZrBi3gQtgCeQ5HfFvN0YZ3I/OjwkSD2u8HoSZ5Wov6MM2h0MxJ8nGkdNDKqe7w9rsvB516v
	xmCgowJklmwGFxDGxsCGgHqAv1b/5Z2X1MZOU2Zt+Wu67gle5dKO99s6+Q==
X-Received: by 2002:a05:690c:9990:b0:884:b55c:1bf with SMTP id
 00721157ae682-88d19927a33mr17511267b3.0.1789465725204; Tue, 15 Sep 2026
 02:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org> <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 15 Sep 2026 11:48:34 +0200
X-Gm-Features: AcwNN1UPWo8A8KL1cUnWKRSOKo7pDITqyT1rjkjcajM5WYeVYYuEMRIWcJfeozY
Message-ID: <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, adrian.hunter@intel.com, ulfh@kernel.org, 
	long.wan@linux.spacemit.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 7 sept 2026 a las 18:00, Hung-Chun Tseng
(<alan.tseng.cs@gmail.com>) escribi=C3=B3:
> So a threshold of 50 is comfortable here. It also supports your
> rationale directly: boot -2 produced a 5-code window and boot -1
> produced a 1-code window on mmc1, so the narrow-window case this
> patch guards against does occur in practice.

A jump from a minimum window size of 3 to 50 delay codes is quite dramatic.
Could you clarify how 50 was chosen? Is there a specific hardware specifica=
tion,
phy datasheet recommendation, or test dataset across multiple boards that
justifies this exact number?

> My question is about the form rather than the value. The vendor
> driver takes this same limit from DT, per host:
>
>   sdh@d4280000: spacemit,rx_tuning_limit =3D <0x32>;  /* 50 */
>   sdh@d4280800: spacemit,rx_tuning_limit =3D <0x32>;  /* 50 */
>
> So 50 matches what SpacemiT already ships -- but there it is a
> per-controller DT property, and this patch turns it into a global
> compile-time constant. Was that deliberate? The vendor design implies
> the value is expected to need per-board adjustment, and with a Fixes:
> tag this will land in stable, where a board with a narrower window
> would go from "adjust the DT" to "patch and rebuild the kernel".
>
> Two options, if you think the concern is real: keep it as a DT
> property (matching the existing binding), or keep the constant as a
> default that DT can override.

I agree with Hung-Chun's point regarding configuration. Hardcoding 50 as a
global driver constant assumes all boards and trace layouts will behave
identically under thermal/power variations. Defining this limit in the Devi=
ce
Tree (or allowing DT to override a sensible fallback default) would prevent
boards with slightly tighter tolerances from breaking or requiring kernel
rebuilds to boot.
