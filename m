Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D13233140
	for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530284; cv=none; b=UhlkC3nNwR23ORiSBQrr7mU/hqRD8XkOlEwl0Ig7HUDRmPbVQEIc/QUp/Yrk32DNYLCxEA7DO/iS1cKxj9De+7GWXDZNh90xOqhjCzlUTL3owvqDBfN5Xs/UqRLt/ZR4IgiGZiFCRmhr+fDEe6TkyFBWqCmdXzody2IEgWRtvo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530284; c=relaxed/simple;
	bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVL71MOSuB+9UU4mDZ9BKUy+DYKN3F7zTaY7WL8fPfn9QD6CjNfOriA5lV4nH9P1iJCfBgnjALE6xU9bbAuVuEZrrltDpnYtxDBvo+n5yg2p5/U2sh02C1Cp8Y2giigUU7SSQF3RWqddnMoX9f0F5/eT3tITATeUvQoTo2VekWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBI/vLMm; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBI/vLMm"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-333f92b4072so32055231fa.3
        for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530279; x=1756135079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
        b=MBI/vLMmoy2AEAybIxGwKpVNmbFB4ehkwlZG7Yj/sLkpnADiYgsnSdCV9mTPTFJ1GE
         8g4tAQ6GNs9SAz8T+BE69THiN4h+YTL2ht5eht054HxDjxNHkdGr0G6sEfHJkZw0bOZS
         LXgSmMhHOw3HRdTAbwsKr3puwRrRf2Tqr/ue367I35bEjnMZPRy8xflE7jTl0qSMoHZz
         my0j/raowRaueNZSQw/wkwX0kQSWdoweTysMJuZoLgCLz44TjvI8TUSng7lIK53O9ny6
         JDGdzzOWFpO/Z9bPNSf0APASoVJ46ObB77dvGVJl8K4yKCgTGGwJ9WV4ZB1AWEDbrXFg
         Tonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530279; x=1756135079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
        b=lQeAToV1rH/DiL1uh/NF7xc59n0wCRrIU5OwNUpzTPJNti3ot1ff+Kuonf0SPNSPRY
         F6Zq+7apzWtmp9bF0e76XGWYdTbGYkMrfB9Ri1ZzHYZ/x3EC2g8ZxS14XXiYdWm+DFgh
         CuhWTilEGcoFw4/IPy2ftkmoa91SrhmIP1ZeXUE5XSB4nRPOowVSW3NBZ/TFRgpZn3IR
         MTiWR47wXJltiNxt6r5lTMhJFezYDi7wqxAbuA5EycOsCEAlA/rrjMbnxVviyHwUCHlJ
         q/iYUJogiy0QIlg6OShjvnnG2rA/2gcGi/EskdxMj8j9aX9UoluJTHGUHEApeV1kbTzn
         Bswg==
X-Forwarded-Encrypted: i=1; AJvYcCXtIoLL3gDxYB6lCwmJLL0F1fMYVvboG0qZ+0GJtycFZdPfqzoa2NyHzdY4YdDqt6LQsAnmtMkSpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYL6u9srydZUeu9Ocx7P4gODIzq5iMOcKt6dwq3Rr2I8s0kDky
	NquATrSLw/pWM5l7uEiXXSUMrA9lRfOTIYlqtGtPEjBxgR5oRPMAhXWnPqXgLZHVlE7/qF9+qbT
	Jn3ByvaBVU8kpcihYQnkyeEL7Vdhg4OV4UEX3PVgQhA==
X-Gm-Gg: ASbGnct4hukdk38q1o6Lb36MO0d3NPTihbfRUkIb08ZBOZNWZN6g1JhebdNQLq4wyGl
	JMCqKylJY7GhJdbwNSO0eAMxe4389RugZtmzcG4Wgsnx5s9cSoEr1ECFBuV+6dLoSKxLPEnZJLT
	Kp3KdfvoGrjiQDOn+KyyAiKzlUx3Yf1FddbfE5KigZl58n+JUKmZB6tBjJafqNM0uVVoDb+ufb7
	WzRQC8=
X-Google-Smtp-Source: AGHT+IHpEkQH4zE8nZNumut6IyOKwzxXwXZPLXikec1wNlOm0bT1vQJ2AuF2DGHtOC/up+K5+uVQHVhxHrEqbksxztM=
X-Received: by 2002:a2e:be83:0:b0:333:7e57:67f0 with SMTP id
 38308e7fff4ca-3340996a3d6mr37277621fa.28.1755530279380; Mon, 18 Aug 2025
 08:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:17:47 +0200
X-Gm-Features: Ac12FXwu4f8Ac5IEmqGAiQiNmOLkl0amKoCINQhS7HVe6tsTOs7Qh5vl8eGuhWc
Message-ID: <CACRpkdYK5-Ga+TpwKSroZN_Tku7R7gwA6LrV52W8ydYOqmLk+w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: remove extra line in debug output
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: dlan@gentoo.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 5:08=E2=80=AFPM Hendrik Hamerlinck
<hendrik.hamerlinck@hammernet.be> wrote:

> The debug output for spacemit_pinconf_dbg_show() prints an extra newline
> at the end. This is redundant as pinconf_pins_show() in pinconf.c already
> adds a newline in its for loop.
>
> Remove the newline to avoid the extra line in the output.
>
> Example current output:
> $ cat /sys/kernel/debug/pinctrl/d401e000.pinctrl/pinconf-pins
> Pin config settings per pin
> Format: pin (name): configs
> pin 0 (GPIO_00): , bias pull disabled, io type (Fixed/1V8), drive strengt=
h (32 mA), register (0x1041)
>
> pin 1 (GPIO_01): slew rate (0x0), bias pull disabled, io type (Fixed/1V8)=
, drive strength (32 mA), register (0x1041)
>
> pin 2 (GPIO_02): slew rate (0x0), bias pull disabled, io type (Fixed/1V8)=
, drive strength (32 mA), register (0x1041)
>
> ...
>
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Patch applied!

Yours,
Linus Walleij
