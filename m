Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F936C593
	for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482588; cv=none; b=t2opVvowq3mp5rk2tD/vkKTpWxKH1jjk02FxI3PsuNN790ClKzO9uxVelm7Lq5151CtTrN8S91vXz3dJTHHB0NGqvSd6Sou8IzUpsdY/GrSEHqDacOq9XM8Z5i+KS4L/uO9ofkqErbZe91ewgmXN6QAw+uP0wehgdN5g3iCn22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482588; c=relaxed/simple;
	bh=btv3uPBsVnXpVNmS4qDs/R7pyu+51TWUj9EIVRnOgio=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzNUkkCoeFGY/CPTVDW4VPV7rDefwavtOesNIFytjrr0xVUAu/dJAJclIW50BLdurJxrIm3PVFTA2Uu4xkIqe4kc8XAlpXWSsgaTCDMOeuj0QLbkKIPW/uyUSTuUC54TjI0H36yQ0wWAoUqekYaNpZVWKLM1u23rjd8OrxvuAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=NA23H0BR; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="NA23H0BR"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 56EFC3FB5C
	for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763482582;
	bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NA23H0BRIHHg4VdBucuTrC+dBTTq9NQRQotNCm44yEeHuwXYI1R86DbMXnuG6/I0f
	 w5CedOqT7oWnsT8BzRV/eV+MTnkdEeFWteaDqsMCSKkTVd8sR+MlA4riZgJYjPnj4b
	 8zDxnMpYldgCkidZsOqBuxWNra+GHso6H6QjsgoErt5PFlbUuezGCVUDsb2XcSjajZ
	 fELUsraU4iWMyy0I6/zY6v2rHGi8CsloAzSBuyx2mlyqJmOqvzoCjMCwoJIGq8ssUP
	 27pX6wZL91yj3dcLyk/S3FIXh/AE12+TJUKB3F09GYDBk400+ZPqn8MN1VNqQxvrfL
	 xqDkoGPjLnrGt6cqobEdXjlAyL6NttDfRP1UtksjM2J2qHVxGbiDbpqYwIZuyge1cn
	 thcXSnOqtSIrFZ1dybbZZpZc2BPc6ehTUvZtG+kr4FTlv2G7XcRdnvLTNJCpJ2u3sx
	 PVoFKPq1kAnfs76dCYE5Q9H9GSjme1u4llmOautmshzZFw7A5reUT2XvI9/UvsK7MW
	 cZqvu8Rp5dxSFa/HscRzhJjgbft2ut+Nwuc5MEH/LN+8ObSbWT4L5qfK08OG9/dKHR
	 BuTWEueC+Teud0k+aTC+7KkuWCF0UsJlo5ffrv9EOQm5OBHgEAH2xa4m0p1tyl6MfP
	 KmIRj5xIKgEIHNj4dIJUAmEU=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b70b21e6cdbso543317566b.1
        for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 08:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482582; x=1764087382;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
        b=wflE2lg+0q2NXzZtaa/+ScmYL6rSLExTvOxIOoGn0l0gYO7eeVt6stox9F/XVC4Nwj
         rxrQh4QJ+j/1zcf347YnSvndbvww2c6OeJz7AjvCo1VRqTR9pUStAD7ncXN1WNSukbvz
         nfR45uR3JiiPlpS3ZIT43LG2rDSw1ZY9ADJpZM+9Fbf+SlPg1WJwP3Tm8sthyyrif4y3
         8FX/XAG3nk+xVWktV9m83VwRdLfBvsEirQ8sKUJXeWKlh7Dz0vg9B9+Yaydc0zhTO8RG
         UkiIpy+/H32NUQ5GUW4Cn1NV4rVhmfWA1h4ZWrm8N354Ji3s9gz0ZXXHDw8uK8ZHZl77
         NsDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqaz8NBdrL2IbnI4aFehUlnmGrv+EldhvHYonLWuI4Q6hq97eTYZfm1YbDG9NOoD9ZT3rZV9rQCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzVezuPPTrV9J+rXLqqQCN8zqDMpipmcvgVm2LBue3CaQmbAbm
	UkyGOzMpFSFK+fsMJ5ZVTNfKF1CeFF9wApTSEG5DQcRriLoQSd44OeBzC8gxc24L9SmwC+wocxd
	ax5gCsvdNDXzNv8y4kfNNggVL9fE4Oeny6z0yl7Xd7v7XJzU7wZtm0X6GgTbjGPfOttgtL1sJA/
	L7IoSX7HL1EmSbORd59vGptnf8I3bQzR3ZPm9B2+3o32wBJNmEADg=
X-Gm-Gg: ASbGnctoO4f96gRcJ08opj/NVKZC3n9Ak2mR6h4D0TsAHf4eRceGRYEpAoEssn4H+C8
	xCkdhwZxqNFXXTZb/KoLymuVghGn5vEnUTF63xV14ynlVEPHvFArYRtxksdimalSb/WAQAelXp9
	EEUMUQlACggnQfiF4qMM/s9Qf6RzkWIhoeALKgw1gNzrF8K0u/PhFtOg==
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id a640c23a62f3a-b76346ef9cemr3649666b.4.1763482581777;
        Tue, 18 Nov 2025 08:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBn7K4EsQ1/VADA/bQzwH86ZFXAYwYh29/z7evvXjdMBNS0csaU/n5+W/6S5nKTtDNtgN/9vlYqKGmpyFhzys=
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id
 a640c23a62f3a-b76346ef9cemr3644766b.4.1763482581386; Tue, 18 Nov 2025
 08:16:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com> <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Tue, 18 Nov 2025 08:16:20 -0800
X-Gm-Features: AWmQ_blHnUdEuO_Xk-xLGxCSBj91WsT4QrqSPcs0Pl7bY6VmfVJn7i7Sg1yCEAQ
Message-ID: <CAJM55Z9Ep6xAR_TP+dCrSqWWyk8n=31-W3H4Ad6BkWUAWsbObg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
To: Alex Elder <elder@riscstar.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Troy Mitchell (2025-11-18 07:08:08)
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/mfd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
>         depends on I2C
>         select I2C_K1
>         select MFD_SIMPLE_MFD_I2C
> +       default ARCH_SPACEMIT

Can this not be default m if ARCH_SPACEMIT?

/Emil
