Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5545234FF45
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836764; cv=pass; b=QMlQtfyK3wilqFHBXbgkdpyHIhGpZ+nXrfOzL/A7GYJZ6ueWyF9bBmz7z0pi1UeOsyBjqjAlxBlu8P5pAygmaR27kO1B6fvzju03sKWC77JfOk/ftnVDcgJ1AFZACODo1pViJdFjII16W31M5WMS2Nqac8YDJiRyRMt+hxsDigk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836764; c=relaxed/simple;
	bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyiBlp51unphgB9fT9VVo7cUt3McT8EHOltHhhs+/soDgVu2m1hn1NtYZkAqSJKPp22/ZwcTWPoX1tmIpWNJlBcRnnwe2GZ7BBcmFZ9blmEZIZqZZEtYYAgLJTKH2g4XsDbDnAz03K55SxrC1vLLBsdSb2LE1ZLqsbc2NFPwHdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+dOQhLo; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+dOQhLo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d0407aedd6so48606005ad.0
        for <spacemit@lists.linux.dev>; Tue, 04 Aug 2026 02:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785836762; cv=none;
        d=google.com; s=arc-20260327;
        b=ATcB+6FhbsW5Gowt5xin9sgaSpyLh7AnvUA8hSk5WtCjx6mWw5Iys2EJfN2XSzqn8m
         Xd7Tn/AMnOKoZ+wWqWDQ/yMd9u9UYtW+JgoLgJ6c5LYm8/BdhFg7XJ4Q6wxwe3Shr6qZ
         +DcY41gDzVMPJqcS8pzc5D7kRZOKHIWJ9mNAR4EmaaZEAp8zIuMQE2wBXQygH2vLKfhb
         twub3gPY+s5aoSRmNq/yy0mK+YKTHFVM+nP2sX08RjQy3CQzG+fYpWhkLWLYBEpGRq08
         JBkwqlOMeg5pt18bRKDqaheMmwP5LmM08hyaBa1TXuyhkDHYBVIJsHY4LsoZPILGmhL3
         SBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        fh=Ywq3uGvk5OjWt6Hp2C0MfIi4ShD8b/DXraWEiveGIQc=;
        b=OK4pZlWWMJrVYTuP0BG80OHt6MGRxh7uJo86mXdfjza+uq8adjGWh2Bdgpn7rbj2d0
         WD5cwDmGMtJHNdgzGCXuqzZ0txHLS6p7GviJyrHXxer1AxcqDOEmjEtYe9V1yxvFiJIy
         CYKl/crWBrxijr4LOSHsdw4QJM9fRyvUBVVRJZ5srAyL6xA2e9tgU5STtOYVmLUTm53E
         9GFmlaeqE5ts/CRnlHzVynwTlnwlW87N2B+vhFIGRjMSeVUEzR8lZO5DzN49lX2Esws5
         bRkgsxChYdVkuu4nRIPyX8UQUyOh8VlmikGGiz12r133zOuLL8IRLZlC3Gw3V3xAc/BW
         BBsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785836762; x=1786441562; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        b=J+dOQhLoqX14Zd1Kdkt8ix7aKmF4Px8uEumDFXGoLbydRDQEQlhb4AHFgp0qGB/ZzY
         PSjEPM5Lt2ythUh1EordCe5OU3hCUC1bTpXP6ff8JmXysMmi1xKAuZiJyoFBYThUXpFj
         lDA7t6mn8YYDOUInMoC8MI/pvHAwlvUVm7TAmiyiYHrmgP3gZIDkuknc9SY0IiGZDvSe
         jFsoKyNclGV7fZIjCTzAwZoctAv+R9N4hp/fgVzYGFzscCTx853Y1iAWQDY18Z1JsLxJ
         iqFfD+9VfYSKyIFIe51Row3YXFtM+hs3ktkU+da2/3jdi/+NYf8rkVTxxdtCGWX3pkNQ
         HKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785836762; x=1786441562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        b=mw21BnGqQQsDHSL4AypJSRuGA6HQUFEDTb/EFraG+P7NE9juT2cyDjgeN/8WIMbYP9
         bRkBYNM5+z3/R62HyJHssWysnPvssUGj3C/aVb4+gFMv5pBceZneZmFQzAgOesdn1+hS
         y3mBX6uLlVxGBM7c0nU0NOc+RxkaHUwoDKtEZ+Z32oU65FzvWeGzf9GirJ2SeeR8SZmT
         3fKdEG+JolZArAx06O+AKrFk9B3cSbOVY40967zLX7Q30/WlDaDDVcRm3G9FdlC3yc2V
         wpLnDFCuwoP8XiyC5CnHQrzNIf218Mu+yzZCO68bLxmDDVw3Ok2xcTSxaWf4oCcXghON
         aspg==
