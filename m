Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8548A225403
	for <spacemit@lists.linux.dev>; Mon,  3 Aug 2026 04:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785730075; cv=pass; b=owxotThH8zJNgMdFvb5FOH5Y/wNKmCeDsn7M/moF+hCPZjAEYmu0W6tnwSzp/71i9kiPAebpq/6N3IXcsn27HseY6MNekJkSGxa7kS/zmOo9fEaD1JsNMFbHWQXoaJ107GZqIYpUpDJWS1GrKuJqOhvgkxAzMMTKHnCLargKg5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785730075; c=relaxed/simple;
	bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw9iqinOOqgTYyQYMzqaNOLiibVIwy836E19wCSirBTvik6UYCsL5K8OV8Wp7V8KOXYklszkGAZJYE0qrFx9aqczG4eob3FRvWQJJEg5X8cIYsOceTehcuG84yCR3TXZFhLOfrpqUWZpx4w/kjojeqrwZZ/3Gwh54AsSFQZevpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC+AigpQ; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC+AigpQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2837673a91.3
        for <spacemit@lists.linux.dev>; Sun, 02 Aug 2026 21:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785730074; cv=none;
        d=google.com; s=arc-20260327;
        b=MmM1lj23zpk914lOK0wASc+oALqDZXnQMRHFjyT9d4i+DwTvlcB92YIzsmjyfg3s32
         /0LrnHBbXzRL+7rEvVW5vxzU/h6Zq8XAwoCkFErd2wNtFMGCkO+Pkl5rWfqvcgWC6AAA
         TGaQLLWoq+lq1HzmIxyLPIlX8NsiXqwZvnMpEEZbmO2h26IXAWRZGVv3//fiUPqco4Y5
         QzpItaWavRYKpR+DTRzHEWw+s0g6Oh4VyqilWRl295OXQH588wn5gFnJpDh6US2esbV4
         kPJz26AmWpx/U3rV5b57oj2dnJ8WHmyA6PB9TO1EtiUYdOaB2tmBsL0MXTLUTPQe0kOF
         XxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        fh=132mQbxo5hLyUKDHHQVd1gY6a/UiHWeY7YbgN3e+Ouw=;
        b=d25jbhQ/7SKPh7D4QZirq8jKNBHoCefsJeeOtGQAGTiXSJd6MR3+hwQlsg1vCV41lR
         si4HkERhRmGdiWQoE5OH6xb2CkHQ4OeiLdj5tQBTNtI2t2Z/8bpMZSBqBadf1BLAvSTe
         91Oes6RBjJlCVae2R88IM4K2Fb2gOyDtnkiyW+07CPQScn1Jr/cZhuzO+Z/PwofQiSJt
         Np0m5Cz73hunqaAjXVnqmH+aN+0md4NO7zhiWvxO6wUECrjQdDY/3Wee4QJ930OrPYx7
         7VuPbuUeBVeTsc+vahl55ha5UQ0ITjLhk71uFJIzn2NFD7WRJLPBMqpyMv4Tn3Ht5137
         iClw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785730074; x=1786334874; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        b=WC+AigpQfJpc86AvzrUXMeGXXVXQjyOND9kv8PuSIkUExzfqSZb2OwI2t+5wu/xMIw
         Uc/svgVu2ybiQrfu+6D84S4gIfwaaDXcVEKo7r1XPp20MEocNJnC/t9YFAer783vG750
         345BVc7QbTdks44QQmeIMfczeddBNNhyVukhYTJTGvN7kxrhgc1BWYtICSRfVH8VcsXK
         +2+ttwIh5TeaBn8L+ribqnXt/Eqlw3ipFFmCXB5Mt0YfgAi4lChTG5FA4misD8PYkWlS
         G/j/1XliZuQx8FmIQ2qpYQp2uIZr9QxMFG8ghvyIe1DWBswZmWOxbDtXhp/urS37MUVj
         6TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730074; x=1786334874;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        b=GT4hvy/hqrv8P+WI34stYuH6aoGq1VASigYYEDo3S1QN9X9xTtGawxvm2IPUDJxzmp
         h9dvvoYlNTVKdDhQYID0JZbhZEy6/U7Rhz/CW59afDWE99JZWRbS6PYPU2aDBmdYCBPQ
         5eWh6P/3z8rWP5BZyW2sH/z5uNL+N+Agn48AqRLN72lKQGJ1u1c4jn57WZbKOX+nx0+t
         DzBxJCTImaWMjU26iNXoldO3UoYy63m65P4rzI8xnIHj4tl/cMo0D4aAHI5rHuVqYcfY
         4yj5NVUK3QxcIQkTfHIUBy/FN2jWooOVuhrkSS+RTCU6Hgj13HN5+L8yFLh7rHhbUKVy
         2FFA==
X-Forwarded-Encrypted: i=1; AHgh+RrqkPJGt12GNiSk03POOdRy2fWtIh4OVdnW/YcbJ2XUCdc/Ze/o0jit7fufQRAfzz5X41NXJ/J/GA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPEwhNfUzeQV1Wo4poclDaJgVIAQ64e5+MEe5R0yBxaSQuRAtr
	OyYP7VhS+vCOS/NyUXV6rh9TmxGq3sQr3gEdYdyWiqD6x+LGkmA9KStUiOpMrkPz23C49jzCqR4
	L04BirG1TtJwVamgzckVEIN/nSbUMjwA=
X-Gm-Gg: AR+sD11k+42NWIMmsfu1UG5Qvdk7uos0R0OHt9IG9gNujVgkdcSbZmDkImTS3CXaG37
	TcjMjdONT9caVXQaTEuqpoT9Zo11RIyECUcjhQXssmEDxhkCiuae4DvVoIBt/mj0PUYs8wusyBx
	2W7zZzmdJh3gbdzQp1Qbn2ZAxjCYsMhqgR1rxKtuLN7bBiGp+gFcgs6T4iiAXlbpL/n3YkuG+2X
	0q+SZ9Kruc7Uw8eOQYu1Jyj8DVVByIcXE5Cn228CNWvCptg4O08nL+ItJvZS0C6gQ8LcGUgWIzk
	HthFxAdpq/cGB7AzECfTFmLSeapDRt5iX4fO4HT3pxWYvmhnc0kil5Hx5Cz5Y0aPwJOVljkjZ/e
	GZc+0D+k67N0io8gx3DyP00bDWWc++kBLuzQCsi48cbJ8AwHlbXI0IQ/P
X-Received: by 2002:a17:90b:4c0e:b0:385:393e:7124 with SMTP id
 98e67ed59e1d1-38fbc48e76cmr7516377a91.14.1785730073725; Sun, 02 Aug 2026
 21:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
In-Reply-To: <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 11:07:42 +0700
X-Gm-Features: AUfX_mxoZsbHdTwTqbI_xo8lAz5x-PfMgbH_dD_PFhYYBwi0-5mHQuUL3UsDbSE
Message-ID: <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com>
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

By the way, I noticed that spacemit_i2s_init_dai() is quite similar to
rockchip_i2s_init_dai().

However, unlike the Rockchip driver, spacemit_i2s_dai already has most
of the playback
and capture capabilities initialized statically. As a result,
spacemit_i2s_init_dai() ends up
assigning the same values again, for example channels_min, channels_max, rates,
and formats, which seems redundant.

If you think that makes sense, I can either remove those redundant assignments,
or make it follow the Rockchip approach by keeping the static spacemit_i2s_dai
minimal and initializing those fields only in spacemit_i2s_init_dai().

Best regards,
Phuc
