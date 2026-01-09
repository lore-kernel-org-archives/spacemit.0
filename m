Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79535A955
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961234; cv=none; b=bz+ppi5a8jcQIJZIi+rTmm1FP/3n0FaDNa4vFXBEl5Q4o2hCOOfWTY5wFAkulARvpF1cd80/fMaQmKoi9qYKg4783dnKyirmbOhg8Gkr4rWUbleUAUKerStrCu0o7pwR4JJl9m0o+19hjay7eIXYVYK3gYnYzeQ5moYKQ5rXVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961234; c=relaxed/simple;
	bh=iZMXxod4+roZ3ZATUDhYNOynA14pD/OOmrS9JayfZjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeu0WXvsHhZzIVcFzA7mGLD/+pvoDu7YVrGOk4dTIE9GaRZp8ruJISAXS/MxbskvBmeoolXeuaiJdgzEjjCtgkxmLVbeRabkSzLJfcI0bGts+zoPpc/zxjI+V2rVjZKRpT6bqfCrXQwqAUGRTum1jc54Bi2iKQCeWybPFhuYtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WtHKeG+u; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WtHKeG+u"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-644715aad1aso3646623d50.0
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 04:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767961231; x=1768566031; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukh2GBiqrpSOrFovoNwBAt/J/QmgBGkcNbLsTOHoYIQ=;
        b=WtHKeG+usm4UVeJi5lFB49oe59SC/ZFbauD0bCeT7CnA/yoWuGyPwphAdMYgd8nmwT
         gBgiLfJ3BG3og3Uttu02mpimO0BB+12xyBQodbX0cnnOJPpLCdPO6WmzcUYcCPdHB80x
         wf0bgWwQZm9UtfiTRAm0nch0r2G0nst8ABGpPWz81XDUYpoFJQ3WRQ+xkUkqwiyyfts2
         c5OoScrURkkNwI8IosJFmHjuGiNhyk90Nz6aa34D3wlnHbiaYv7DyG05aUtu0/S2NPN6
         Ru8SG5EENg63Cit8Lg8tT3ebx7QmW8G5L89LVjb8ARbBPZzelqgXfErpjcKOiqxaUNF2
         xR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767961231; x=1768566031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ukh2GBiqrpSOrFovoNwBAt/J/QmgBGkcNbLsTOHoYIQ=;
        b=TEDlaoYRui6CxREvGSnXqt3pGMy2xCU3ECO/Tn2ZBHu1LAA3TTsSxiUWytOlulAFAh
         KDC/xPi8+r5GUxnjpKPJMzaCaO8XMoKRyMT/nzMl+4RklTG0bFFn2febGmRT5enVLQ4w
         4wndXq2UI1E9je/2JKiV0p6HKcze9G2jhlZFhxLjM1YM8nQVVeTpXPkAwrYEh4CkgGW0
         q/WkZilglDvIhRCDAy2AksjyiAtV+5zvZu+pA5h9jUf552mXnMDreoR+DFtYClZfBI4i
         613mJCKIFMi84q1Z6hBf3jsCFvMP8v1ZYkMe9sfk/KHgSNCzdzVzoKfpbasPIbq7Ikjy
         NKdg==
X-Forwarded-Encrypted: i=1; AJvYcCXKyKy6fEzosdyM6Zgm5BweHckbjV7WI3gOBkgoqY8+rSz1LIcgS+N20ZKWDX0vfPkiwRrYzr2R/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLaNMcuH1HzAYweO+M84IX84vSWnBWk7lAHaD3rBAsvC/Jcsnh
	rYV7V1fQn5vbKWnyDKqNnXypus7YWrhregOWeexKFP/XamAPZPtBKjDf5JdSxG68vxToPV3xX9P
	eb23Vr0eH3gy1MGuiUbTO1Fs//Lezu9RVWu25iAfgVw==
X-Gm-Gg: AY/fxX4KlgzfZH356pa1jdlPNZTdZGnoXCBgEBE8MYu14ECM2ajOOlort561fSmESTw
	F0oD+lyeiiGJp/KWuscAaD6zsIWUMVDYSZznZaJfmD6sJpNgtMu1EYFizdKNRsoZQZSF/xZY8u2
	NJ3an15+3ELSXSEiVRbJxte0eQuaeLe9cu9tsrqPdjXybjtMZemcF6C+HmZHTQApZgIoIFMFPWT
	XiNaki9nc+SnV/MX+69aIrn4bhZgJD1yxXLWf19w/nvYUy0KZn2KoVcm27DmZLjcPsjYr3Dz1AD
	llc2IY3tJkU+rZbinx9tpJi7IGiLYAc99mNie4g65/0=
X-Google-Smtp-Source: AGHT+IEhMWcvDM1SrRQXH+l+w0IiP0cunz8wXS9r5P4Z+auaz2lvzOyrhy9URS2jkNUL58e6LoB0ZIxYLGgtVQF/jg4=
X-Received: by 2002:a05:690e:4008:b0:645:527b:bc25 with SMTP id
 956f58d0204a3-6470d316484mr11391255d50.43.1767961231358; Fri, 09 Jan 2026
 04:20:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org> <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 9 Jan 2026 20:20:19 +0800
X-Gm-Features: AQt7F2pX-qHrvIy9ewuvaqm_6fzKWfdXRjphTDvJYELxE1h4Qxa4FZfMO-nJbgI
Message-ID: <CAH1PCMaXW4469pFRGC+HcixO7PGLQpKKJ_Z5VEhHUMdd3DNWTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Fri, Jan 2, 2026 at 3:04=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml       | 10 ++++=
+++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctr=
l.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index 609d7db97822..9a76cffcbaee 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -11,7 +11,9 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: spacemit,k1-pinctrl
> +    enum:
> +      - spacemit,k1-pinctrl
> +      - spacemit,k3-pinctrl
>
>    reg:
>      items:
> @@ -81,6 +83,12 @@ patternProperties:
>                - enum: [ 7, 10, 13, 16, 19, 23, 26, 29 ]
>                  description: For K1 SoC, 3.3V voltage output
>
> +              - enum: [ 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 3=
0, 31, 33 ]
> +                description: For K3 SoC, 1.8V voltage output
> +
> +              - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, =
35, 37, 38 ]
> +                description: For K3 SoC, 1.8V voltage output

Should one of these be 3.3V? Both descriptions currently specify 1.8V.

Best regards,
Guodong Xu

> +
>            input-schmitt:
>              description: |
>                typical threshold for schmitt trigger.
>
> --
> 2.52.0
>
>
