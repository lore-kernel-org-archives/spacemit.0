Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87B1F2B90
	for <spacemit@lists.linux.dev>; Fri, 14 Mar 2025 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946565; cv=none; b=EZ9ZDJxZBY8gC0A3y5MLfQgFmtpTbygRtzenf8ufcirFoVy2eeRxNiN/2lfPYOU4/S7xl0nrmi9kEgP5hM1eC6NFK17iV2ASCK3WIFZoGn+b9X+owQ6v0nDKncupgr1ybya3LpRvf69ZOHJj6zGZKPD/H1UCh2ZKWE31uHTIGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946565; c=relaxed/simple;
	bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLodn2j6K3cPzfKwl8T8JJ0X+iR8+vQcpM+31fEwgpJrYikEBiJZCdM0dft92yHqIl+4akFaoJUPcFjp2RJTu+2vSEqCgj2Q+2mAYSjUTIu9JAJDUyNV3N6IKAtEczpxSILQNSe/6E3SuL7S1zoiQaRvKKHJYAURAx8VK7mNE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVeuvDRx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVeuvDRx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543d8badc30so2203666e87.0
        for <spacemit@lists.linux.dev>; Fri, 14 Mar 2025 03:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946562; x=1742551362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
        b=fVeuvDRxJjjfStD0XNwWSfAbBBmx3XBLadYcpVN0eWcrdLyoW1TO527qUXNItgB5rv
         4YOqc1PFMUed8Lt9zhOcALVfeAKjA1v7aiq7uHiWyQ84/twHJMHCdlAcVi7TLZgH7UtM
         2CpWAsMSiDDXZMhWUmQCluGC5L3hixKCMMX2WSkwrYPobhviY5a9i9BPpemwdJ9p6xGO
         4s/MmqmlA60lvpbR2soh36XiYOmpKT/2dIhhA9W1d+wN4+pDAsSiivba4vZaPCZQPeMb
         v+RV4zVIQjvQeeKRNAEjPQW7dTpsJOPR4OQHuL4B2xqy39RpIW0zCMUTfoBxJ2HtNIXV
         7S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946562; x=1742551362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
        b=wiuRyn9l0qcjIQZpTTHNBOeqD6KeSe14G7tSOnGxAne7esM0cfATAdSOsMaXeZx6Dw
         F/ziz0BGrqcoaWBCpKDiagDZNvEdfbFSab1R+0S9rUBNrPDOjF3o88qz5Ji7w+Rf9vQp
         i7ot3pJfJcCXL34Ru2rF96G7G0uO8fS7zoZRkMr1WRL/44hwD7uEqnOgafc7k6y5L32C
         CjXJAyISbnO0GVK9wt8ojkpEVjHAJbE71irys8v1xd/SpbAHcKBOBX4rKVPV4Fjo2xkr
         GhIzA1BggAAvQennRdaZQ/NgTj4GhEzds4JOhlbMJ9UacLLIipxGWJYqKep8xVqjHX+W
         MiXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHRD/JRBLaVR/e0CzKqTdh3HF41gIpqX7JggjptDSyNQ1bpvFwu6aLaNUHlFV74X6aeyvRwjEuaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy61z17N6ItpPUn0kZLV+E7IrmIeMFMgMI5tX4r7ff78Ay1vSR6
	967Gr56OX7QMrcLNK6ekxI2mTu/eZ87aXByX71+5NsuHO5zmEiD1L/4NBFpW7JgVXZ0n5Rh0Vi5
	vgd9Y/2+l9CakihZWNADIG2PUA8ROgKqjrQLSeSVt9ZCxyFRB
X-Gm-Gg: ASbGnctUFPXV2D2822h1YtolLTaFR+XtD8wUD48lg2qmwcDF3hGPdT4ihDoHFY2N12g
	sCVRSBmXPuOxSId/U/BbVn8zBRmWKkwDySgxQgKoZKUeSHL+NrSp7xfGu15SUBdg0X8o32A9CRg
	WXy73S4lLARAN1J+Hd873WZwc=
X-Google-Smtp-Source: AGHT+IEEU7fjMObFqi/KtorNaUacAgpVCp1R7kdy9gSMkZkxP5Vzr2YrX/ekX9hw0P90QrGqnfIHas94yzAS0vLKMiQ=
X-Received: by 2002:a05:6512:2823:b0:545:5a5:b69f with SMTP id
 2adb3069b0e04-549c38f542bmr532360e87.9.1741946562016; Fri, 14 Mar 2025
 03:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305102710.52762-1-brgl@bgdev.pl>
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:02:30 +0100
X-Gm-Features: AQ5f1JoBxpl_Z6DDGsIcNQamKwhe2gdhb1zrS5tCM67ikkg1OHhuzYaOr8bu7bg
Message-ID: <CACRpkdYOVoLBwd6N9xSSjufguXzN+9y-Et2uDAQDjYvXyJftCA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The mutex initialized in probe() is never cleaned up. Use
> devm_mutex_init() to destroy it automatically.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij
