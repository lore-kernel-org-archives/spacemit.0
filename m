Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05B7304BB3
	for <spacemit@lists.linux.dev>; Fri, 12 Sep 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679462; cv=none; b=WzlLFSCqTnUTiu0comJCRlOX1zTOe7St2sU+9tQNgZseS7p0RwBCX4SLfph3GaWQyIs0jIF2XmMtg1k3ZduGh57dvZxE7PHJckOrtyuWUlXEbJWRL/+ZlFs73Sd+/GmkoLCi7NHK8xRBMXPsZUr7XpBQz3ER7+3FyYFWMEStluE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679462; c=relaxed/simple;
	bh=pd4aahjlhiUPcExV+Rbm+9NlrXRPwfzHUZwRcgIhFKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1uUV1jvj+f+M+WjW+u2GMJ3xv+JeGJnPqE7ECqzttE5p9Hg1C6ILkfCgo4QHZsv8udZXBeyWPKOj/0byoE9V3BOqlHkGRgMLavsLHZeETTp9TuZ0+HwbUQBd6XkwBei3KmvLJkDTODxdejRbmImV1xfVtVo/taIcslOFXdOl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4b7sSd8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4b7sSd8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-244580523a0so18369835ad.1
        for <spacemit@lists.linux.dev>; Fri, 12 Sep 2025 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757679460; x=1758284260; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=e4b7sSd8vjNC1GB56v4OuT/1u2ZzDGOTHWswkPwhQTd/MueYJh90B4LPRWnKaMqnq9
         hMsrucLS+FbttOzx4ZVfYKurtJAFAyLZAgYP5kI1z9w2a/G3VWzZ2gixgBwkCxbStzGZ
         9zqK0FdAQcyL3kB7sb8yJHetYjNyAObgV6cpuUdLmGtyuFV27J22qqsN7mwuZPq4SxYa
         1Zr7emKv6V/8C4QC7G7OUez/JC7mjYGKbEi6jrS9+tuVOW9mhFdVpSPOw1BAxPqHqubw
         h4/FOQXdqryETiZS6olxF7ovspvsZXutNwnxYvo/c7djTl6dcgXNz7yg5Lu4QkRNmF21
         mufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679460; x=1758284260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=hmkw/rB/zDIb/M7CDzwumMoDv0lYCmYipbItK2S0P8meiOoIbOt+p11kGDJ5rVUraR
         GdTcdEajsulw4DUJXQYS2PcVZKDsXKyH8T6RA3yszr9mNefPhyF0E4cvJHGUsE9uAUmE
         wro3R8LOmFCpzqw8LTF8GPSGJHcAXqE3T+7dqb5yg7nlSuSsZj4GO9T0zVqZPKnDroCT
         zzI6s6VzqYoSWBt5JQqt/J0HQ6x/Pd+xnZMrThRe/ppAltoCTJMpkhExUkpdASDIhHwQ
         ywIksBjw7X7J/EvoyElsyy+VS5g3T3ieAtFmoRxyI5hKPokJGRTO5vQzKmFpcUYphHEu
         jyCw==
X-Forwarded-Encrypted: i=1; AJvYcCX2utCXw9hAlKTbQS1I6c6VSQRh51Ypc51/ZJgvUJUFXTbCgdoUpp9ZncpnZIg8KbFDYK2kjNoW+A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr/9B6OtTIyGfBORlpwXxbSf5+VyxsmjJMPFaCaAazMFTBFwhc
	C7vLjKEQKmqRLEGuNeLWwBN7WMojikJBb6t+PfmFYwmygL8vbcjyoTwjSwoZ//w4/5heTeghcZG
	vsr3V8vuX8YPFYfiaT0LUEjddQpb51j0=
X-Gm-Gg: ASbGncu5q+LbBCgkC/KqbS2x3b4FQjqVce/OLvzXwhEm/JzKO6Efnz7ILD1b9h+w3AX
	o+YtJ20qpGEYiH8wfHf/8hy5D79W6Q4Ihz6GRWHW7/3A+v7ehFB4wkPMkxoNB2BgMkW78PfSTC+
	r/u3ckv2tdd4Jkv7/N768f0BFX7Bno9UapsUiCVebruFyLKagavK7o369H2Yjmd/JiNdKtCp5XD
	E9yQA==
X-Google-Smtp-Source: AGHT+IFwtZ97HGjsQnwDLaSscYiXyUyWaZRXiTzaM5M046FWDXCWxB8k2YOnMd3VJ+Y3cvmtimQrX/EgHhgmJ4CE7Ho=
X-Received: by 2002:a17:903:1207:b0:24e:7a4a:ec59 with SMTP id
 d9443c01a7336-25d25678b88mr27471845ad.22.1757679460088; Fri, 12 Sep 2025
 05:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org> <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 12 Sep 2025 11:49:01 +0200
X-Gm-Features: Ac12FXy3daR3VOEp5n6tNwKkhCq--fDPiLYS4w-Toaa60ZTGN2VkMzc0b_ryiUA
Message-ID: <CAMhs-H-1VrKiknwoukGY2i0ox2VNd=pmFrMcR50mn7tEZ0pZ5w@mail.gmail.com>
Subject: Re: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
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

On Tue, Sep 9, 2025 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos
