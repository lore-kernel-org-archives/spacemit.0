Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D870425CC54
	for <spacemit@lists.linux.dev>; Mon,  9 Jun 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479152; cv=none; b=lUHGu3bubZqnRlFKjW8wB9g64txpNuy/fY1UZhVaSSIsIOqWQIgJ+IwAcs9GrtkDgMWKyn54yLWVG+mB+SivuRUADk79rPxMlXHEFqHlpP/yZv67hLbr3miDmdSCo9b5TQVp1K1S2mm0Lt11ex2FoKGaWcVFpTUI+811lP9CsGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479152; c=relaxed/simple;
	bh=tpgFqrLkSn1DVjpGW60JOm0C0+VLH7tHHY59kM5bL/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3zVrKNTG9D53iz6Tm/2m/DbMsbGhyUr8GSnckNCEOA9y8mSnNf3fH0bSEdKW/ADgdIdgz4/89pT2amq50Whp8uTgewe3HLpBLusOQc3WxBGZQjEy0WahSamfNZK0Cwr8p9HHtDWinB6VIq6xh6/4bWZYjFDSJ17Mpx/OaGkyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvcDjsi3; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvcDjsi3"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e81a7d90835so3054426276.1
        for <spacemit@lists.linux.dev>; Mon, 09 Jun 2025 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479150; x=1750083950; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DHcPIW+FNlaQudxh/1xCvJS+KJ4L+7fwYUL5LAEe78=;
        b=gvcDjsi3Uosb6fCd18Y9Xm+Car0oYBJuq2lVFmmhOGNm2JVwT+GFH/9C6QNKtkFw88
         pXiPn/J3GhrlSVCH/z2c8uwS/tocg9pz76MPgDPRAMIpXHojV0UEvbXikClbWrHhM6P/
         JOzm2hn7sOue/eMuGHV2VikUPq+0vhlQmX4rbb0/JunNxp2tu2UQKahhiafaPjEcsP7o
         tDySGH4yZAM9yEfVbyuIn00WcygM+QPmzN6sWwecPGYYglQ+sjO5eLMepzWPE9Xlfo1b
         6Ive+lA05CiJOfUxgr9zDZKD5q7vxl5v93O9kXH0dYlHo4UHpOCxQv6UpZEK5cP9NBTp
         PmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479150; x=1750083950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DHcPIW+FNlaQudxh/1xCvJS+KJ4L+7fwYUL5LAEe78=;
        b=sX105BhiRmmi/pRBKKnOkn+oNdYp76dAYujT8DNROXD/vv5g+wNf4w/Fhs4Ecz/L99
         T4myO45FDtmzFmSG8SUKgYQUQtrT9S0lpW0pUtxzVrdYmqGjjgTce3OkQG4IUtoz03JU
         LtLBMLkPtv6O4YuY2AG1i1iXkWZ3q4jk+9IboYMdsl6Dm+feFXsHv+5we3cBp6lQ+XWo
         /UT1lAjVo9LMFaQbIVx2bbgJQSECp+KLMG6zfhCXlsaZmS4e9Lz873IisS9l8fhEb7Mp
         6K6ui/go7KQJxwKVD2roVBX20pcQHbe9vcwwGZK+PPBbxtTpLB5rLLuvXcas8gBZMslz
         8BGA==
X-Forwarded-Encrypted: i=1; AJvYcCUzTzmy5vGqqswBMrIM9AFqrodFqTeV+z8pqJJKwfI4409ZN8RRqONLjyfJUx4DRWp4c+W/7/tU+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGjt2XAB3yll6eb4sh+rGwI8+AAbUf4y6vD/AddOrLm++kxbVh
	BBaX7hA4IajIgIrT/QQIXs5D0yKrZuTF/vvmD2eAnUBKCgO4wHcwiEuNML2JtgWL4E7QJs1AC1N
	wMiFkBqyZtTjJeIhiH5WluIM1q0TXRtVKMf3uuTlFq888pHfYJvWoVaU=
X-Gm-Gg: ASbGncvbk/T2ZbzcVKAQc5yCKbGZ6HmpvdwCnB8kXOPESlUut+VcbuuUW70tfwT0Ntg
	2n4D5RX0RN+nd3JuRHRzdFF/aX1JkeltSgRrddkYAQpZ5+sFM+ElvmHe6qEKKPZynZQE+e1SX8b
	ZEaIDXhUxHCbTkV9YyDi0Temvvt+0yESUOQw==
X-Google-Smtp-Source: AGHT+IH/Pnd5J+NF0FnDZghYVyvpxu7EjsURZfHbZf+7AxkvSsyWy0aeXxECpBSIWdWQ+pB3LafvHHvF9PpdbwIrqGk=
X-Received: by 2002:a05:6902:2686:b0:e81:cfde:3d46 with SMTP id
 3f1490d57ef6-e81cfde4149mr9130040276.16.1749479149876; Mon, 09 Jun 2025
 07:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aDVTtQdXVtRhxOrb@stanley.mountain>
In-Reply-To: <aDVTtQdXVtRhxOrb@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:25:12 +0200
X-Gm-Features: AX0GCFvaiXF4lOm-GilksSFMvid8SMz438Y_wsOtUwqxJmS3jsDnPCnS_PeSI8Q
Message-ID: <CAPDyKFqMmOUsEWjE7X2oj0Nuc+FU6g_0p=+JCQ8xgGXJXNN-0g@mail.gmail.com>
Subject: Re: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 07:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> If spacemit_sdhci_get_clocks() fails, then propagate the error code.
> Don't return success.
>
> Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-k1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index 6880d3e9ab62..2e5da7c5834c 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>
>         host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>
> -       if (spacemit_sdhci_get_clocks(dev, pltfm_host))
> +       ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
> +       if (ret)
>                 goto err_pltfm;
>
>         ret = sdhci_add_host(host);
> --
> 2.47.2
>
