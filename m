Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE483F39D8
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853170; cv=pass; b=ZlQ5AeEyp4ZlV1aVOYRy6Cwgi6iQLEGg0GDb+JUGg/1raVd/dXH0UWTT9eChVx0f8cJ3XahWLDCzC3HmVZXrfq2CumvS7eA0RNGnlF3MCYfFL6OE1rExr6bvAU2DYOsI5NsQMrorGwaxBfIJZxLSh1sa9C88fNwdqA+wPcrV5Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853170; c=relaxed/simple;
	bh=zexJpO5tXmn8HAg25izfUIHU0LdTYmQLXuVMKzDs2bE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hcwkbc2VapYVcPIVXpkkfqvonuerlSVAu01nUAcNPmla8jI/NBW03xGFIlE2zPR0RlQBJKFAg7nVL8r9+0lKjvyaNrZkGIggWbTW1aQkPKesEOtetiZ6LicVYZ8xm6QjYkHdPfMg9g1Hrotc7mLFobcwTUYFBYca3v0FI3Y7oj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFFguoVN; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFFguoVN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso5729178a91.1
        for <spacemit@lists.linux.dev>; Tue, 04 Aug 2026 07:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785853163; cv=none;
        d=google.com; s=arc-20260327;
        b=A2lbEsKwQqkGW79rXh5wDubCfSIIizGJtHPXZHHcVg+GSQq/HTFnggDK7D1ocEhZq+
         d1bz1Go+k9oaTdl45X4TmBLLDC+BqWWbH6bCbUrYRFiqCSlYYeoJyyBX4JQV+eSB21ax
         jrv0GcYHV5wv//brdn/oOBnWjNtLcq49e957axJv9D/bnTb1NNq0/xlKKSnUT43K1ZcV
         UrK2bzhKgVCYbZXnFm7VKU8nCYbP79XVY2YYQJRxpQ1aBHfszcGZlyaFhBJybj+lG+Wk
         XALQaJYVh0E5aJbCK1ExkkwkHCUIDqwcvNX1nbNwsOPNVvlHSxSez24nNFRyhEL557tQ
         TT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        fh=S83/dT6QfFETp5jiJCkCHPjysh+1v+6SBOW6Tnh0o2M=;
        b=JvVUr5H9KkKUls71i+6vZG1g1IPrbOhXdb6Zq/OtgRs1b/IqaSCCFGZcGCdY6UwrNq
         t/5aOnkFvUhTUChIjYQOUA9zyGqiWgGGVh7xYRoTMPn6sxEA4SLX5lYxv3U1h2WFPeJS
         DHVValSwOIYj/6TcA20PHw17vPE5jadyckDT19YA127zKM4a5O9uHpcRr8KH9++ShX/e
         JQq12CNOH4Q4TttfYEh1gEf2y9QkE/ZrZzLO2kU68YCepXzt00nttAWgVPaP+iFGH+jv
         AXcgwC9aEHAXYhogha882nYFeK7lCK3hfvx57Hehy3PZeK7sY5Pafo38o/FD4NWdI4I0
         et1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785853163; x=1786457963; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        b=mFFguoVNFXRHlC1ie8asaNR7sO3zQDnOuZkmAxxDW1YKAgldxVVkDhz56PFONFj0w+
         3gBg5rycqFyhTly/7M95b5z7v+lEk3Edn0hTduv47a7q86PnfDER77UXqXivBG3kRXrj
         jICaAlDROQUZze+3bUg16lVrpYhN67epSCgIUSBQS5WNO6AFP5yGJJnU4iFLXzQQ3D75
         O2ZWZl40LUv14b8Bl6fyGjE16y6RNLMJmNyP7TmGF6xvgWSWZ7W2tiFghPD1yuBbYGP4
         Fb8F3O/rEvSg+8uVi1CYHm0lxPcwkNRy3dW4rKvUISWefxN8Q34fQoq1cRwJfd0Z3qp3
         6VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853163; x=1786457963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        b=mE/bzTQ1RitodgEC/wALa32QyX9rCUq+IkELryZk1XpixGthl96zVxYxQzcf7nVH0K
         YybK3fXnx8jF5gTVApLbw+NteGmvr+c3pYFe/kZw/7SYTeEquRr+ZcjgvsGDyGYCdNyk
         7QzwP+diaicvEjgfeZ/PN0vXv8W7zzvUk5WAmKAcgfkO/tb7noa+BstTcxfLKdOxGuhe
         DndbyVCDoVTJDTx2gbE6T5Duk/CdwTEaJXmouEQ0bg19NsP5PlZumjc+Z7YgktJzZBZg
         L6qvjAt08Zj3Ds4dzy+ruEW2gNiz17sy2e/OFeTtk3TImB8vYl2GV3KTUvRobG2g3Pzh
         y+6A==