X-Forwarded-Encrypted: i=1; AHgh+RpCvQGHF/1ix75W0pOwFsizYiFNNhaNoDnl/ClDmsxqB2jMF1Wg+pcvI5NOXg6Qfef8FRUcQg153g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxC2ly10hETK3fI9dDjg6hV9/lZg6GlILkUz7RREVJlITc6kXSf
	NeKEmiZRqecIePpJB56UB+z4fbvntqEd1ocVjb7jYq7WcyMn83V0cTu/reGn04fJoara9EKnaz3
	ul6Cf3UqXuzGOd7q36Ry2PTOGwzrj8/o=
X-Gm-Gg: AR+sD12BEyptbvazmA6lKUoqmxqbMI5pO935f/U68zIuhdqw/3VeEjbgbhkesi75oB2
	TWe0cJyKjl+yH1AR2Sb2aFl94t421WHocI6VgFAcJWvhDrSP5TG/qvvSlBNUolElS7DBZOqtR/C
	LeAdYibjELC8RlaRLrPpXjwJxy88Kzd9HeuhJXG+RRM04uweDGzbbug3Y/05Sig7lKKqA3wAjQ+
	J3gTg5gfiQtFEVAF63QxYw2RU3T4ArlJPhipYHWIteydfyseq07j28XKtzLaaaSPt2i7/0hAes/
	b99juBfru952lqK/egsgJUxomkVsOgrueDxj5u06F1EuvZS2RoGP/5uwuPOGlmgDjMJ2mqTL+kw
	LGMr8lv7pzhBu6BXstrjm4BiP+KafqYHznyMu3wNvV/u1R+ls+LJu4U2Maw==
X-Received: by 2002:a17:902:ea04:b0:2ca:3df2:919a with SMTP id
 d9443c01a7336-2d0524a6a14mr133306145ad.33.1785836762473; Tue, 04 Aug 2026
 02:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804043036.22065-1-phucduc.bui@gmail.com> <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
In-Reply-To: <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 16:45:51 +0700
X-Gm-Features: AUfX_mzLmpOk076Xm-y3rQ56B_xdDiTseD6kbd_RoFN_z5sig_vDzkkt73AmOmY
Message-ID: <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
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

>
> Initializing these fields conditionally preserves the existing
> capabilities for devices with both "tx" and "rx" DMA channels, while
> correctly disabling directions without a corresponding DMA channel. The
> added rate_min and rate_max assignments also preserve the existing rate
> constraints.
>

Yes, I agree. That's also the conclusion I reached after reading
rockchip_i2s_init_dai().

>
> With the current static initialization, channels_min is nonzero for both
> directions before dma-names is examined. snd_soc_dai_stream_valid()
> therefore considers capture valid even when the device only provides a
> "tx" DMA channel, which is permitted by the binding. The DMAengine PCM
> code may then create a capture substream without an RX DMA channel and
> fail during PCM creation.
>

I traced the probe path and confirmed that snd_soc_dai_stream_valid()
is called from soc_new_pcm().
However, I still couldn't see where a nonzero channels_min alone leads
to creating a capture substream
without an RX DMA channel.
To avoid confusion, I'm referring specifically to the DMA-based
configuration, not PIO mode.
Could you point me to the relevant call path?

Best regards,
Phuc
