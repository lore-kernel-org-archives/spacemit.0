Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92DBA34
	for <spacemit@lists.linux.dev>; Mon,  3 Aug 2026 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785729961; cv=pass; b=NaJMUNWrsAS8bBDrps1mXnEgdkyF9t6631RYqfkSKTn3mkR1hynArulwvBF49BHC8Rwfbk8ZSSIHy3ox5t3Cdg3+eHnoXjKKl4qE9ujXPNTq/im3EGGuPh514+igH7eM3ENUHPyR27/7EyV9SeZVkCjx9w58YC/Q1NJPBNnjo1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785729961; c=relaxed/simple;
	bh=A4mDaEGWJkLlLk2knO0dp33P5Wgxhel42dq5VQij8a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5fE9NHN14yULQfSQ0d090C17Ru8AW0sS2QbC3PF6+ZPeDsIQ/czpxWyk3q3KF0/h43NtDGWUgsjmvKCmSO11HhMITfsMlmDKdW/EAIR9L2kaWLGEj/DHAf1uBn6zICZI52DwXvZWVkLRmcKW1SKUjNyi4y/fFPwpUmmm/uXCGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJhcE1WT; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJhcE1WT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce98cb8165so29362955ad.1
        for <spacemit@lists.linux.dev>; Sun, 02 Aug 2026 21:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785729960; cv=none;
        d=google.com; s=arc-20260327;
        b=CbTP7wOeIDKlGpj+6KdSdkBn83FPeLXwJRrp3VbV5mScODHlbinAtXPVpXLEPczR6l
         NzzXog+tJMXtZK7o97AqGNLpMzL8cc2R5xrZQKCru0jdYJTbTCbF64PqqeKsklc+bJv/
         +PL4u8RxGH1Cy1OlYAMOFilFfDa22jVU5sUVBPGK2LZNq93QVU/g35od3pKzPVu83RDX
         oc/KeI0QAF4WqzNsm65AdtBpc/EjjaB6e0+TRvDyA/SGrF3aPKGJ5SBtxI70rJoxssym
         lhOGlxAB1k3teQwHOLNEWXL4A/CNZcNZv2brgWDyfvN4sDbqC0uBYCeNvCOMsuMgeZAE
         XOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        fh=EmudtpLylleARzhZ3IRAf3tVr+Q//fwzgIH8AQOs5oQ=;
        b=Gw8jqLR4WMfWaO+gt3AJdj2y8j3F80PHFuhPYAT5Q751t7kkj47LYo6KBzF5Qrra75
         LGDBXUygC5SeZiH4M7fF4KGEram5NvQkiXbYXPUuNY6WRCYVNLKGIVePRfdlkQcIkYJg
         2oAD+/CLPfioVBqaKCMpsRVx63wve5eRxjZxo40bWmm5UYlTFRbDHIC1Zd1fEXO4zpYh
         lKKLSQqBNu58/9I9iEdTU7OYdDTxfBaEBZlsMdtKfwQl5JE/hH+WRao94mFvREBkGtSO
         wRsf4dMmg46D5FXvPRVzIQrC6rQcRhuj1cRQxu529rRQTiPGSupu/4JwqvgRoFIw5cob
         jCMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785729960; x=1786334760; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        b=HJhcE1WTKSbvamzdmEVw6oT3ZvBBZKz+SHyaGdZ9+dK5UWDcbbvWTAVQirmH4vitbB
         6ZuXssj2aQjFlrVn0Wr+AGuzyMUq5SbMEUX24JMMG+Jr0AWE3m5vLDLQAQysF98ysq6L
         g3a+KP4+8irG4nFLrEr5ABnNPsEbqloFEktOftOAV7yVJWHRrsQwGVCR/dNpneLmQcgS
         sp69PowXKGEpVs9nSncjCMnFaWP65dAMqvusBS+ADAkw/gUwl8/PxpEO6jw2PrMBWWBt
         7SwJyNKKX6RjbgeioXtusPfw3NegPv0TM8KVCmHlynJQSrd1lgIlvmjLA1lH2Fo+dgzc
         Yblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785729960; x=1786334760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        b=d2TXKuDb/V3xuxX+kiSu1T/jPmo28QPyhTNTLsJloIE5Yw4SyW5PDFXFTw979NXWm5
         B1/C7P95Ey4jaC1sZiOG24kSKUt9jPN7675iVre3TJYYtSsvbtM92rP/HsSaxrLXmZlB
         lr/N8e90vj7n1MTjetKPlkYEztZwFejlFOxpUO8xKEfLtUk98e45TuQ9YmGL/MGeVKzs
         4q/KsSkTTNvDzaRlUFH/0lSrEtK9MUUkaYja2Nf1I/XkQ3PFMPLuH3ZC3RZvxrrnfvRW
         neZDaDBaslDoHc6WA58BgxV6GDZSk7Zz7HwrFR25bm/zMLN70LH0bGwjggQ+RppAlOuJ
         BjjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHHLL2cMo4ERn84bRP1Ps5QQh8GBtJWpiMRbGz5PzUuUTc+sjjKfNlPQVkjGFKTcIvp25VI+0b8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzdYx1OVGY/Di/kssGvdLiViflmGsJpRfAWLXsy/4nt6PVc8d9
	Se1ZPcBZX/Hb4rDhkV5L4qzkEKtERwknOqkI0ERxVKqOcRXo5DLQXVG/bwv0z0TUCBO+HD3qtWt
	nG+FCgBI9g7MAJcNHK0DdT9gIlniXIIA=
X-Gm-Gg: AR+sD12uMwa2/HMnTFroMRCWKlvxM0TCI38sq2yOOCpEA0heZQFHejP4tMjAZELn3vM
	0tNGubM7yS3Gg9yC07iD/cODuLmAXpOiKYMu8qVnhs9RwrRt5+grrykjb5q5rKbC8xkggbR7bxv
	D6ao8u4ENj0rgjDuWYrvJFDJgWUQy/lwEHsMZ1r2FtlQ27OBSs8NMcQQcdpH1NTHzfAbRIUUaLd
	eidpm3B5rQ1cp0cfXcP0jgNyGknQObGuwJeUUhYPk/ADqsW7pdjWLkkZbubySPPp8M9O6cyQy2h
	FlcJl1PgN4UqYci0ugO58XeaGNAsw145hAjj++Qup6N8X+LOlT4tEDSeJYC2llVi97EUWWcXqe0
	f1RJJV9hfepv+XDcRNtv4/LttK+9k6eojJxXNnT2O/2fONqLHhgMfP6fs
X-Received: by 2002:a17:902:ebc6:b0:2c6:8d95:fd7e with SMTP id
 d9443c01a7336-2d047d1e722mr119237785ad.6.1785729959704; Sun, 02 Aug 2026
 21:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
In-Reply-To: <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 11:05:47 +0700
X-Gm-Features: AUfX_mwmWkehn7fn21ZthpV8C77-8fEL16i2_UDhIMxxkiWDLccefzmHbHrgzbY
Message-ID: <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
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

> > The current caller does check the return value before using dp, so this
> > isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
> > measure, consistent with how core helpers like _snd_pcm_new() handle
> > their optional output parameters.
>
> If devm_kmemdup() fails, spacemit_i2s_init_dai() returns -ENOMEM. The
> sole caller checks the return value and returns immediately, so it never
> accesses dai on that path. On success, dp is non-NULL and *dp is assigned
> before the function returns.
>
> Therefore, I do not see a path where initializing *dp to NULL has any
> effect. Could you clarify what case this change is intended to handle?


My intention was to make the API a bit more defensive. While the current
implementation only has one failure path,  spacemit_i2s_init_dai() may
grow additional error paths in the future. Initializing *dp to NULL ensures
it is left in a well-defined state on any failure.

It would also avoid leaving dai uninitialized if a future caller accidentally
skipped checking the return value before using it.

Best regards,
Phuc