X-Forwarded-Encrypted: i=1; AHgh+RqhMcUQeRWD+2YZAsDjTZ+gg4pgvRZYADDKNbB/sEOtdChibTpBoyU7QbBRxh3mf64w/OpfOfc9ZA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd3sPbUjZBZ83a30La5fBZ0y6najwotH/egpFe1bI1KqO5Do7N
	W7tevf0EA/eyHQPaD4kJigNsOADVlXGZBlSOytBTuFfipAgXGuR44eIN0P6RRgHJwu0Hc+Pr4Nw
	3c7sGQXTUbUDl7lqr8LZH8EPgBZlTjUc=
X-Gm-Gg: AR+sD13s1ITo/pCqiTqVtOmpF4KVk1CFkCSyBMfWjIquvElEO8gurzFzohs332O6T0N
	/SdBxu46QwfBBhzxffhUIoIbLyUL378wzVc3VjUZM4qBdnd3DUVOIHrJ4RnNdsWHduhjE8CXi1q
	g9rfB1tiJVOppkLrHeUq+GcpRuEMiWuD4Oub0NPtc8P6S2upJ6BuuyUPcriDtbI9UoE5WNfHKAh
	OqngWtpz6ig5rcOSao82v/4I7oQAI6FK8TZWtgt7auL018AHIdswooahAnsSuOmxI8EH6tIbWjD
	O28YOPp1nxl3trDx5NYExW+U80b5URUMuoFEHTh76jbGxNyQ+++Lu0zda4rYnOub+RwvqorRFAs
	DwDGE1HJUvNSMAWEqR1JtNEYVJ9TI57WM1TNA09mEYoonGCNZfJzIKyn6cAJQOAPr7T/sdOKHy2
	wBDWf/NRhtUioRyJc=
X-Received: by 2002:a17:90b:4985:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-38fbc44465emr15422254a91.15.1785853162959; Tue, 04 Aug 2026
 07:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804043036.22065-1-phucduc.bui@gmail.com> <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
 <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com> <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
In-Reply-To: <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 21:19:11 +0700
X-Gm-Features: AUfX_mx_KW5_NPCjT1WIS_jueD1He7JnKmss4jz44IKDHBp3hMCmxJRzwHiKS0I
Message-ID: <CAABR9nEjZ=qHBHZ6=CWyauOVSnX1isW3Z9+BoSnmvuBBCKHiyg@mail.gmail.com>
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

>
> More precisely, channels_min alone is not sufficient. The codec DAI must
> also support capture (or be the dummy DAI for a dynamic link), and the link
> must not be playback_only.
>
> Under those conditions, the path is:
>
>   soc_new_pcm()
>     -> soc_get_playback_capture()
>     -> soc_create_pcm(..., capture = 1)
>     -> snd_pcm_new()
>     -> snd_pcm_new_stream(CAPTURE, 1)
>     -> snd_soc_pcm_component_new()
>     -> dmaengine_pcm_new()
>
> dmaengine_pcm_request_chan_of() tolerates a missing "rx" channel and leaves
> pcm->chan[CAPTURE] NULL. Once the capture substream exists,
> dmaengine_pcm_new() returns -EINVAL with
> "Missing dma channel for stream: 1".
> The conditional initialization prevents the CPU DAI from advertising that
> direction for a tx-only node.
>

Thanks for the detailed explanation and for tracing the call path.
I don't have Spacemit hardware available to verify this myself.
I'll update the commit message to reflect the behavior you've verified
on the hardware more accurately.

Best regards,
Phuc
