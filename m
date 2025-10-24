Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891FF3128D8
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305148; cv=none; b=KPoAEXEaPCZQcgqLU3HoZUm3r3+HwurfouoSC2MbFG4bOlRhbnfJvI9CjDKeM71+qSf3ramdvUP1ofOkDzoOZ304AVwUxAcYYN0gWCmXU1lAkINy+fayXk09DId5qzUvmuJodzQKiqlzILfDK5P4h3DKdPiGZ+FR8UPhJaDiJvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305148; c=relaxed/simple;
	bh=ZAs04S7e6L0yM5gZ4z8BuM0hDmPUY26t3U7lZ2eGr+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tsIbpOoIuqPlhhAImmOPP6evUBgFN25clH9remqZ4QBg4Yho4VRBkNdaQRLVzgQc9y1VE/YaclBLG2W7c6Kk/qD775ja5bD7jHc5ieECNcKkjk0mZLfUZffr5oNRFkHUTlBdE0X/omnn23/oMiPVRhd0+YhrOsn8jrNWmdGXkkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mt2oxWiP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mt2oxWiP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee12807d97so1559765f8f.0
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761305145; x=1761909945; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNeE/cHbHg6zZnCX2aCbRT+il/304F0EXYg7yJD4/Vg=;
        b=Mt2oxWiPmiCH9kJ7O3YejuAtYRrls/sCAM5hxNkTm5CljZj3qH6iV/dSpKw5qmdYjL
         XedqErk+CiDOo+a/VI9p2dueLnVDhD+0fA0KZckjwFkAabVYUk3HPtNQfMe2FdFgjjty
         8EP80l0nwN2cwOF+T/ZEiqAZYf1YpCkXhlaLl2mKDhsTQco2zHvZgLa/ki1boNR97K6U
         1getSZLwUCUhJF1RZbQncoEyVvzlZWs7S4pUxtWH3HHcVH7hf/cVn1tDnSrAP/OiPthN
         iHVfUMv9/jKfa49PXQsukOdY4S9z5t/rGcNMWqc7hHn+lNvBlzji5o/XbVQ76vN8TPp1
         BLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305145; x=1761909945;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNeE/cHbHg6zZnCX2aCbRT+il/304F0EXYg7yJD4/Vg=;
        b=wtL7fsyB0zSEG5ch8PMOGwqdhNtgF+kgEfbgmOI6HrgEfXexA+WdAZAwEcU4rFFwwy
         3aFAWvj1JaKtsQ905ejqSNXSayYNo7ivuBTnYH1/EsyHu96FzGA/No6ipLeVDesqlu5Z
         xRd617Mn/vVaJufJzSy4gUXLPIYn1Q9ZNTW82irNFfSjEQnQYbAOnutaRafrhNzi+iYF
         05PJg6dmu+fenRGqNo6Heama2fnAjNpLPfhvHytY1A0wo94dN3LralEdQ314qa/objK2
         uA8uA9vqlbUjnF16nY34SWJv4eQUxAcbX5Eah4IapUQx0UEBdW1IRDSzE1+IF77HXZ8X
         eEYg==
X-Forwarded-Encrypted: i=1; AJvYcCWiGDZkDIyNzdbU5fIdqdf132xKk/kcAmwAntnV3FXffxAGVAPOyiBVZyyxQutEWTexRyYwLECGGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeAgtX2UV5QO/xPmlT37Q5dg1iRTMJ4OyxtftX1Pu9y2PMLHxJ
	S5bdGJDNlibrders5tcjXJJ2xoHJIH1LJXdsfPQ50J8GwpFhP8sZRord+hXtpbEZ5co=
X-Gm-Gg: ASbGncvTt4k4HRn3HG4gGMrR5Z4/IcRxzz4qao2qdaz7CbcZFsuLJDhynbZ5WFa9iPC
	+FJzDexl05IL1sTvAi9c+b0S8hMBLCpD3STx/HJ8UTPlimRkxgdVU1mnTMMAir8DaJbqVGuRhTk
	WVvOpCVVMcIlXFnL1zZ2kqC3vTXkdnJea3oBv0RS2QkTYlyiP4uDKCf08Q7Nx9GhJHH5rJW+bbb
	SBzZiRwNWtGSSgw0IebOMvv+oAXDDN+2W2tkclNK3v4uzk7Ygr7zaInoOlpv03ELGMr4Fvd4fbr
	foj0PYOPGqIcyhEBK4KLsrhauU7zTn9ZRPKYf1bz4BLxhF1jJ51YnrRgni4Zgo/LjOxKgaqR/nw
	awR4z3WUFz+P7k/Txita1ovnOWuYpmkTRpl4Ar50H6hEZH2PL+DtIiOMxCjJCEw45q6MHhALJj3
	/rIoMvaqlRTQpg9YcG
X-Google-Smtp-Source: AGHT+IH4BOOMng7wIY/cWDbuAz1zzM1xjBdhfECUjKsYQl6JyeafHNEV0BuRxCbd43qEQDsevg4+ag==
X-Received: by 2002:a05:6000:2c04:b0:428:4004:8241 with SMTP id ffacd0b85a97d-4284004abcdmr13747779f8f.40.1761305144643;
        Fri, 24 Oct 2025 04:25:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429897e763csm8893712f8f.6.2025.10.24.04.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:25:44 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:25:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, spacemit@lists.linux.dev
Subject: [bug report] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <aPtiNCZ_KBezL2Dr@stanley.mountain>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Troy Mitchell,

Commit fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
from Oct 17, 2025 (linux-next), leads to the following Smatch static
checker warning:

	sound/soc/spacemit/k1_i2s.c:435 spacemit_i2s_probe()
	error: uninitialized symbol 'dai'.

sound/soc/spacemit/k1_i2s.c
    389 static int spacemit_i2s_probe(struct platform_device *pdev)
    390 {
    391         struct snd_soc_dai_driver *dai;
    392         struct spacemit_i2s_dev *i2s;
    393         struct resource *res;
    394         struct clk *clk;
    395         int ret;
    396 
    397         i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
    398         if (!i2s)
    399                 return -ENOMEM;
    400 
    401         i2s->dev = &pdev->dev;
    402 
    403         i2s->sysclk = devm_clk_get_enabled(i2s->dev, "sysclk");
    404         if (IS_ERR(i2s->sysclk))
    405                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->sysclk),
    406                                      "failed to enable sysbase clock\n");
    407 
    408         i2s->bclk = devm_clk_get_enabled(i2s->dev, "bclk");
    409         if (IS_ERR(i2s->bclk))
    410                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->bclk), "failed to enable bit clock\n");
    411 
    412         clk = devm_clk_get_enabled(i2s->dev, "sspa_bus");
    413         if (IS_ERR(clk))
    414                 return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
    415 
    416         i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
    417         if (IS_ERR(clk))
    418                 return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa clock\n");
    419 
    420         i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
    421         if (IS_ERR(i2s->base))
    422                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
    423 
    424         i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
    425         if (IS_ERR(i2s->reset))
    426                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
    427                                      "failed to get reset control");
    428 
    429         dev_set_drvdata(i2s->dev, i2s);
    430 
    431         spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
                                           ^^^^
dai is not initialized on failure.  Generally in the kernel we always
check for allocation failures.  Even when they can't happen in real life.
I was hoping they were going to make a rule that allocations under 4k
wouldn't have to be checked but it hasn't happened yet.

    432 
    433         ret = devm_snd_soc_register_component(i2s->dev,
    434                                               &spacemit_i2s_component,
--> 435                                               dai, 1);
    436         if (ret)
    437                 return dev_err_probe(i2s->dev, ret, "failed to register component");
    438 
    439         return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_pcm_config, 0);
    440 }

regards,
dan carpenter
