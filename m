Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3B423BCF7
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814698; cv=pass; b=Nw7nuowuKwwtWq20Wpyh5AMJVNBhUgsLKflugi2wzWoWBHeO1Vs8pgkK4Kdgz6da+gEJZkXUm27FJocFX1t7nUr+FWsH8nm49PFYlsEY8W8RsqLuucC/5nNDpFWmNygzeaiUosvNdMpPseAh+2D4BV83byXbbekUI44hKEqEd3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814698; c=relaxed/simple;
	bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Onc3+GTq79/xOiJcrNJuo8d2HJYiA9hwN+w6S1+G7QALnhx8G8dUjoUhJdDyXZ+UaN8Xwob5aQZ0PobJGKqXrjcEuywgce0DcgM3tdoDoS1wWDPk9PVhIejuCnlfW2IIQjvSWmR2WknHvEA61alyk2CteyON0Kkp25zpt3AcwDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spdanaKI; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spdanaKI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84a2dcede83so5615267b3a.3
        for <spacemit@lists.linux.dev>; Mon, 03 Aug 2026 20:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785814697; cv=none;
        d=google.com; s=arc-20260327;
        b=YBfN0kXCHrptrPdw1E70CekZeH+g6+dg/4d10gUuyrpPfPWR4PkJUNTvbJvSX9KBiR
         7Xc3v8TAevSTnk6V36HtTEbTcJJIs/oMo8EvCEAkl+WxgpGJyUm3LC6gFeG3yTA0vIDU
         rnJz3UImZXHiV4vhKMJsoOxub2IPk0qQh9LeUUOYZOO+5Rw6qbwHJCpKTNysPT85Pg+h
         NZfHyufVVbj81LbNxI3/toOQMveB4IkdBk0LDWhI5BVMDbBOZEyDdbQua/nWsTBCgc73
         Pifx5LcEYai2sGA1SOUSlmR1mdtkJQDOtLdAmTUT2EYPG/xb2P8xApJ2wQowooP9gs44
         zvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        fh=TfjdcrmXFR8QuVwFfQHJpUUHRPdpS/khIH/D/AjWxGM=;
        b=I0upjCMnl1o/7p73yNeoDdTReSug6Ap+gH+8xSBQsF2AyhQxyR9oCpB1yzz1x7iKoj
         MQrR8ldt/4u/bJ1UlGjqzFuNdIJ3gDCAuVFIGWQn1QGftR7T+5QKOcgXuBFy++DcBM1J
         NBywStHTztY+wTXg047z7V6mJla5CiqMqr+C3umm7b8SIQJHKOnnFy9akUelOTYxxO9n
         k52IujUjllQ/CyOObJNuNInbIeGTlEoPk1GqQ/xZyz8Ktj1Pvo2edLqKLw6FxNzFLP5A
         Kztq311MIZ0CMprPNTyIMrrX4cDjpUUbTgxC+LU7fNXDO+hp02eaodualNdpLGS4//FH
         481g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814697; x=1786419497; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        b=spdanaKIVMDgqUzNb8kJpcieTlmNsMHpys5ZyrZCGxMvLDr1WoSihpgM7TR9jRFrj3
         y6776hsTcMkWebj6gGLPYiLXwcyQrYLwcCspcDFjXAl3Q6vxvSs0CjbAY3z8XsXTkSAl
         9M5c4d6iZsoaCbgyprhiXqk8gENOAh7nyfzOg8kd6inivWGTL0gdlCMmJ6FKp6MHCaY8
         f0hu15OUT9aFvsNDGP73Um0a/q8xgNUkDbjNKo2+dnoes80V5fQT65crYpLVtHCzrGcE
         Lx8VIwoHvOE50fbn1/4P2NUlyDpWQnS9Iqv1xZWx0GgLDMmbB3KrMaeCxTgpAFMGoctS
         jntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814697; x=1786419497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        b=nvdL6FT4+U1lN7ENqna5mSmtszqEZmRBeaMYc/7D4eu8/kVN2sWv0e7+GeO1ShOoF+
         JTIeT80oWi0ivX1AR3iKSz9i9Eusx4WpBVHQG0Y5j83ifDDQktmx2f8hSzqEKKWOrmBb
         2TUqiM8AhKtblGd2pYxW1VZ6ea8+xsS206iTLOT2Go41R2r4zrEHwj/zdOy/WMFCTHrb
         7NcoMpC6Y8MHVc74jW59/lx9jYEKAfUGG1nYniBTmgJqb3xZWQ5TyurxW6nWacZueHbO
         2fdQ1aTICgYTY+IAOm59D8Qe8I5GDw729lEuFhcXEKOd5BbC9bXKIrKYcESkGcCmAr0G
         EFaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrB52qbF3qsnWqWYbZJAl7dvs38RMXTIlt3E+tFKWhypxwZTAY3UgMyHtJ7UhIoHq1k2w+hIOEi1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX6i9bcTkZGrDGmTYNeqto+I8uFMQKLcc2UtWU1FMDrKcOCFQw
	e7lZqAGellckyzU9/a65LApnbuT92XhBuIvLKW8Dt2kdqR9kVl3KmsY67up/Xz/ety+nXnFdlrd
	o9RxOy60BxBxq9qZjFP2K6CoyAP4I5rQ=
X-Gm-Gg: AR+sD13OTEAFU8n2R3d4/gawV9MzXTl5tM+EoJJMdZD+MpOErlBBL1A7dTYOovkRuHJ
	9rjmhoAW89uc3AFtquILJLDhgz5H3HSM0UOAvZ/IFTUkh/0zUux/iqpStclim9uXZ1VOPBcuwkD
	1WCSkzrUfIiyuCsMWfWEoQHdOv0GsSAjumiRFH3qzvT2FooBM2l9/Iz7FGSkGoy5kWbyA+R55or
	FH/PEdt4yS39G3qQN1V9VT3QN7FtcMlKEFdwnmVixQrgOJHnNpcWicCko+Ag1nn5fBQavUYEHM9
	NcfnXdRmU9B1S3UIyehHNebCZisQsjtxI0MKZoG7JsWtTM8rPSWmJfnF1a4UujCHn09YObzzyLt
	dxD/HLhC167dDoEy316LWHgFM/rUwCgr9juP0SGt7q2NtlmyayCDjK/7jvPetT1b807A=
X-Received: by 2002:a05:6a00:12c9:b0:84a:6e0d:692d with SMTP id
 d2e1a72fcca58-84ee4920b3fmr11591322b3a.46.1785814696703; Mon, 03 Aug 2026
 20:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
 <DKF3O1FTBV9M.M82B257B0WI2@linux.spacemit.com>
In-Reply-To: <DKF3O1FTBV9M.M82B257B0WI2@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 10:38:05 +0700
X-Gm-Features: AUfX_mwUhKeIhKcbOnxSm2msaY0Gt-2eSKlA6n-4fwTFNHrQX2Itl5fTDkBIuYY
Message-ID: <CAABR9nGA0dft+MpoPJvvCYvDnZq0OKSNoF10+QUMxEakvz+2Ew@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

Thank you for your feedback.

> I still do not think this initialization is necessary. Currently,
> spacemit_i2s_init_dai() has exactly one failure path: devm_kmemdup() fails
> and the function returns -ENOMEM. The sole caller checks that return value
> and exits immediately.
>
> A caller that continued after ignoring the error would itself be incorrect
> and should not be accommodated. The helper is also static and has only this
> one caller, so there is no current API contract that requires the output to
> be initialized on failure.
>
> I suggest dropping this patch.

I agree. I'll drop this patch from the series.

Best regards,
Phuc
