Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3794A2528F3
	for <spacemit@lists.linux.dev>; Fri, 28 Feb 2025 08:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732288; cv=none; b=aHG545RZcujq10CndSyo7Gv0axbWNW8bQ0G/xAHFltgUv3EkKeb/tNmx78BOn9yrsUG/zYl9N41kJUGcGhXLUWwz2Md3rKDX4TNpdgn7wXlZxUgL0KOCJaVmJ2k61IZApxzqI228V/7cyd7+Yp2o5/4ZiYvzQYLJeSHliwQzwZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732288; c=relaxed/simple;
	bh=Zkf8l0uryByZdz9QVPXFiiID4xittvMYr6H6I5rroZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCgGXJkUX/C8Pvqbu7b1WttJ+6yu8NqpLQvYENv/yKU2gR2nhBbwgqVzQoAfGcaHFXDdAF3nFthPfaxcOciFqukHujPAfdBE96wzQUu8IXjKT90OumlCMuHqz9W5mjxxyCz/BPppBV4oAwNI0Ja0Sr3u//buwh9kfTcB9J3z/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HD7EyKZv; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD7EyKZv"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3061513d353so19941501fa.2
        for <spacemit@lists.linux.dev>; Fri, 28 Feb 2025 00:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740732285; x=1741337085; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY06bAcZIeFxZq+rVVGy8xdQWazfVF+gu1V9CdHTqzs=;
        b=HD7EyKZvkPiv1cMEQV4L18xxCQ3jJeM4+hJXhvoDh18iZLrjVa6gY3ne3CNC7pkeFm
         rG+dxDFItDmdcF5yjrqSlPfdS0vwKARiCtygkT+Aw17D4HnL+WiHzRp3ofvVIEsfuMyc
         L0br4EUKqfe3dkhNyEFYeqvnuBFR4R6Z+CcFebOgixoq/31maNQaeo9Wl2kL9qbYGVhB
         n+1Bdx4kNlUiCgPh0nIJg1MVHQT8gBkk+U6tPkvLkY8aIenUU4ZuB+xbYnrmptQ4+yz4
         UjCnlb5oYmfE+jxsRtKVKuAh5OaAUPU7hiFZNZLxswgkTB3wbvA/79E3tsK+mMonDGNA
         Ok/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732285; x=1741337085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kY06bAcZIeFxZq+rVVGy8xdQWazfVF+gu1V9CdHTqzs=;
        b=O4XXVwd00dBbPVOpclSLf90g6IQvTXhz8lMS5oPQobhaK9sqUE9oHIqLpt58ZREjZC
         xgpjXTkbfbwvvWgfV8q7Yl5bR8mR1txEv4aEWzzPTrCM+3YxWGBeUQswRfYzLFhaIRE0
         xT7BuinmMKB7KpW2EHzoSL1zR/bRsTYCSI7KvMk1jDpfBk/I4LS4TwLtU5AuwtHFatgz
         tr7S1W7FDuAiF+IuJ0b6arK67WcvAzTBGWOVwYa6fkLVxJaul9hqaYpztrsRCDsI1GPY
         mwuFGzWPZZhc/9LXwxshn7BLM5Ia/ECNKJEZgc9hj23PezPWLWLQXG5y+Ph8G63Qhp4a
         CgYg==
X-Forwarded-Encrypted: i=1; AJvYcCVGVRdYhXKtIIWnJPhN0a4JsQvc5QPy8iSnmZCHAI6SdrpIUys94AXzFKON4dPX+7u/eZZR5CGFrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK9ApADN2iKVrec4pVNnr1uAug93RdavcE8TB3k3C076CkZ0zf
	KtocmkVcZPEJpRHKXDwHr7MO2JCah6EhED0+Xewt1RE9Jrm82MK01Ra5c/YywgVwtUkZp5Ks847
	ffs1mIAs0RvdK9t/awg5xw57nXogzRpvblM/o2A==
X-Gm-Gg: ASbGncuBmdLxSHAPsSlzTKUEvpvRDXQr9bS77h1gfDBwdpxAnqV6spEg2VK8EYD2QsN
	k3gdrZ6EX/Pzwbr4VV6Lp6g3Aj/a2Hg1XNT5n1g7jBtqNVyCWnWM4NQc/zl07Hkw3zotHyPVkW1
	fFMPzp/ro=
X-Google-Smtp-Source: AGHT+IE62towVdCnTrudnvaIoU1TJ6pTFTYV/chtSrCWTC1Ko1AEApipZL64MrBly6WJNXyhwZwLLXLgsny92LECsFE=
X-Received: by 2002:a2e:9fc9:0:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-30b9330f13fmr8612541fa.25.1740732285416; Fri, 28 Feb 2025
 00:44:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com> <20250227204155-GYA51171@gentoo>
In-Reply-To: <20250227204155-GYA51171@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:44:33 +0100
X-Gm-Features: AQ5f1Jo79JYnCkWBYG5UqJJb1LGSJ1JmSW8NVl43VT942aaOGBkJP3E28SChE-c
Message-ID: <CACRpkdas4TsMQx2Cvu_JR3kTStqWaOt1N+Cmq7nFesMzpGnZ+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 9:42=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> > This function is meant for "twocell".  There is also another function
> > irq_domain_translate_onecell().  Why don't you just create
> > irq_domain_translate_threecell" instead?
> >
> good question!
>
> it's too many changes for adding "threecell" which I thought not worth
> the effort, or maybe we can rename the function to *twothreecell()?
>
> I'm not sure which way to go is the best, ideas from maintainer are
> welcome

Yeah just rename it twothreecell, that's fine, we will understand it :)

Thanks for driving this change, much appreciated!

Yours,
Linus Walleij
