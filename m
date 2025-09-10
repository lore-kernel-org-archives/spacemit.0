Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2631076A
	for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 21:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757539962; cv=none; b=cEmB010ZTK0pzq6XETG+jBX2SOXDoBYzLz90/RaEt3YGCcP/rG0iRt7EXQNXsWyfm5S4MXoyDeEdlCUIcWBEKNCFsdaGLRAM6cTyxNL/HatHTjQJYtG+Te+IvbMGjbPZfZ09jdebxlfuxxWsgoLxcQhwAATGz7fSA70QGZzd1vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757539962; c=relaxed/simple;
	bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs9TNikNxEnJd7s6vTO9NTX0vTQQTp4+VAmK9rXQ5Vw7HCpih/XMXL9wFvvlDMueVUrLZzH+XIgM6eRtipyX5SLhb9MmsgTGS776qf9eDtILXQG4UhDJztZ8x+0O8n8dywLor2uI1tR0cj9UKD48QtSNwxZ1hY2CEoiLgdY5T7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Imz2TxLH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Imz2TxLH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so7524567e87.2
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757539957; x=1758144757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=Imz2TxLHsPda1L6pVTX3HgZZBN+yq0c7tzkBPi544ERfifozYivuNuDPnOaXEF+WH/
         5mDP05yDMochM3jyVMG4xsRnOeuPEVAO0q3tARbXK6IZEV2nFp8k9jmXr8a9L7fLar1x
         GlfOisuo9unHuncDkca9AemYlh/XSE9c80gjIlk+MjMLdRq8mhovIX4yfY9ZjIE3qslL
         Xw+bhURei7qlKO5dKH3e/FDQzQhotlDsE3DKPpAIVLsxed8gY5XpV4vQ875QFDP/G7Ik
         0pHT+xJ6Qpyy5FgrlKtnznnGD1ie2ZqDYArh+woIBfeZo9NMhGXcP2deBnzAnj6CSXUi
         FLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757539957; x=1758144757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=Ew5yfnzwjR2OwUWAm1Sx9/91etur19d3rhwWplnpe7NErQ9faKF+hQ4HVjzQQ0txho
         bUbPBlq1bpOqt4fqIEjl+crjgw4/Lixoamx7eDEpHPoi5AKDE0zB87909o7wNtj+KauH
         hMW/SA7DT/XkfGrme5rWpqSQc5wXU/y7z43fq020S+x68Fj7ZGkVX2seOImcsUsDLJCS
         fImg+/7GDPtuZ/hTPU0/8ofuwKlNlXrOhZ8zt4US7gpxZI7YdNUTyYek+AOmVFWIQU+u
         cH/CT4bbe5vcOk5GfaRJzQjkg41qFXVzKBKFWFHh+YY+aM+ZhZigBzYzYyVU0XEpdwBK
         NqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOEoC5rA5xHnHkzc8m5iGepMj7T7LuXYgOILdFSTGvV0OVoqdPNkGKnl3PtIYL5wLKQVViHl2zhA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzez8pIy5Ns75yh916lyyXfvT5n6v5G5fgu9AIRGBjNNd7xCj3W
	NjNd/oTBVKC6AUE9NIA/sRfnC56biPUmdUUkYY02oEmHb2eer/WwHLkU6hb4u5YRN/hMxbmuChN
	HeLGjwxi7TrkO0U40L6Lg0rpTyz9bhoZZebTSfiMIzA==
X-Gm-Gg: ASbGncvnt9t6itMmifSODgQwuFAB9IAXDNsP6ErKZm0ka/c6peNAF+BKPCNr4eRayie
	NoP3lyWaGjU9XpeMPG+nUS6e1SAqHI7b1wXwL30jDNQzJNo6EYE8yzZT45VaJgwYY4O+37P2E7t
	tpT9inWmA1FestjCjuYVGFCkSK6JtR3Bx2nBLrnzS0z6Umu413Er603zqSGR+/ImfAkJrOP0UKG
	AleL2xDfWuV2j9nTQ==
X-Google-Smtp-Source: AGHT+IEDFgI45XU5cTVW9FtG8gM2JjDzoZENa8d1uC1g5vQQ+iix+RIzuYFh88VfTx91WSF4c7ZJi4duHEmeM7k85Mw=
X-Received: by 2002:a05:6512:6404:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-56262f11dd2mr5910272e87.51.1757539957420; Wed, 10 Sep 2025
 14:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:32:26 +0200
X-Gm-Features: Ac12FXzHQO4QoWSTSppUbrZutew2n-HjqWu5POboMsRGiUcu6mJnWXdH0E38Eq0
Message-ID: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 9:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
>
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
>
> Tested in qemu on vexpress-a9.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The patch set is a beauty, hands down.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I especially like where you caught local spinlocks being
(ab)used instead of the generic irqchip ones.

I don't know about merging patch 15/15 into just the GPIO
tree, that can make things fail in other subsystems depending
on merge order into Torvalds tree or linux-next if your tree is
merged first.

I would merge the first 14 and keep the last for the later part
of the merge window when all other trees with conversions
are merged.

(You probably already thought of this.)

Yours,
Linus Walleij
